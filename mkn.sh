#!/usr/bin/env bash
set -ex
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="b"
VER="1.86.0"
BOOST="boost-${VER}"
TAR_FILE="boost-${VER}-cmake.tar.xz"
URL="https://github.com/boostorg/boost/releases/download/boost-${VER}/${TAR_FILE}"

get(){
  which wget && wget $URL || curl -Lo $TAR_FILE $URL
}

(
    cd $CWD
    [ -d "lib" ] && echo "boost already built - skipping" && exit 0
    [ ! -f "$TAR_FILE" ] && get
    [ ! -d "$BOOST" ] && tar xf $TAR_FILE
    rm -rf build $DIR && mv "$BOOST" "$DIR" && mkdir build
    (
        cd build
        cmake -G Ninja \
            -DCMAKE_BUILD_TYPE=Release  \
            -DCMAKE_INSTALL_LIBDIR=lib  \
            -DCMAKE_INSTALL_PREFIX=$CWD \
            -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=true \
            "$CWD/$DIR"
        ninja && ninja install
    )
    rm -rf build $DIR $TAR_FILE
)
