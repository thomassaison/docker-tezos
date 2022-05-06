#! /bin/sh
set -e

NETWORK_VERSION="ithacanet"
DATA_DIR="/tezos-$NETWORK_VERSION"

mkdir -p $DATA_DIR
if [ ! -f "$DATA_DIR/config.json" ];
then
    echo "Init config..."
    tezos-node config init --data-dir $DATA_DIR --network $NETWORK_VERSION
else
    echo "Initialization already did"
fi

if [ ! -f "$DATA_DIR/identity.json" ];
then
    echo "Generating identity..."
    tezos-node identity generate --data-dir $DATA_DIR
else
    echo "Identity already generated"
fi

if [ ! -z "$SNAPSHOT" ]; 
then 
    echo "Import snapshot..."
    wget --directory-prefix=/ "$SNAPSHOT"
    SNAPSHOT_NAME=$( echo $SNAPSHOT | sed "s/https:\/\/snapshots-tezos.giganode.io\/snapshots\/\(.*\)/\1/" )

    # Clean directory
    if [ -d "$DATA_DIR/context" ]; then rm -rf "$DATA_DIR/context"; fi
    if [ -d "$DATA_DIR/store" ]; then rm -rf "$DATA_DIR/store"; fi
    if [ -f "$DATA_DIR/lock" ]; then rm -f "$DATA_DIR/lock"; fi

    tezos-node snapshot import /$SNAPSHOT_NAME --data-dir $DATA_DIR
else
    echo "No snapshot prodided"
fi

echo "Running..."
tezos-node run --rpc-addr 127.0.0.1 --data-dir $DATA_DIR