@echo off
chcp 65001 >nul
echo ============================================
echo  VR-DLNA 环境修复：禁用 Windows SSDP 服务占用
echo ============================================
echo.
echo 正在停止并禁用 Windows 的 SSDP Discovery 服务...
echo （该服务只用于系统自带 UPnP 发现，禁用不影响网络）
sc stop SSDPSRV >nul 2>&1
sc config SSDPSRV start= disabled >nul 2>&1
echo.
echo 完成！SSDP 1900 端口已释放给 VR-DLNA。
echo 请关闭并重新启动 VR-DLNA 服务器。
echo.
pause
