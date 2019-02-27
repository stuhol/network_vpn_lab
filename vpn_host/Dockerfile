FROM ubuntu:16.04

ENV STRONGSWAN_URL https://download.strongswan.org/strongswan-5.0.2.tar.gz

RUN     echo "Installing required packages to download Strongswan" && \
        apt update && \
        apt install -y build-essential \
            ca-certificates \
            wget \
            net-tools \
            iputils-ping \
            libgmp-dev \
            libcap2 \
            libcap-dev \
            libssl-dev && \
        echo "Downloading and extracting Strongswan" && \
        cd /opt && \
        wget -O strongswan.tar.gz $STRONGSWAN_URL && \
        tar xvf strongswan.tar.gz && \
        echo "Configuring, compiling, and installing Strongswan" && \
        cd /opt/strongswan* && \
        ./configure \
            --prefix=/usr \
            --sysconfdir=/etc \
            --libexecdir=/usr/lib \
            --with-ipsecdir=/usr/lib/strongswan \
            --enable-openssl \
            --enable-dhcp \
            --enable-gcm \
            --disable-ikev1 \
            --disable-pgp \
            --disable-resolve \
            --disable-xauth-generic \
            --disable-xcbc \
            --with-capabilities=libcap && \
        make -j 3 && \
        make install

COPY fluship.sh /root/

RUN echo /root/fluship.sh >> /root/.bashrc

VOLUME /opt/pki

ENTRYPOINT /bin/bash
	
EXPOSE  500/udp \
        4500/udp 
