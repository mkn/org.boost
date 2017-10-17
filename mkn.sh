#!/usr/bin/env bash

set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -f "$CWD/b" ] && exit 0

VERSION="master"
DIR="b"
URL="https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz"

wget $URL

tar xf boost_1_65_1.tar.gz
mv boost_1_65_1 b
cd b
./bootstrap.sh
./b2 headers

rm boost_1_65_1.tar.gz

exit 0
