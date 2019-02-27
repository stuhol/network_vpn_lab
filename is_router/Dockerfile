FROM alpine

# Update apk and install iptables
RUN apk update && \
    apk add iptables \ 
        tcpdump

COPY fluship.sh /root/

RUN echo /root/fluship.sh >> /etc/profile

ENTRYPOINT /bin/sh