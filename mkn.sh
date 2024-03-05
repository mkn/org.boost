#!/usr/bin/env bash

set -ex

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -f "$CWD/b" ] && exit 0

DIR="b"
VER="1.84.0"
BOOST="boost-${VER}"
GZ_FILE="${BOOST}.tar.gz"
URL="https://github.com/boostorg/boost/releases/download/boost-${VER}/${GZ_FILE}"

[ ! -f "$GZ_FILE" ] && wget $URL
[ ! -d "$BOOST" ] && tar xf $GZ_FILE

rm -rf $DIR
mv $BOOST $DIR

pushd $DIR
./bootstrap.sh
./b2 headers
popd

exit 0
