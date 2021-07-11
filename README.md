# socat port forward tcp+udp docker image
==========================

## Usage

Define the following environment variables to configure port-forwarding.

Variable | Description
-------- | -----------
REMOTE_HOST | IP or address of the host you want to forward traffic to
REMOTE_PORT | Port on remote host to forward traffic to
LOCAL_PORT | Port where container listens


```
docker run -d --restart always -e REMOTE_HOST=airg.zap3.net -e REMOTE_PORT=28901 -e LOCAL_PORT=28901 -p 28901:28901 fxmonster/port-forward
docker run -d --restart always -e REMOTE_HOST=airg.zap3.net -e REMOTE_PORT=14101 -e LOCAL_PORT=14101 -p 14101:14101 fxmonster/port-forward

docker run -e REMOTE_HOST=<remote_host> -e REMOTE_PORT=<remote_port> -e LOCAL_PORT=<local_port> -p <exposed_local_port>:<local_port> fxmonster/port-forward
```

## Examples

The following commands will all forward 14101 port traffic (tcp & udp) to a remote machine located at airg.zap3.net
in the 14101 port

```
docker run -e REMOTE_HOST=airg.zap3.net -e REMOTE_PORT=14101 -e LOCAL_PORT=14101 -p 14101:14101 fxmonster/port-forward
```

## Docker hub

Docker image hosted at Docker Hub:
https://hub.docker.com/r/fxmonster/port-forward/
