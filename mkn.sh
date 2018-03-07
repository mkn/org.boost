#!/usr/bin/env bash

set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -f "$CWD/b" ] && exit 0

DIR="b"
BOOST="boost_1_66_0"
GZ_FILE="${BOOST}.tar.gz"
URL="https://dl.bintray.com/boostorg/release/1.65.1/source/${GZ_FILE}

[ ! -f "$GZ_FILE" ] && wget $URL
[ ! -d "$BOOST" ] && tar xf $GZ_FILE

rm -rf $DIR
mv $BOOST $DIR

pushd $DIR
./bootstrap.sh
./b2 headers
popd

exit 0
