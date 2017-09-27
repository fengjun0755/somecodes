#!/bin/bash
set -x
host_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker run -it \
  -v $host_dir:/root \
  centos:7.2.1511
