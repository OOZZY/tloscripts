#!/usr/bin/env bash
set -xeuo pipefail

# requires bash, wget, file

for url in $@; do
  wget -qO temp.html "${url}"
  file temp.html
done
rm temp.html
