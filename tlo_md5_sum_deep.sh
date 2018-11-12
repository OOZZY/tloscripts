#!/usr/bin/env bash
set -xeuo pipefail

exec find "${1}" -type f -print0 | xargs -0 md5sum >> "${1}".md5
