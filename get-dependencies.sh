#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
make-aur-package python-fortune-python
make-aur-package python-pyciede2000
make-aur-package rewaita
