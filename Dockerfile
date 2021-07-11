FROM alpine:3.6

MAINTAINER Anton Bakaev <fxmonster@gmail.com>
LABEL MAINTAINER="Anton Bakaev <fxmonster@gmail.com>"

ARG DEF_REMOTE_PORT=80
ARG DEF_LOCAL_PORT=80

ENV REMOTE_PORT=$DEF_REMOTE_PORT
ENV LOCAL_PORT=$DEF_LOCAL_PORT

RUN echo "Installing base packages" \
	&& apk add --update --no-cache \
		socat \
	&& echo "Removing apk cache" \
	&& rm -rf /var/cache/apk/

CMD socat tcp-listen:$LOCAL_PORT,reuseaddr,fork tcp:$REMOTE_HOST:$REMOTE_PORT & \
    pid=$! && trap "kill $pid" SIGINT && \
	socat udp-listen:$LOCAL_PORT,pktinfo,fork UDP:$REMOTE_HOST:$REMOTE_PORT & \
	wait $pid