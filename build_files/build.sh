#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 
dnf5 install -y nvim 

# Use a COPR Example:
#
#  dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

sudo dnf5 -y copr enable @kdesig/plasma-6.7-beta

sudo dnf5 -y update
sudo dnf5 -y install @kde-desktop-environment

dnf5 copr disable @kdesig/plasma-6.7-beta

dnf5 -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

dnf5 -yy install kodi

dnf5 -y remove rpmfusion-free-release

#### Example for enabling a System Unit File

systemctl enable podman.socket
