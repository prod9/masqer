FROM alpine:3.20
RUN apk add --no-cache \
	tini dnsmasq bind-tools vim

COPY entrypoint.sh /entrypoint.sh
CMD ["/sbin/tini", "-s", "/bin/sh", "/entrypoint.sh"]
