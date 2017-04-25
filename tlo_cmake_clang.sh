#!/usr/bin/env bash
set -xeuo pipefail

CC=`which clang` CXX=`which clang++` cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug "$@"
