FROM alpine

RUN apk add curl
RUN apk add wget

ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-node ; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-node-arm64 -O tezos-node ; fi

RUN curl https://raw.githubusercontent.com/zcash/zcash/master/zcutil/fetch-params.sh | sh

RUN mv tezos-node /usr/bin/tezos-node
RUN chmod +x /usr/bin/tezos-node

ADD ./entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]