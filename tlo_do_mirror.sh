#!/usr/bin/env bash
set -xeuo pipefail

time rsync --omit-dir-times --delete -rltDhiPsv "${1}" "${2}"
