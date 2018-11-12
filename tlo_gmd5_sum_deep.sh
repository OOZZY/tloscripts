#!/usr/bin/env bash
set -xeuo pipefail

# works in freebsd/pc-bsd if package coreutils is installed
exec find "${1}" -type f -print0 | xargs -0 gmd5sum >> "${1}".md5
