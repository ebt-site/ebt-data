#!/bin/bash
DIR=`dirname $0`
SCRIPT=`basename $0`
BRANCH=published
cd $DIR/..
BD=local/bilara-data

shopt -s expand_aliases
alias iferr='if [ "$?" != "0" ]; then '

if [ ! -e $BD ]; then
  echo -e "$SCRIPT: cloning suttacentral/bilara-data"
  mkdir -p local
  git clone https://github.com/suttacentral/bilara-data $BD
fi

pushd $BD > /dev/null
echo -e "$SCRIPT: $BD> git pull"
git pull
COMMIT=`git log --oneline | head -1`
iferr echo -e "$SCRIPT: fetch suttacentral/$BRANCH (ERROR)"; exit -1; fi
popd > /dev/null

echo "$SCRIPT: updating ebt-data from bilara-data"
cp -u $BD/*.json .
cp -u -r $BD/root .
cp -u -r $BD/translation .
$DIR/prune.sh
git prune

if [ "$1" == "PUSH" ]; then
  git add .
  MSG="sync to bilara-data $COMMIT"
  echo "$SCRIPT: $MSG"
  git commit -am "$MSG"
  echo -e "$SCRIPT: pushing $BRANCH changes..." 
  git push
fi

echo -e "$SCRIPT: DONE"
