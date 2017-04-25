#!/usr/bin/env bash
set -xeuo pipefail

# configure adobe and rpm fusion repositories
sudo dnf install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install flash-plugin and vlc
sudo dnf install flash-plugin
sudo dnf install vlc
