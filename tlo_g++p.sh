#!/usr/bin/env bash
set -xeuo pipefail

g++ -std=c++14 -pedantic -Wall -Wextra -Werror -D_POSIX_C_SOURCE=200809L "$@"
