#!/usr/bin/env bash
set -xeuo pipefail

exec gcc -std=c11 -pedantic -Wall -Wextra -Werror -D_POSIX_C_SOURCE=200809L "$@"
