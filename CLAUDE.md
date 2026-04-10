# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a collection of AutoHotkey (AHK v1) scripts primarily used for business automation at a wood/materials company (신흥목재). The scripts handle tasks such as:
- Sales document management (전표 - invoices/receipts)
- Inventory tracking and management
- Banking automation (기업은행 - IBK Bank)
- Tax filing (홈텍스 - HomeTax)
- Customer service management
- Warehouse Management System (WMS) integration
- Transport Management System (TMS)
- KakaoTalk messaging automation

## Running Scripts

Scripts are `.ahk` files that require AutoHotkey v1.x installed on Windows. Run scripts by:
- Double-clicking the `.ahk` file
- Right-click and select "Run Script"
- Compile to `.exe` using the AHK compiler (located in `오토핫키/Compiler/`)

## Key Libraries

### MySQL Integration (`MySQL.ahk`)
- Uses `libmysql.dll` for direct database connectivity
- Functions: `sql_start()`, `dbConnect()`, `dbQuery()`, `dbDisConnect()`, `escape_string()`
- Requires `libmysql.dll` in the script directory

### CSV Operations (`csv.ahk`)
- Complete CSV file manipulation library
- Functions: `CSV_Load()`, `CSV_Save()`, `CSV_ReadCell()`, `CSV_ModifyCell()`, `CSV_Search()`, `CSV_LVLoad()`
- Supports ListView integration for GUI display

### Graphics/GDI+ (`Gdip_All.ahk`)
- GDI+ wrapper for image manipulation and screen capture
- Used for screenshot functionality and image-based automation

### Excel COM (`excel com/` directory)
- COM automation for Microsoft Excel operations

## Main Application Scripts

- `start2.ahk` - Main business helper with tray menu for common operations
- `일정표21.ahk` - Schedule/calendar management system
- `신흥목재스케쥴러.ahk` - Company-specific scheduler
- `s누르기.ahk`, `s누르기2.ahk` - Keyboard automation scripts

## Reference Libraries (in subdirectories)

- `AHK-Rare-master/` - Collection of rare/useful AHK functions
- `COM-Classes-master/` - Windows COM interface wrappers
- `Class_LV_Rows-master/` - ListView row manipulation class
- `GUI_Creator-master/` - GUI building utilities
- `Vis2-master/` - Visual/OCR related functions
- `vim_ahk-master/` - Vim keybindings for AHK

## Code Conventions

- Scripts use Korean comments and variable names for business-specific functionality
- Common hotkeys: `XButton1` (mouse side button), `#z` (Win+Z) for menu triggers
- Most scripts use `#SingleInstance, force` to prevent duplicate instances
- `SetWorkingDir %A_ScriptDir%` is standard for relative path operations
- Business windows are identified by class names like `TfmChitSale` (sales documents)

## AHK v1 Syntax Notes

- Variables: `%varname%` for dereferencing, `:=` for assignment
- Functions: `FunctionName(param1, param2)`
- Hotkeys: `#` = Win, `^` = Ctrl, `!` = Alt, `+` = Shift
- Labels: `LabelName:` with `Gosub, LabelName` or `Goto, LabelName`
- GUI commands: `Gui, Add, Control, Options, Text`
