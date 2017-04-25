#!/usr/bin/env bash
set -xeuo pipefail

sudo tar -cv --xz -f `date +"%Y-%m-%d-%H-%M-%S"`.tar.xz /var/log
