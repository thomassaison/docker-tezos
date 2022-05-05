FROM alpine

RUN apk add curl
RUN apk add wget

RUN wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-admin-client-arm64

RUN mv tezos-client-arm64 /usr/bin/tezos-client
RUN chmod +x /usr/bin/tezos-client
