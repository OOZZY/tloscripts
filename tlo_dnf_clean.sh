#!/usr/bin/env bash
set -xeuo pipefail

sudo dnf autoremove
sudo dnf clean packages
