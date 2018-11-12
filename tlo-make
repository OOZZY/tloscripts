#!/usr/bin/env bash
set -xeuo pipefail

if [ -f ./build.ninja ]; then
  exec ninja -j `nproc` "$@"
elif [ -f ./Makefile ]; then
  exec make -j `nproc` "$@"
fi
