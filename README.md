# VR-DLNA（抚物器）

面向 **DeoVR + 云盘/网盘挂载（cd2、RaiDrive 等）** 场景的轻量 DLNA/UPnP MediaServer。

## 功能说明

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
  - funscript 目录增量同步到 Android
  - 本地视频目录同步到 Android
  - 系统托盘支持

## 使用说明

### 直接使用 EXE

从 GitHub Releases 下载最新 EXE：

https://github.com/wanfneg/VR-DLNA/releases/latest

下载后双击运行，无需安装 Python。

### 使用步骤

1. 启动 VR-DLNA。
2. 在界面中添加需要共享的视频根目录。
3. 点击启动 DLNA 服务。
4. 在 DeoVR 中通过 DLNA/UPnP 自动发现本服务器。
5. 浏览并播放视频；同目录的 `.srt / .ass / .vtt` 字幕可在外挂字幕中选择。

### 源码运行

```powershell
python vr_dlna.py
```

源码模式需要 Python 3.8 或更高版本，且仅使用标准库，无需额外安装依赖。
