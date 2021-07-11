#!/usr/bin/env bash

docker build ./udp/Dockerfile -t fxmonster/port-forward-udp:latest
docker build ./tcp/Dockerfile -t fxmonster/port-forward-tcp:latest

docker build . -t fxmonster/port-forward:latest
