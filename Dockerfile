FROM alpine:3.20
RUN apk add --no-cache tini dnsmasq bind-tools vim

# default dnsmasq.conf has --local-service entry in there preventing access from network
# which kinda defeats the purpose of using this container
RUN rm /etc/dnsmasq.conf 

COPY entrypoint.sh /entrypoint.sh
CMD ["/sbin/tini", "-s", "/bin/sh", "/entrypoint.sh"]
