#!/usr/bin/env bash

set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -f "$CWD/b" ] && exit 0

DIR="b"
VER="1.71.0"
BOOST=boost_$(echo $VER | sed -e "s/\./_/g")
URL="https://dl.bintray.com/boostorg/release/${VER}/source/${BOOST}.tar.gz"

GZ_FILE="${BOOST}.tar.gz"

[ ! -f "$GZ_FILE" ] && wget $URL
[ ! -d "$BOOST" ] && tar xf $GZ_FILE

rm -rf $DIR
mv $BOOST $DIR

pushd $DIR
./bootstrap.sh
./b2 headers
popd

exit 0
