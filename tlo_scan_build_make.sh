#!/usr/bin/env bash
set -xeuo pipefail

exec scan-build make "$@"
