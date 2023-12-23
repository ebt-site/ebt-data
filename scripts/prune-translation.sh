#!/bin/bash
DIR=`dirname $0`
SCRIPT=`basename $0`

echo -e "$SCRIPT: START"

FOLDER=$1

if [ "$FOLDER" == "" ]; then
  echo -e "$SCRIPT: Expected translation folder name (e.g., sutta/sa)"
  exit -1
fi

cd translation
echo -e $SCRIPT: removing $FOLDER
find . -type d -print | grep -e "/${FOLDER}$" | xargs echo
find . -type d -print | grep -e "/${FOLDER}$" | xargs rm -vrf

echo -e "$SCRIPT: DONE"
