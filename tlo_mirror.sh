#!/usr/bin/env bash
set -xeuo pipefail

time rsync --dry-run --omit-dir-times --delete -rltDhiPsv "${1}" "${2}"
