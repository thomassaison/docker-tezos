FROM alpine

RUN apk add wget

ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-client ; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-client-arm64 -O tezos-client ; fi

RUN mv tezos-client /usr/bin/tezos-client
RUN chmod +x /usr/bin/tezos-client

# Add docker-compose-wait tool -------------------
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait