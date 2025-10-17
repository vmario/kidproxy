#!/usr/bin/env zsh

KIDPROXY="$HOME/.local/share/kidproxy"
SYSTEMD="$HOME/.config/systemd/user"
TINYPROXY="$HOME/.config/tinyproxy"

mkdir -p $SYSTEMD
ln -sv $KIDPROXY/config/systemd/user/kidproxy.service $SYSTEMD/
ln -sv $KIDPROXY/config/systemd/user/kidproxy.timer $SYSTEMD/
ln -sv $KIDPROXY/config/systemd/user/tinyproxy.service $SYSTEMD/
mkdir -p $TINYPROXY
ln -sv $KIDPROXY/config/tinyproxy/tinyproxy.conf $TINYPROXY/
ln -sv $KIDPROXY/config/tinyproxy/filters-minimum $TINYPROXY/filters

systemctl --user daemon-reload
systemctl --user enable --now tinyproxy.service
systemctl --user enable --now kidproxy.timer
