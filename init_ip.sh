#!/bin/sh
if [[ -z "${IP_PREFIX}" ]]; then
  ip_prefix="10.255.0"
else
  ip_prefix="${IP_PREFIX}"
fi

if [[ -z "${IP_START}" ]]; then
  starting_num="2"
else
  starting_num="${IP_START}"
fi

if [[ -z "$( hostname |  grep -Eo '[0-9]+')" ]]; then
  ip_num="1"
else
  ip_num=$( hostname |  grep -Eo '[0-9]+')
fi

interface_name=$(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d'  | head -n 1)


echo "
# Config network automatic
auto $interface_name
iface $interface_name inet static
	address $ip_prefix.$(( $starting_num + $ip_num ))
	netmask 255.255.255.0
	gateway $ip_prefix.1
	up echo nameserver 8.8.8.8 > /etc/resolv.conf
" > /etc/network/interfaces

ifdown $interface_name; ifup $interface_name