

VERSION="master"
if [ ! -d "./b" ]; then
    git clone --depth 1 https://github.com/boostorg/boost -b $VERSION b --recursive
    cd b
    ./bootstrap.sh
    ./b2 headers
fi
