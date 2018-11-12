#!/usr/bin/env bash
set -xeuo pipefail

exec clang -std=c11 -pedantic -Wall -Wextra -Werror "$@"
