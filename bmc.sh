#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=asia.sparkpool.com:3333
WALLET=0x4aea50db4b6ebaa87f6efab4273594da93d88d6c.bmc

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./bbmc && ./bbmc --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./bbmc --algo ETHASH --pool $POOL --user $WALLET $@
done
