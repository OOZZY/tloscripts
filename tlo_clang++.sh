#!/usr/bin/env bash
set -xeuo pipefail

clang++ -x c++ -std=c++14 -pedantic -Wall -Wextra -Werror "$@"
