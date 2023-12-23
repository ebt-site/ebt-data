#!/bin/bash
DIR=`dirname $0`
SCRIPT=`basename $0`
echo -e "$SCRIPT: START"

rm -rf root/lzh
rm -rf root/pra
rm -rf root/san
$DIR/prune-translation.sh sutta/sa
$DIR/prune-translation.sh sutta/ma
$DIR/prune-translation.sh sutta/pdhp

echo -e "$SCRIPT: DONE"
