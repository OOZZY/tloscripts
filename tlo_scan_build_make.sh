#!/usr/bin/env bash
set -xeuo pipefail

exec scan-build tlo_make.sh "$@"
