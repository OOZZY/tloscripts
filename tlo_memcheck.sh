#!/usr/bin/env bash
set -xeuo pipefail

exec valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes --error-exitcode=1 "$@"
