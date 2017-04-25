#!/usr/bin/env bash
set -xeuo pipefail

sudo pvscan # to scan all disks for physical volume
sudo vgscan # to scan disks for volume groups
sudo lvscan # to scan all disks for logical volume
