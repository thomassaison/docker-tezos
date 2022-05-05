#! /bin/sh
set -e

NETWORK_VERSION="ithacanet"
DATA_DIR="/tezos-node-$NETWORK_VERSION"

if [ -z "$NODE_ENDPOINT" ]; then NODE_ENDPOINT="http://localhost:8732" ; fi

tezos-baker run with local node $DATA_DIR