#!/bin/bash
set -e # Stop if error

sed '/^[[:blank:]]*#/d;/^\s*$/d' > "serverfiles/main/cod2server.cfg" <<EOF
set sv_hostname "$SV_HOSTNAME"
set scr_motd "$SCR_MOTD"
set rconpassword "$RCON_PASSWORD"
EOF

./cod2server start

sleep inf & wait
