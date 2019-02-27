#!/bin/sh
### BEGIN INIT INFO
# Provides:          fluship
# Required-Start:    networking
# Required-Stop:
# Should-Start:      
# Default-Start:     5 S
# Default-Stop:
# Short-Description: Flush IP after startup
# Description:       
### END INIT INFO

do_start () {
	ip addr flush dev eth0
}

case "$1" in
  start|"")
	do_start
	;;
  restart|reload|force-reload)
	echo "Error: argument '$1' not supported" >&2
	exit 3
	;;
  stop|status)
	# No-op
	;;
  *)
	echo "Usage: fluship.sh [start|stop]" >&2
	exit 3
	;;
esac

: