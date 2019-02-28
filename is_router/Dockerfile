FROM ubuntu

# Update apk and install iptables
RUN apt update && \
    apt install -y iproute2 \
        net-tools \
        iptables \ 
        tcpdump \
	    nano

COPY fluship.sh /root/

RUN echo source /root/fluship.sh >> /root/.bashrc

ENTRYPOINT [ "/bin/bash" ]
