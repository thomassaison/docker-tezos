FROM alpine

RUN apk add curl
RUN apk add wget

ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-node ; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-node-arm64 -O tezos-node ; fi

RUN mv tezos-node /usr/bin/tezos-node
RUN chmod +x /usr/bin/tezos-node

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-client ; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-client-arm64 -O tezos-client ; fi

RUN mv tezos-client /usr/bin/tezos-client
RUN chmod +x /usr/bin/tezos-client

RUN curl https://raw.githubusercontent.com/zcash/zcash/master/zcutil/fetch-params.sh | sh

ADD ./entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]