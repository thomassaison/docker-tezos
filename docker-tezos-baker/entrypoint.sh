#! /bin/sh
set -e

NETWORK_VERSION="ithacanet"
DATA_DIR="/tezos-node-$NETWORK_VERSION"

tezos-baker run with local node $DATA_DIR