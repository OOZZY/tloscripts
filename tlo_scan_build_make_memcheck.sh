#!/usr/bin/env bash
set -xeuo pipefail

tlo_scan_build_make.sh && tlo_memcheck.sh "$@"
