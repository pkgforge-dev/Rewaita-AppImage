#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q rewaita | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/io.github.swordpuffin.rewaita.svg
export DESKTOP=/usr/share/applications/io.github.swordpuffin.rewaita.svg
export DEPLOY_SYS_PYTHON=1
export DEPLOY_GTK=1
export GTK_DIR=gtk-4.0
export ANYLINUX_LIB=1
export DEPLOY_LOCALE=1
export STARTUPWMCLASS=io.github.swordpuffin.rewaita # Default to Wayland's wmclass. For X11, GTK_CLASS_FIX will force the wmclass to be the Wayland one.
export GTK_CLASS_FIX=1

# Deploy dependencies
quick-sharun /usr/bin/rewaita \
             /usr/lib/libgirepository*

# Turn AppDir into AppImage
quick-sharun --make-appimage
