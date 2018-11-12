#!/usr/bin/env bash
set -xeuo pipefail

exec sudo tar -cv --xz -f "`date +"%Y-%m-%d-%H-%M-%S"`-var-log.tar.xz" /var/log
