#!/usr/bin/env bash
set -xeuo pipefail

CC=`which gcc` CXX=`which g++` cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug "$@"
