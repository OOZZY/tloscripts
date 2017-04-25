#!/usr/bin/env bash
set -xeuo pipefail

clear; clear; scan-build make "$@"
