#!/usr/bin/env bash
set -xeuo pipefail

clear; clear; exec scan-build make "$@"
