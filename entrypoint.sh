#!/bin/sh

MASQ=/usr/sbin/dnsmasq

if [ ! -x "$MASQ" ]
then
	echo "$MASQ" not found. >&2
	exit 1
fi

if [ -z "$EXTRA_HOSTS" ]
then
	echo EXTRA_HOSTS is empty, is this intended? >&2
	echo running without any additional hosts configuration. >&2
fi

echo "Creating /addn_hosts" >&2
echo -e "$EXTRA_HOSTS" > /addn_hosts
echo "192.168.1.99 masqertest.stage9.dev" >> /addn_hosts

echo "Starting dnsmasq" >&2

set -o errexit
set -o xtrace

"$MASQ" \
	--keep-in-foreground \
	--log-queries \
	--log-facility=- \
	--addn-hosts=/addn_hosts

