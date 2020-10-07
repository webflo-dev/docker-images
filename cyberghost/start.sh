#!/bin/bash
[[ -n ${DEBUG} ]] && set -x

[[ "${GROUPID:-""}" =~ ^[0-9]+$ ]] && groupmod -g $GROUPID -o vpn
CG_COUNTRY=${COUNTRY:-"FR"}
CG_SERVICE_TYPE=${SERVICE_TYPE:-"traffic"}

DOCKER_NET="$(ip -o addr show dev eth0 | awk '$3 == "inet" {print $4}')"

echo "👻 Cyberghost: connecting to country <${CG_COUNTRY}> with service <${CG_SERVICE_TYPE}>"

if [ -n "${NETWORK}" ]; then
    eval "$(ip r l | grep -v 'tun0\|kernel' | awk '{print "GW="$3"\nINT="$5}')"
    for network in ${NETWORK//[;,]/ }; do
        ip route add "$network" via "$GW" dev "$INT"
    done
fi

sudo cyberghostvpn --${CG_SERVICE_TYPE} --country-code $CG_COUNTRY --connect
echo "👻 Cyberghost connected 🚀"
tail -f -n20 $(ls -t /home/root/.cyberghost/logs/*.log | head -1)
