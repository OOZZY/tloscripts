#!/usr/bin/env bash
set -xeuo pipefail

exec clang++ -x c++ -std=c++17 -pedantic -Wall -Wextra -Werror "$@"
