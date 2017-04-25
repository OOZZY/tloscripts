#!/usr/bin/env bash
set -xeuo pipefail

cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug "$@"
