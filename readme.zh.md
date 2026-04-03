# VRC Streamer

一个类似于 [TopazChat](https://github.com/TopazChat/TopazChat) 的自托管 VRChat 串流中继服务器，基于 [MediaMTX](https://github.com/bluenviron/mediamtx) 构建。

主播通过 OBS 以 RTMP 协议推流，VRChat 视频播放器通过 RTSPT 协议观看。推流使用秘密串流密钥，而观众连接到公开路径，因此密钥不会出现在 VRChat 日志中。

## 部署

1. 克隆仓库
2. 复制环境模板并设置你的串流密钥：
   ```bash
   cp .env.example .env
   ```
3. 启动服务器：
   ```bash
   docker compose up -d
   ```

停止服务：`docker compose down`

## 使用方法

**推流（OBS）：**
- 服务器：`rtmp://<你的域名>:1935/`
- 串流密钥：在 `.env` 中设置的密钥

**观看（VRChat）：**
- URL：`rtspt://<你的域名>:8554/live`

## 防火墙

请确保以下端口已开放：
- `1935/tcp` - RTMP 推流
- `8554/tcp` - RTSP 播放

## 工作原理

OBS 向秘密 RTMP 路径（串流密钥）推流。MediaMTX 将该路径代理到 `/live`，即公开的播放端点。这样，VRChat 播放器日志中不会显示串流密钥。
