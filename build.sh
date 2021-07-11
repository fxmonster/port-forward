#!/usr/bin/env bash

cd ./udp
docker build . -t fxmonster/port-forward-udp:latest
cd ../tcp
docker build . -t fxmonster/port-forward-tcp:latest
cd ..
docker build . -t fxmonster/port-forward:latest

docker push fxmonster/port-forward:latest
docker push fxmonster/port-forward-tcp:latest
docker push fxmonster/port-forward-udp:latest
