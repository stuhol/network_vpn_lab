#!/bin/sh
if [ ! -e /root/.ip_flushed ]
then
    ip addr flush eth0
    ip addr flush eth1
    touch /root/.ip_flushed
fi