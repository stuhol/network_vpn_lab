#!/bin/sh
if [ ! -e /root/.ip_flushed ]
then
    ip addr flush eth0
    touch /root/.ip_flushed
fi