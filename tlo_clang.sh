#!/usr/bin/env bash
set -xeuo pipefail

clang -std=c11 -pedantic -Wall -Wextra -Werror "$@"
