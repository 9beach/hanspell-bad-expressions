#!/usr/bin/env bash

REPO_PATH="$(dirname $(cd "$(dirname "$0")" > /dev/null 2>&1; pwd -P))"

cd "$REPO_PATH"

NEWFILE=`mktemp`

awk '/```json/ {exit} {print}' "$REPO_PATH/README.md" > $NEWFILE
echo '```json' >> $NEWFILE
cat "$REPO_PATH/rc/hanspell-bad-expressions.json" >> $NEWFILE
echo '```' >> $NEWFILE
awk 'f;/```$/{f=1}' "$REPO_PATH/README.md" >> $NEWFILE

mv -f $NEWFILE "$REPO_PATH/README.md"
