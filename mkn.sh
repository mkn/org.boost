#!/usr/bin/env bash

set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION="master"
DIR="b"
GIT_URL="https://github.com/boostorg/boost"

HAS=1
[ ! -d "$CWD/$DIR" ] && HAS=0 && git clone --depth 1 $GIT_URL -b $VERSION b --recursive

pushd $DIR
[ $HAS -eq 1 ] && git pull --recurse-submodules origin $VERSION

rm -rf boost
./bootstrap.sh
./b2 headers

popd
