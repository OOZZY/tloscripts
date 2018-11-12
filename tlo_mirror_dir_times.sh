#!/usr/bin/env bash
set -xeuo pipefail

exec time rsync --dry-run --delete -rltDhiPsv "${1}" "${2}"
