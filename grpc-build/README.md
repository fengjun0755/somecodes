# gRPC compilation method 1

## use sourcetree to git clone branch v1.6.x of grpc

git clone -b v1.6.x https://github.com/grpc/grpc.git

## use sourcetree to git clone submodules of grpc

change submodule third_party/boringssl-with-bazel's url from https://boringssl.googlesource.com/boringssl to https://github.com/JackSunshine/boringssl-with-bazel.git

## start docker container as compilation env 

SRC_DIR=/Users/fengjun/sourcetree/grpc2

BUILD_DIR=/Users/fengjun/sourcetree/somecodes/grpc-build

docker run -it -v $SRC_DIR:/var/local/git/grpc -v $BUILD_DIR:/var/local/git/grpc-build centos:7.2.1511

## build in compilation env

cd /var/local/git/grpc-build

chmod +x build.sh

./build.sh
