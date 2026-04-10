"""
GUI Module
카카오톡 PDF 전송 프로그램 GUI
"""

import io
import os
import threading
from pathlib import Path
from tkinter import (
    Tk, Frame, Label, Button, Listbox, Canvas, Scrollbar,
    filedialog, messagebox, MULTIPLE, END, LEFT, RIGHT, TOP, BOTTOM,
    X, Y, BOTH, VERTICAL, HORIZONTAL, NW, StringVar
)
from typing import List, Optional

from PIL import Image, ImageTk

from pdf_converter import convert_pdf_to_images, get_pdf_page_count, get_page_thumbnail, IMAGES_DIR
from kakao_sender import send_to_vendor, CHAT_ROOMS


class KakaoSenderApp:
    """카카오톡 PDF 전송 프로그램 GUI"""

    def __init__(self, root: Tk, initial_pdf: Optional[str] = None):
        self.root = root
        self.root.title("카카오톡 PDF 전송")
        self.root.geometry("800x600")
        self.root.minsize(600, 400)

        # 상태 변수
        self.pdf_path: Optional[str] = None
        self.page_count: int = 0
        self.image_paths: List[str] = []
        self.preview_image: Optional[ImageTk.PhotoImage] = None

        # GUI 생성
        self._create_widgets()
        self._create_layout()

        # 초기 PDF 로드
        if initial_pdf and os.path.exists(initial_pdf):
            self.root.after(100, lambda: self._load_pdf(initial_pdf))

    def _create_widgets(self):
        """위젯 생성"""
        # 상단 프레임 - 파일 선택
        self.top_frame = Frame(self.root)
        self.file_label = Label(self.top_frame, text="PDF 파일: 선택되지 않음", anchor="w")
        self.select_btn = Button(self.top_frame, text="PDF 선택", command=self._select_pdf)

        # 중앙 프레임 - 페이지 리스트 및 미리보기
        self.center_frame = Frame(self.root)

        # 왼쪽: 페이지 리스트
        self.list_frame = Frame(self.center_frame)
        self.list_label = Label(self.list_frame, text="페이지 선택 (다중 선택 가능)")
        self.page_listbox = Listbox(self.list_frame, selectmode=MULTIPLE, height=15, width=20)
        self.list_scrollbar = Scrollbar(self.list_frame, orient=VERTICAL)
        self.page_listbox.config(yscrollcommand=self.list_scrollbar.set)
        self.list_scrollbar.config(command=self.page_listbox.yview)

        # 리스트 선택 이벤트
        self.page_listbox.bind("<<ListboxSelect>>", self._on_page_select)

        # 선택 버튼 프레임
        self.select_btns_frame = Frame(self.list_frame)
        self.select_all_btn = Button(self.select_btns_frame, text="전체 선택", command=self._select_all)
        self.deselect_all_btn = Button(self.select_btns_frame, text="선택 해제", command=self._deselect_all)

        # 오른쪽: 미리보기
        self.preview_frame = Frame(self.center_frame)
        self.preview_label = Label(self.preview_frame, text="미리보기")
        self.preview_canvas = Canvas(self.preview_frame, bg="gray", width=400, height=400)

        # 하단 프레임 - 전송 버튼
        self.bottom_frame = Frame(self.root)
        self.jaehyun_btn = Button(
            self.bottom_frame,
            text="재현하늘창 전송",
            command=lambda: self._send_to_vendor("재현하늘창"),
            bg="#FFE0B2",
            width=20,
            height=2
        )
        self.woodin_btn = Button(
            self.bottom_frame,
            text="우딘숲도어 전송",
            command=lambda: self._send_to_vendor("우딘숲도어"),
            bg="#C8E6C9",
            width=20,
            height=2
        )

        # 상태바
        self.status_var = StringVar(value="PDF 파일을 선택해주세요.")
        self.status_bar = Label(self.root, textvariable=self.status_var, anchor="w", relief="sunken")

    def _create_layout(self):
        """레이아웃 배치"""
        # 상단 프레임
        self.top_frame.pack(fill=X, padx=10, pady=10)
        self.file_label.pack(side=LEFT, fill=X, expand=True)
        self.select_btn.pack(side=RIGHT)

        # 중앙 프레임
        self.center_frame.pack(fill=BOTH, expand=True, padx=10, pady=5)

        # 왼쪽: 페이지 리스트
        self.list_frame.pack(side=LEFT, fill=Y, padx=(0, 10))
        self.list_label.pack(anchor="w")
        self.page_listbox.pack(side=LEFT, fill=Y)
        self.list_scrollbar.pack(side=LEFT, fill=Y)
        self.select_btns_frame.pack(fill=X, pady=5)
        self.select_all_btn.pack(side=LEFT, padx=2)
        self.deselect_all_btn.pack(side=LEFT, padx=2)

        # 오른쪽: 미리보기
        self.preview_frame.pack(side=LEFT, fill=BOTH, expand=True)
        self.preview_label.pack(anchor="w")
        self.preview_canvas.pack(fill=BOTH, expand=True)

        # 하단 프레임
        self.bottom_frame.pack(fill=X, padx=10, pady=10)
        self.jaehyun_btn.pack(side=LEFT, padx=10)
        self.woodin_btn.pack(side=LEFT, padx=10)

        # 상태바
        self.status_bar.pack(fill=X, side=BOTTOM)

    def _select_pdf(self):
        """PDF 파일 선택"""
        filepath = filedialog.askopenfilename(
            title="PDF 파일 선택",
            filetypes=[("PDF files", "*.pdf"), ("All files", "*.*")]
        )
        if filepath:
            self._load_pdf(filepath)

    def _load_pdf(self, filepath: str):
        """PDF 파일 로드"""
        try:
            self.pdf_path = filepath
            self.page_count = get_pdf_page_count(filepath)

            # 파일 라벨 업데이트
            filename = os.path.basename(filepath)
            self.file_label.config(text=f"PDF 파일: {filename} ({self.page_count}페이지)")

            # 페이지 리스트 업데이트
            self.page_listbox.delete(0, END)
            for i in range(self.page_count):
                self.page_listbox.insert(END, f"페이지 {i + 1}")

            # 전체 선택
            self._select_all()

            # PDF를 이미지로 변환
            self._update_status("PDF 변환 중...")
            self.image_paths = convert_pdf_to_images(filepath)
            self._update_status(f"PDF 로드 완료: {self.page_count}페이지")

            # 첫 페이지 미리보기
            if self.page_count > 0:
                self._show_preview(0)

        except Exception as e:
            messagebox.showerror("오류", f"PDF 로드 실패: {e}")
            self._update_status("PDF 로드 실패")

    def _on_page_select(self, event):
        """페이지 선택 이벤트"""
        selection = self.page_listbox.curselection()
        if selection:
            # 마지막 선택된 페이지 미리보기
            page_num = selection[-1]
            self._show_preview(page_num)

    def _show_preview(self, page_num: int):
        """페이지 미리보기 표시"""
        if not self.pdf_path:
            return

        try:
            # 썸네일 가져오기
            thumbnail_bytes = get_page_thumbnail(self.pdf_path, page_num, max_size=400)
            if thumbnail_bytes:
                image = Image.open(io.BytesIO(thumbnail_bytes))
                self.preview_image = ImageTk.PhotoImage(image)

                # 캔버스에 이미지 표시
                self.preview_canvas.delete("all")
                self.preview_canvas.create_image(0, 0, anchor=NW, image=self.preview_image)
                self.preview_label.config(text=f"미리보기 - 페이지 {page_num + 1}")

        except Exception as e:
            print(f"미리보기 오류: {e}")

    def _select_all(self):
        """전체 선택"""
        self.page_listbox.select_set(0, END)
        self._update_status(f"전체 {self.page_count}페이지 선택됨")

    def _deselect_all(self):
        """선택 해제"""
        self.page_listbox.select_clear(0, END)
        self._update_status("선택 해제됨")

    def _get_selected_image_paths(self) -> List[str]:
        """선택된 페이지의 이미지 경로 반환"""
        selection = self.page_listbox.curselection()
        if not selection:
            return []

        selected_paths = []
        for idx in selection:
            if idx < len(self.image_paths):
                selected_paths.append(self.image_paths[idx])

        return selected_paths

    def _send_to_vendor(self, vendor: str):
        """발주처로 이미지 전송"""
        selected_images = self._get_selected_image_paths()

        if not selected_images:
            messagebox.showwarning("경고", "전송할 페이지를 선택해주세요.")
            return

        # 확인 메시지
        result = messagebox.askyesno(
            "확인",
            f"{len(selected_images)}개의 이미지를 {vendor}에 전송하시겠습니까?\n\n"
            f"채팅방: {CHAT_ROOMS.get(vendor, '알 수 없음')}"
        )

        if not result:
            return

        # 전송 버튼 비활성화
        self.jaehyun_btn.config(state="disabled")
        self.woodin_btn.config(state="disabled")

        # 별도 스레드에서 전송
        def send_thread():
            try:
                success = send_to_vendor(
                    vendor,
                    selected_images,
                    progress_callback=self._progress_callback
                )

                if success:
                    self.root.after(0, lambda: messagebox.showinfo("완료", f"{vendor} 전송 완료!"))
                else:
                    self.root.after(0, lambda: messagebox.showerror("오류", "전송에 실패했습니다."))

            except Exception as e:
                self.root.after(0, lambda: messagebox.showerror("오류", f"전송 오류: {e}"))

            finally:
                # 버튼 다시 활성화
                self.root.after(0, self._enable_buttons)

        thread = threading.Thread(target=send_thread, daemon=True)
        thread.start()

    def _progress_callback(self, current: int, total: int, message: str):
        """진행 상황 콜백"""
        self.root.after(0, lambda: self._update_status(f"[{current}/{total}] {message}"))

    def _enable_buttons(self):
        """버튼 활성화"""
        self.jaehyun_btn.config(state="normal")
        self.woodin_btn.config(state="normal")

    def _update_status(self, message: str):
        """상태바 업데이트"""
        self.status_var.set(message)
        self.root.update_idletasks()


def run_gui(initial_pdf: Optional[str] = None):
    """GUI 실행"""
    root = Tk()
    app = KakaoSenderApp(root, initial_pdf)
    root.mainloop()


if __name__ == "__main__":
    run_gui()
