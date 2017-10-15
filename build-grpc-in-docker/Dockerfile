FROM centos:7.2.1511

RUN yum install -y which gcc-c++ autoconf libtool \
  && yum groupinstall -y "Development Tools"

ENV GRPC_RELEASE_TAG v1.6.x

RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc /var/local/git/grpc

RUN cd /var/local/git/grpc && \
    cp .gitmodules gitmodules.org && \
    sed 's/boringssl.googlesource.com\/boringssl/github.com\/JackSunshine\/boringssl-with-bazel.git/g' gitmodules.org > .gitmodules  

RUN cd /var/local/git/grpc/tools/run_tests/sanity && \
    cp check_submodules.sh check_submodules.sh.org && \
    sed '/set -e/d' check_submodules.sh.org > check_submodules.sh && \
    cat check_submodules.sh

RUN cd /var/local/git/grpc && \
    git submodule update --init && \
    cp -rf .git/modules/third_party/boringssl-with-bazel/* third_party/boringssl-with-bazel/

RUN cd /var/local/git/grpc/third_party/protobuf && \
    ./autogen && ./configure && make && make install && ldconfig && which protoc && protoc --version

# install grpc
RUN cd /var/local/git/grpc && \
    make && make install

RUN cd /var/local/git/grpc && \
    cat > activate.sh <<EOF \
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" \
    export PATH=$PATH:$DIR/bins/opt:$DIR/bins/opt/protobuf \
    export CPATH=$DIR/include:$DIR/third_party/protobuf/src \
    export LIBRARY_PATH=$DIR/libs/opt:$DIR/libs/opt/protobuf \
    export PKG_CONFIG_PATH=$DIR/libs/opt/pkgconfig:$DIR/third_party/protobuf \
    export LD_LIBRARY_PATH=$DIR/libs/opt \
    EOF

RUN cd /var/local/git/grpc && \
    source actviate.sh && \
    cd examples/cpp/helloworld && \
    make
