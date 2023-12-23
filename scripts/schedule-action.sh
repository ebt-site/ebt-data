#!/bin/bash
DIR=`dirname $0`
SCRIPT=`basename $0`

$DIR/build.sh PUSH

echo -e "$SCRIPT: DONE"
