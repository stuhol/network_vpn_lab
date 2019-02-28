#!/bin/bash
if [ "$$" = "1" ] && [ ! "$NETWORK_LAB_NO_IP_FLUSH" = "1" ]
then
    ip addr flush eth0
    ip addr flush eth1
    touch /root/.ip_flushed
    echo Flushed startup IP
fi