# VRC Streamer

[TopazChat](https://github.com/TopazChat/TopazChat)に似た、VRChat向けのセルフホスト型ストリーミングリレーサーバーです。[MediaMTX](https://github.com/bluenviron/mediamtx)を使用しています。

配信者はOBSからRTMPで配信し、VRChatのビデオプレイヤーはRTSPTで視聴します。配信にはシークレットストリームキーを使用し、視聴者はパブリックパスに接続するため、VRChatのログにキーが表示されることはありません。

## セットアップ

1. リポジトリをクローン
2. 環境テンプレートをコピーし、シークレットストリームキーを設定:
   ```bash
   cp .env.example .env
   ```
3. サーバーを起動:
   ```bash
   docker compose up -d
   ```
4. サーバーを停止:
   ```bash
   docker compose down
   ```

## 使い方

**配信（OBS）:**
- サーバー: `rtmp://<あなたのドメイン>:1935/`
- ストリームキー: `.env`に設定したシークレットキー

**視聴（VRChat）:**
- URL: `rtspt://<あなたのドメイン>:8554/live`

## ファイアウォール

以下のポートを開放してください:
- `1935/tcp` - RTMP配信用
- `8554/tcp` - RTSP視聴用

## 仕組み

OBSはシークレットRTMPパス（ストリームキー）に配信します。MediaMTXはそのパスを`/live`にプロキシするよう設定されています。これにより、VRChatプレイヤーのログにストリームキーが表示されることはありません。
