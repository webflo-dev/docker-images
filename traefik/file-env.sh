#!/usr/bin/env bash

set -e
set -o allexport

file_env() {
	local var="$1"
	local fileVar="FILE__${var}"
	local def="${2:-}"
	if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
		echo "[env-init] Both $var and $fileVar are set (but are exclusive)"
	fi
	local val="$def"
	if [ "${!var:-}" ]; then
		val="${!var}"
	elif [ "${!fileVar:-}" ]; then
		if [ -e ${!fileVar} ]; then
			val="$(< "${!fileVar}")"
			echo "[env-init] Substitute done."
		else
			echo "[env-init] File not found for <${fileVar}>"
		fi
	fi
	export "$var"="$val"
	unset "$fileVar"
}

for varname in ${!FILE__*}
do
	echo "[env-init] Starting substitute for <$varname>"
	file_env ${varname//FILE__/}
done

traefik "$@"
