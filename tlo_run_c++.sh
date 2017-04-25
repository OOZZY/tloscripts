#!/usr/bin/env bash
set -xeuo pipefail

src="${1}"
out="`basename "${1}" .cpp`".out
if [ ! -e "${out}" -o "${src}" -nt "${out}" ]
then
  clang++ -std=c++14 -pedantic -Wall -Wextra -Werror -g "${src}" -o "${out}"
fi
./"${out}"
