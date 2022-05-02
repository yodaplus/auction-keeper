#!/usr/bin/env bash

echo $KEY > key
echo $PASS > pass

bin/auction-keeper \
  --rpc-host $RPC_HOST \
  --eth-from ${FROM#AWS_GUARD_} \
  --eth-key 'key_file=/opt/keeper/auction-keeper/key,pass_file=/opt/keeper/auction-keeper/pass' \
  --type clip \
  --ilk $ILK \
  --bid-only \
  --from-block $FROM_BLOCK \
  --max-auctions $MAX_AUCTIONS \
  --bid-check-interval $BID_CHECK_INTERVAL \
  --bid-delay $BID_DELAY \
  --return-gem-interval $RETURN_GEM_INTERVAL \
  --model /opt/keeper/auction-keeper/models/clip.js \
  --vat-dai-target $VAT_DAI_TARGET
