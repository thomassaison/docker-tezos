FROM alpine

RUN apk add curl
RUN apk add wget

ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-baker-012-Psithaca -O tezos-baker ; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then wget https://github.com/serokell/tezos-packaging/releases/download/v12.3-1/tezos-baker-012-Psithaca -O tezos-baker ; fi

# RUN curl https://raw.githubusercontent.com/zcash/zcash/master/zcutil/fetch-params.sh | sh

RUN mv tezos-baker /usr/bin/tezos-baker
RUN chmod +x /usr/bin/tezos-baker

ADD ./entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]