#!/usr/bin/env bash
set -xeuo pipefail

sudo pkg update
sudo pkg upgrade
sudo pkg check -d -nv -a
sudo freebsd-update fetch install
