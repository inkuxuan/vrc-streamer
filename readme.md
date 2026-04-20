# VRC Streamer

[日本語](readme.ja.md) | [中文](readme.zh.md)

A self-hosted streaming relay server for VRChat, similar to [TopazChat](https://github.com/TopazChat/TopazChat). Built on [MediaMTX](https://github.com/bluenviron/mediamtx).

Streamers publish from OBS via RTMP, and VRChat video players consume via RTSPT. A secret stream key is used for publishing, while viewers connect to a public path — keeping the key out of VRChat logs.

## Setup

1. Clone the repo
2. Copy the environment template and set your secret stream key:
   ```bash
   cp .env.example .env
   ```
3. Start the server:
   ```bash
   docker compose up -d
   ```
4. Stop the server:
   ```bash
   docker compose down
   ```

## Usage

**Publishing (OBS):**
- Server: `rtmp://<your-domain>:1935/`
- Stream Key: the secret key you set in `.env`

**Viewing (VRChat):**
- URL: `rtspt://<your-domain>:8554/live`

## Firewall

Ensure the following ports are open:
- `1935/tcp` - RTMP ingest
- `8554/tcp` - RTSP playback

## How it works

OBS publishes to a secret RTMP path (the stream key). MediaMTX is configured to proxy that path to `/live`, which is the public playback endpoint. This way the stream key is never visible in VRChat player logs.
