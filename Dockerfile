FROM alpine:latest

RUN addgroup -S kubectl --gid 2000
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/home/kubectl" \
    --ingroup kubectl \
    --uid 2000 \
    kubectl

RUN apk add --no-cache curl
WORKDIR /usr/local/bin
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chown kubectl:kubectl kubectl && chmod +x kubectl
WORKDIR /home/kubectl
USER kubectl
ENV PATH /usr/local/bin:$PATH