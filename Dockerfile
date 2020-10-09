FROM alpine:3.12

MAINTAINER Tobias Kaefer <tobias+opnvpnclt@tkaefer.de>

ENV TERM=xterm-color
ENV CLIENT_CONFIG_FILE /etc/openvpn/client.conf

RUN apk add --update supervisor openvpn iptables bash && \
    apk add --update dropbear dropbear-ssh --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

VOLUME ["/etc/openvpn", "/etc/dropbear", "/home"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["app:start"]
