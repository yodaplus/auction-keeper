#!/usr/bin/env bash

echo $KEY > key
echo $PASS > pass

bin/auction-keeper \
  --rpc-host $RPC_HOST \
  --eth-from ${FROM#AWS_GUARD_} \
  --eth-key 'key_file=/opt/keeper/auction-keeper/key,pass_file=/opt/keeper/auction-keeper/pass' \
  --type flop \
  --bid-only \
  --from-block $FROM_BLOCK \
  --bid-check-interval $BID_CHECK_INTERVAL \
  --bid-delay $BID_DELAY \
  --vat-dai-target $VAT_DAI_TARGET \
  --model /opt/keeper/auction-keeper/models/flop.sh \
  --min-auction 43
