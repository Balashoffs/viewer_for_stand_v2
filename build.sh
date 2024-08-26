#!/usr/bin/env bash

flutter clean

flutter build web --release --web-renderer canvaskit

docker build -t viewer_for_stand_v$1 ./build/web/ -f Dockerfile

docker save -o viewer_for_stand_v$1.tar viewer_for_stand_v$1

scp viewer_for_stand_v$1.tar fuha@192.168.89.152:/home/fuha/fuha/viewer