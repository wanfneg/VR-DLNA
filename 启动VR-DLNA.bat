@echo off
chcp 65001 >nul
cd /d "%~dp0"

rem 优先使用 PATH 中的 pythonw（无控制台窗口）
where pythonw >nul 2>nul
if %errorlevel%==0 (
    start "" pythonw "%~dp0vr_dlna.py"
    exit /b
)

rem 常见默认安装路径
set "PYW="
if exist "%LocalAppData%\Programs\Python\Python310\pythonw.exe" set "PYW=%LocalAppData%\Programs\Python\Python310\pythonw.exe"
if "%PYW%"=="" if exist "%ProgramFiles%\Python310\pythonw.exe" set "PYW=%ProgramFiles%\Python310\pythonw.exe"
if "%PYW%"=="" if exist "%ProgramFiles(x86)%\Python310\pythonw.exe" set "PYW=%ProgramFiles(x86)%\Python310\pythonw.exe"

if not "%PYW%"=="" (
    start "" "%PYW%" "%~dp0vr_dlna.py"
    exit /b
)

echo [错误] 找不到 pythonw.exe。
echo 请先安装 Python 3.10 或更高版本（安装时勾选 tcl/tk），
echo 或者直接使用打包好的 抚物器.exe 单文件版本。
pause