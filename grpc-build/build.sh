#!/bin/bash
yum install -y which gcc-c++ autoconf libtool && \
yum groupinstall -y "Development Tools"

# install protobuf
cd /var/local/git/grpc/third_party/protobuf && \
make clean && ./autogen.sh && ./configure && make && make install && ldconfig && which protoc && protoc --version

# install grpc
cd /var/local/git/grpc && \
make clean && make && make install

# compile grpc cpp helloword
cd /var/local/git/grpc && \
rm -f activate.sh && \
cp -f /var/local/git/grpc-build/activate.sh . && \
source activate.sh && \
cd examples/cpp/helloworld && \
make
