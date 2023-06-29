FROM alpine:latest

RUN addgroup -S kubectl --gid 2000
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/home/kubectl" \
    --ingroup kubectl \
    --uid 2000 \
    kubectl

RUN apk add --no-cache kubectl --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/
USER kubectl
