#!/usr/bin/env bash
set -xeuo pipefail

exec gcc -std=c11 -pedantic -Wall -Wextra -Werror "$@"
