#!/usr/bin/env bash

echo $KEY > key
echo $PASS > pass

bin/auction-keeper \
  --rpc-host $RPC_HOST \
  --eth-from ${FROM#AWS_GUARD_} \
  --eth-key 'key_file=/opt/keeper/auction-keeper/key,pass_file=/opt/keeper/auction-keeper/pass' \
  --type flop \
  --kick-only \
  --from-block $FROM_BLOCK
