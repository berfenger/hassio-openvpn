#!/bin/bash
mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

mkdir /ovpncfg
cd /ovpncfg
jq --raw-output '.archive' /data/options.json | base64 -d > archive.cmp
tar xf archive.cmp
OVPNFILE=`find . -name "*.ovpn"`
OVPNDIR=$(dirname $OVPNFILE)
OVPNFILEREL=$(basename $OVPNFILE)
echo "DIRR: $OVPNDIR"
echo "FILE: $OVPNFILEREL"
cd $OVPNDIR
echo "Running OpenVPN"
openvpn --config $OVPNFILEREL
