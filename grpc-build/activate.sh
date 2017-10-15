DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PATH=$PATH:$DIR/bins/opt:$DIR/bins/opt/protobuf
export CPATH=$DIR/include:$DIR/third_party/protobuf/src
export LIBRARY_PATH=$DIR/libs/opt:$DIR/libs/opt/protobuf
export PKG_CONFIG_PATH=$DIR/libs/opt/pkgconfig:$DIR/third_party/protobuf:$DIR/third_party/zlib
export LD_LIBRARY_PATH=$DIR/libs/opt:/usr/local/lib/