#!/usr/bin/env bash
set -euo pipefail

if [ $# -gt 0 ]
then
  clang_format="clang-format${1}"
else
  clang_format="clang-format"
fi

set -x

find . \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" \)
sleep 10

find . \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" \) -print0 | xargs -0 ${clang_format} -i -style=Google
