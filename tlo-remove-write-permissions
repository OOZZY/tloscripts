#!/usr/bin/env bash
set -xeuo pipefail

exec find "${1}" -type f -exec chmod -w '{}' \; -exec ls -la '{}' \;
