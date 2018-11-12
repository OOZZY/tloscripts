#!/usr/bin/env bash
set -xeuo pipefail

exec time rsync --omit-dir-times --delete -rltDhiPsv "${1}" "${2}"
