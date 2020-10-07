FROM ubuntu:20.04

COPY ./cyberghostvpn-ubuntu-20.04-1.3.3/cyberghost /usr/local/cyberghost
COPY ./*.sh /usr/local/cyberghost/
RUN addgroup --system vpn && \
    apt-get -y update && \
    apt-get -y install sudo openvpn ca-certificates iptables && \
    ln -sf /usr/local/cyberghost/cyberghostvpn /usr/bin/cyberghostvpn

VOLUME /home/root/.cyberghost
WORKDIR /usr/local/cyberghost

CMD /usr/local/cyberghost/start.sh

HEALTHCHECK --start-period=20s --interval=30s --timeout=20s \
    CMD  /usr/local/cyberghost/health-check.sh
