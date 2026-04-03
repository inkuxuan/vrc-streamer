start:
	docker run -it -v "$(pwd)/mediamtx.yml:/mediamtx.yml:ro"   --network=host   -p 8554:8554   -p 1935:1935 bluenviron/mediamtx:latest-ffmpeg

start-as-service:
	docker run -d --restart unless-stopped -v "$(pwd)/mediamtx.yml:/mediamtx.yml:ro"   --network=host   -p 8554:8554 -p 1935:1935 bluenviron/mediamtx

