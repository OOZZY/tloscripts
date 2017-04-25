#!/usr/bin/env bash
set -xeuo pipefail

clear; clear; scan-build make && valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes --error-exitcode=1 "$@"
