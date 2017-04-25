#!/usr/bin/env bash
set -xeuo pipefail

time rsync --delete -rltDhiPsv "${1}" "${2}"
