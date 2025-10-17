#!/usr/bin/env zsh

KIDPROXY="$HOME/.local/share/kidproxy"
SYSTEMD="$HOME/.config/systemd/user"

mkdir -p $SYSTEMD
ln -sv $KIDPROXY/config/systemd/user/kidproxy.service $SYSTEMD/
ln -sv $KIDPROXY/config/systemd/user/kidproxy.timer $SYSTEMD/
ln -sv $KIDPROXY/config/systemd/user/tinyproxy.service $SYSTEMD/
ln -sv $KIDPROXY/config/tinyproxy $HOME/.config/
