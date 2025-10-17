#!/usr/bin/env zsh

KIDPROXY="$HOME/.local/share/kidproxy"
TINYPROXY="$HOME/.config/tinyproxy"

filter() {
	echo "Filter $1"

	filter=$KIDPROXY/config/tinyproxy/filters-$1
	link=$TINYPROXY/filters

	if [[ "$(readlink $link)" == "$filter" ]]; then
		return
	fi

	ln -sfv $filter $link
	systemctl --user reload tinyproxy
}

cd ${0:A:h}/..
git pull

policyTimestamp=$(date -d "$(</tmp/testdate)" +%s)
currentTimestamp=$(date +%s)
if (( $currentTimestamp < $policyTimestamp )); then
	filter maximum
else
	filter minimum
fi
