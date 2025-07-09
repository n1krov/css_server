#!/bin/bash
set -e

STEAMCMDDIR=/opt/steamcmd
CSSDIR=/opt/css_ds

# Instalar/actualizar CS:S (appid 232330)
$STEAMCMDDIR/steamcmd.sh +force_install_dir $CSSDIR +login anonymous +app_update 232330 validate +quit

cd "$CSSDIR"
exec ./srcds_run -game cstrike -console -usercon +map de_dust2 +maxplayers 16 -port 27015 "$@"
