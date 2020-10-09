FROM alpine:3.12

MAINTAINER Tobias Kaefer <tobias+opnvpnclt@tkaefer.de>

ENV TERM=xterm-color

RUN apk add --update supervisor openvpn iptables bash dropbear dropbear-ssh && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

VOLUME ["/etc/openvpn", "/etc/dropbear", "/home"]

ENV CLIENT_CONFIG_FILE /etc/openvpn/client.conf

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf




COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["app:start"]
