#!/usr/bin/env bash
set -xeuo pipefail

src="${1}"
base="`basename "${1}" .java`"
out="${base}".class
if [ ! -e "${out}" -o "${src}" -nt "${out}" ]; then
  javac -Xlint -Werror -g "${src}"
fi
java -ea "${base}"
