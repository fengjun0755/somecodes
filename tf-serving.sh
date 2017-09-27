#!/bin/bash

yum -y which patch

# Java
yum -y install java-1.8.0-openjdk-devel

# Build Esentials (minimal)
yum -y install gcc gcc-c++ kernel-devel make automake autoconf swig git unzip libtool binutils

# Extra Packages for Enterprise Linux (EPEL) (for pip, zeromq3)
yum -y install epel-release

# Python
yum -y install numpy python-devel python-pip
pip install --upgrade pip

# Other TF deps
yum -y install freetype-devel libpng12-devel zip zlib-devel giflib-devel zeromq3-devel
pip install grpcio_tools mock

# HTTP2 Curl
#yum -y install libev libev-devel zlib zlib-devel openssl openssl-devel