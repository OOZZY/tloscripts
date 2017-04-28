#!/usr/bin/env bash
set -xeuo pipefail

cp -a "${1}" "${1}.backup"
vim -r "${1}"
diff "${1}.backup" "${1}"
