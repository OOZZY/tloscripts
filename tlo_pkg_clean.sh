#!/usr/bin/env bash
set -xeuo pipefail

sudo pkg autoremove
sudo pkg clean -a
sudo pkg check -d -nv -a
