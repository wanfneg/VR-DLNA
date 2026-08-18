@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ============================================
echo  抚物器 一键打包 EXE（需要联网安装 PyInstaller）
echo ============================================

where python >nul 2>nul
if errorlevel 1 (
    echo [错误] 未找到 python，请先安装 Python 3.10+。
    pause
    exit /b 1
)

echo 正在安装 PyInstaller ...
python -m pip install --upgrade pyinstaller
if errorlevel 1 (
    echo [错误] PyInstaller 安装失败，请检查网络或 pip 源。
    pause
    exit /b 1
)

echo 正在打包单文件 EXE ...
python -m PyInstaller --noconsole --onefile --name 抚物器 --clean vr_dlna.py
if errorlevel 1 (
    echo [错误] 打包失败，请查看上方错误信息。
    pause
    exit /b 1
)

echo.
echo 打包完成：dist\抚物器.exe
echo 可直接把 dist\抚物器.exe 发给其他用户。
pause