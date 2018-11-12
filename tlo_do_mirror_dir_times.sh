#!/usr/bin/env bash
set -xeuo pipefail

exec time rsync --delete -rltDhiPsv "${1}" "${2}"
