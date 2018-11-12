#!/usr/bin/env bash
set -xeuo pipefail

CC=`which gcc` CXX=`which g++` CMAKE_PREFIX_PATH=/home/tlo/sdt/Qt/5.10.1/gcc_64 exec cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug "$@"
