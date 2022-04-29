#!/usr/bin/env bash

echo $KEY > key
echo $PASS > pass

bin/auction-keeper \
  --rpc-host $RPC_HOST \
  --eth-from $FROM \
  --eth-key 'key_file=/opt/keeper/auction-keeper/key,pass_file=/opt/keeper/auction-keeper/pass' \
  --type clip \
  --ilk $ILK \
  --kick-only \
  --from-block $FROM_BLOCK \
  --debug
