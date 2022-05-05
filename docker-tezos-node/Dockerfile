FROM alpine

RUN apk add curl
RUN apk add wget

RUN wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-node-arm64
RUN curl https://raw.githubusercontent.com/zcash/zcash/master/zcutil/fetch-params.sh | sh

RUN mv tezos-node-arm64 /usr/bin/tezos-node
RUN chmod +x /usr/bin/tezos-node
