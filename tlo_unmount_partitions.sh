#!/usr/bin/env bash
set -xeuo pipefail

cd /media/tlo
for file in *
do
  sudo umount "${file}"
done
