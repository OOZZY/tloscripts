#!/usr/bin/env bash
set -xeuo pipefail

CC=`which clang` CXX=`which clang++` CMAKE_PREFIX_PATH=/home/tlo/sdt/Qt/5.7/gcc_64 cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug "$@"
