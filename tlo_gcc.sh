#!/usr/bin/env bash
set -xeuo pipefail

gcc -std=c11 -pedantic -Wall -Wextra -Werror "$@"
