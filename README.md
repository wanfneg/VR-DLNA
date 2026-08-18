# VR-DLNA（抚物器）

面向 **DeoVR + 云盘/网盘挂载（cd2、RaiDrive 等）** 场景的轻量 DLNA/UPnP MediaServer。

使用 Python 3.8+ 标准库实现，无第三方依赖，启动即用。

## 功能

- DLNA / UPnP MediaServer
  - SSDP 自动发现
  - `description.xml`
  - ContentDirectory SOAP Browse
  - ConnectionManager
  - HTTP Range 流式播放
  - 外挂字幕 `.srt / .ass / .vtt`
- 云盘/网盘挂载优化
  - 目录浏览零探测：只列文件名，不调用 ffprobe
  - 对瞬时云盘错误自动重试并暂时拉黑坏目录
- `.strm` 代理
  - 支持 3xx 跟随与 chunked 转发
  - 默认禁止代理内网/回环地址，防止 SSRF
- 配套工具
  - `funscript_sync.py` / `funscript_sync_ui.py`：PC funscript 目录增量同步到 Android
  - `video_sync.py` / `video_sync_ui.py`：本地视频目录同步到 Android
  - `tray_icon.py`：系统托盘支持

## 运行

直接运行最新打包 EXE：

```powershell
VR-DLNA-v0.1.0.exe
```

源码模式：

```powershell
python vr_dlna.py
```

## 配置说明

源码模式下，运行时会自动在脚本目录生成以下本地配置，**不会提交到仓库**：

- `vr_dlna_config.json`
- `vr_dlna_settings.json`
- `vr_dlna_funscript_config.json`
- `vr_dlna_video_config.json`
- `vr_dlna_broken_dirs.json`
- `vr_dlna_access.log`

## 项目结构

```
VR-DLNA-v0.1.0.exe      最新打包 EXE（无需 Python，双击运行）
vr_dlna.py              DLNA 服务器主程序（含 GUI）
funscript_sync.py       funscript 同步核心
funscript_sync_ui.py    funscript 同步 GUI
video_sync.py           视频同步核心
video_sync_ui.py        视频同步 GUI
tray_icon.py            系统托盘
```

## 安全说明

- `.strm` 代理默认拒绝 loopback / 私网 / link-local / 组播地址，避免 SSRF。
- 路径访问会检查符号链接/reparse point，防止越出根目录。
- 运行时配置仅保存在本机，不随源码分发。
