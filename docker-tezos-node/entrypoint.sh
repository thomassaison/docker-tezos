#! /bin/sh

NETWORK_VERSION="ithacanet"
DATA_DIR="/tezos-$NETWORK_VERSION"

mkir -p $DATA_DIR
tezos-node config init --data-dir $DATA_DIR --network $NETWORK_VERSION
tezos-node identity generate --data-dir $DATA_DIR
tezos-node run --rpc-addr 127.0.0.1 --data-dir $DATA_DIR