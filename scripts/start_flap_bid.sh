#!/usr/bin/env bash

echo $KEY > key
echo $PASS > pass

bin/auction-keeper \
  --rpc-host $RPC_HOST \
  --eth-from $FROM \
  --eth-key 'key_file=/opt/keeper/auction-keeper/key,pass_file=/opt/keeper/auction-keeper/pass' \
  --type flap \
  --bid-only \
  --from-block $FROM_BLOCK \
  --bid-check-interval $BID_CHECK_INTERVAL \
  --bid-delay $BID_DELAY \
  --model /opt/keeper/auction-keeper/models/flap.sh \
  --debug
