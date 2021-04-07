#!/bin/bash
DIR=`dirname $0`
SCRIPT=`basename $0`
echo -e "$SCRIPT: Refreshing bilara-data fork from upstream master …"
git checkout published
git pull -Xtheirs --no-edit https://github.com/suttacentral/bilara-data
git status | grep 'nothing to commit' ; RC=$?
if [ "$RC" == "0" ]; then
  echo -e "$SCRIPT: nothing to commit"
else
  MSG="$SCRIPT: changes by $GITHUB_WORKFLOW $HOSTNAME"
  echo -e $MSG
  if [ "$1" == "PUSH" ]; then
    git add .
    git commit -am "$MSG"
    git push
    echo -e "$SCRIPT: changes committed and pushed"
  else 
    echo -e "$SCRIPT: (changes not committed)"
  fi
fi
