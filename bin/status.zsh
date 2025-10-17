#!/usr/bin/env zsh

systemctl --user list-timers --all kidproxy
systemctl --user status kidproxy tinyproxy
