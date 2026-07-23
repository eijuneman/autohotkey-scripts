const fs = require("fs");
const mysql = require("C:/Users/shwoodnew/tms_new/node_modules/mysql2/promise");

const search = (process.argv[2] || "").trim();
const outFile = process.argv[3];

if (!outFile) {
  console.error("output file path is required");
  process.exit(1);
}

const like = `%${search}%`;
const params = [];
let where = "WHERE 상품명 IS NOT NULL AND 상품명 <> ''";

if (search) {
  where += `
    AND (
      상품명 LIKE ?
      OR CAST(상품코드 AS CHAR) LIKE ?
      OR IFNULL(관리코드, '') LIKE ?
      OR IFNULL(바코드, '') LIKE ?
      OR IFNULL(규격, '') LIKE ?
    )`;
  params.push(like, like, like, like, like);
}

(async () => {
  const conn = await mysql.createConnection({
    host: "192.168.0.23",
    user: "root",
    password: "tlsgmdahrwo12#",
    database: "mydatabase",
    port: 3306,
    charset: "utf8mb4",
  });

  const [rows] = await conn.execute(
    `
      SELECT
        상품코드,
        상품명,
        IFNULL(규격, '') AS 규격,
        IFNULL(중분류, '') AS 중분류,
        IFNULL(소분류, '') AS 소분류,
        IFNULL(관리코드, '') AS 관리코드,
        IFNULL(바코드, '') AS 바코드
      FROM temp_products4
      ${where}
      ORDER BY 상품명, 규격
      LIMIT 200
    `,
    params,
  );

  await conn.end();

  const csvEscape = (value) =>
    `"${String(value ?? "")
      .replace(/"/g, '""')
      .replace(/\r?\n/g, " ")}"`;

  const lines = [
    ["상품코드", "상품명", "규격", "중분류", "소분류", "관리코드", "바코드"].map(csvEscape).join(","),
    ...rows.map((row) =>
      [
        row.상품코드,
        row.상품명,
        row.규격,
        row.중분류,
        row.소분류,
        row.관리코드,
        row.바코드,
      ]
        .map(csvEscape)
        .join(","),
    ),
  ];

  const text = `${lines.join("\r\n")}\r\n`;

  fs.writeFileSync(outFile, text, "utf8");
})().catch((error) => {
  console.error(error);
  process.exit(1);
});
