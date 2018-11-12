#!/usr/bin/env bash
set -xeuo pipefail

exec find . \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" \)
