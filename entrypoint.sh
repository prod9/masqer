#!/bin/sh

MASQ=/usr/sbin/dnsmasq
MASQ_OPTS=""

if [ ! -x "$MASQ" ]
then
	echo "$MASQ" not found. >&2
	exit 1
fi

if [ ! -z "$EXTRA_HOSTS" ]
then
	echo "Creating /addn_hosts" >&2
	echo -e "$EXTRA_HOSTS" > /addn_hosts
	echo > /addn_hosts
	echo "192.168.1.99 masqertest.stage9.dev" >> /addn_hosts
	MASQ_OPTS="${MASQ_OPTS} --addn-hosts=/addn_hosts"
fi

if [ ! -z "$RESOLVER" ]
then
	echo "Ignoring system resolver and use $RESOLVER instead"
	MASQ_OPTS="${MASQ_OPTS} --no-resolv --server=$RESOLVER"
fi

echo "Starting dnsmasq" >&2

set -o errexit
set -o xtrace

"$MASQ" \
	--keep-in-foreground \
	--log-queries \
	--log-facility=- \
	${MASQ_OPTS}

