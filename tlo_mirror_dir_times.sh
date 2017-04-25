#!/usr/bin/env bash
set -xeuo pipefail

time rsync --dry-run --delete -rltDhiPsv "${1}" "${2}"
