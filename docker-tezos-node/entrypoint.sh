#! /bin/sh
set -e

NETWORK_VERSION="ithacanet"
DATA_DIR="/tezos-$NETWORK_VERSION"

mkdir -p $DATA_DIR
if [ ! -f "$DATA_DIR/config.json" ];
then
    tezos-node config init --data-dir $DATA_DIR --network $NETWORK_VERSION
fi

tezos-node identity generate --data-dir $DATA_DIR

if [ ! -z "$SNAPSHOT" ]; 
then 
    wget --directory-prefix=/ "$SNAPSHOT"
    SNAPSHOT_NAME=$( echo $SNAPSHOT | sed "s/https:\/\/snapshots-tezos.giganode.io\/snapshots\/\(.*\)/\1/" )
    tezos-node snapshot import /$SNAPSHOT_NAME --data-dir $DATA_DIR
fi

tezos-node run --rpc-addr 127.0.0.1 --data-dir $DATA_DIR