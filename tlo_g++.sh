#!/usr/bin/env bash
set -xeuo pipefail

exec g++ -std=c++14 -pedantic -Wall -Wextra -Werror "$@"
