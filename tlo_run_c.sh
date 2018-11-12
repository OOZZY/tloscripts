#!/usr/bin/env bash
set -xeuo pipefail

src="${1}"
out="`basename "${1}" .c`".out
if [ ! -e "${out}" -o "${src}" -nt "${out}" ]; then
  clang -std=c11 -pedantic -Wall -Wextra -Werror -g "${src}" -o "${out}"
fi
./"${out}"
