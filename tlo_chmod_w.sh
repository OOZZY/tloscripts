#!/usr/bin/env bash
set -xeuo pipefail

find "${1}" -type f -exec chmod -w "{}" \;
find "${1}" -type f -exec ls -la "{}" \;
