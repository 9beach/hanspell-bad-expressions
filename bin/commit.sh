#!/usr/bin/env bash

REPO_PATH="$(dirname $(cd "$(dirname "$0")" > /dev/null 2>&1; pwd -P))"

cd "$REPO_PATH"

git commit -am 'Update readme'
git push
cp -f README.md ../3e11ceafcf9477b0bf9f6512f8a4b55a/hanspell-rc.md
cd ../3e11ceafcf9477b0bf9f6512f8a4b55a
git commit -am 'Update gist'
git push
