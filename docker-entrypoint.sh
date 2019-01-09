#!/bin/bash
set -e # Stop if error

sed '/^[[:blank:]]*#/d;/^\s*$/d' > "serverfiles/main/cod2server.cfg" <<EOF
// : Call of Duty 2 : server.cfg

// -------------------------------- //
// server settings (very important) //
// -------------------------------- //

//Start Punkbuster
pb_sv_disable
//pb_sv_enable // If you want PB disabled, use pb_sv_disable instead
//wait // This is required for proper PB startup
set sv_punkbuster "0"

sv_hostname "$C2M_SV_HOSTNAME" // name of the game server
set scr_motd "$C2M_SCR_MOTD" // motd broken in 1.0
set sv_maxclients "$C2M_SV_MAXCLIENTS"
set sv_privateClients "$C2M_SV_PRIVATECLIENTS" // reserved player count

set rcon_password "$C2M_RCON_PASSWORD" // rcon password
set sv_privatePassword "$C2M_SV_PRIVATEPASSWORD" // use this to password private slots (sv_privateClients must be set)
set g_password "$C2M_G_PASSWORD" // set this to password your game server
sets g_needpass "$C2M_G_NEEDPASS" // tell ASE (and others) if the server has a password enabled

//masterservers

set sv_master1 $C2M_SV_MASTER1
set sv_master2 $C2M_SV_MASTER2
set sv_master3 $C2M_SV_MASTER3
set sv_master4 $C2M_SV_MASTER4
set sv_master5 $C2M_SV_MASTER5
set sv_master6 $C2M_SV_MASTER6
set sv_master7 $C2M_SV_MASTER7
set sv_master8 $C2M_SV_MASTER8
set sv_master9 $C2M_SV_MASTER9
set sv_master10 $C2M_SV_MASTER10
set sv_master11 $C2M_SV_MASTER11
set sv_master12 $C2M_SV_MASTER12
set sv_master13 $C2M_SV_MASTER13
set sv_master14 $C2M_SV_MASTER14
set sv_master15 $C2M_SV_MASTER15

// set sv_gamespy "1"
// HTTP Redirection
//set sv_allowDownload "1"
set sv_wwwDownload "1"
set sv_wwwDlDisconnected "1"
set sv_wwwBaseUrl "http://"

// ----------------------------------- //
// match settings (fairly important) //
// ----------------------------------- //
set g_allowvote "$C2M_G_ALLOWVOTE"       // voting
set scr_drawfriend "$C2M_SCR_DRAWFRIEND" // Draws a team icon over teammates
set scr_friendlyfire "$C2M_SCR_FRIENDLYFIRE" // enable or disable friendly fire 0 = off 1 = on 2 = reflect damage 3 = share damage
set scr_teambalance "$C2M_SCR_TEAMBALANCE" // auto team balance
set scr_killcam "$C2M_SCR_KILLCAM" // show the user how they were killed (useful for spotting cheaters)
set scr_spectatefree "$C2M_SCR_SPECTATEFREE" // free look
set scr_spectateenemy "$C2M_SCR_SPECTATEENEMY" // spectate enemy
set scr_forcerespawn "$C2M_SCR_FORCERESPAWN" // force dead players to respawn
set g_deadchat "$C2M_G_DEADCHAT"

//Force Auto-Assign
set scr_force_autoassign "$C2M_SCR_FORCE_AUTOASSIGN" //[on/off] Forces a player to auto-assign even if he selects Axis or Aliies. If the client downloads the mod, the relevant options will disappear for him/her when this is turned on.

// ----------------------------------- //
// general settings (not so important) //
// ----------------------------------- //
set sv_pure "$C2M_SV_PURE" // pure file checking
set sv_cheats "$C2M_SV_CHEATS" // enable / disable cheats
set sv_minPing "$C2M_SV_MINPING"
set sv_maxPing "$C2M_SV_MAXPING" // max ping limit
set sv_disableClientConsole "$C2M_SV_DISABLECLIENTCONSOLE" // disable clients console
set sv_reconnectlimit "$C2M_SV_RECONNECTLIMIT" // limit how long a player must wait to reconnect
set sv_allowAnonymous "$C2M_SV_ALLOWANONYMOUS"
set sv_allowdownload "$C2M_SV_ALLOWDOWNLOAD" // enable downloading
set sv_maxRate "$C2M_SV_MAXRATE" // max server rate
set g_banIPs "$C2M_G_BANIPS" // Ban selected Ip's from joining your server - i.e. "127.0.0.1, 127.0.0.1" (I think)
set sv_floodProtect "$C2M_SV_FLOODPROTECT" // flood protection
set sv_voice "$C2M_SV_VOICE" // Allows voice coms in game
set sv_voiceQuality "$C2M_SV_VOICEQUALITY" // Voice Quality - Range 0-9
set g_log "games_mp.log" // change to 'games_mp.log' to enable logging
set g_logsync "1"

//set scr_allow_sprint "1" //Default = 1
//set scr_sprint_speed 1 //1-3
//set scr_sprint_time "9" //3 is default. Up to 20
//set scr_sprint_regen_time "6" //to make a 0-100% regen while not moving. Note: It takes twice as long to regen while moving
//set scr_sprint_heavy_flag "1" //No sprint in CTF, ICTF, or RCTF
//set scr_sprint_hud "1" //Displays a sprint health bar. Default = 1.

// ------------------ //
// game type settings //
// ------------------ //

// S&D
set scr_sd_bombtimer "60" // Time until the bomb explodes once planted, in seconds
set scr_sd_scorelimit "10" // Map score limit
set scr_sd_timelimit "15" // Map time limit, in minutes - 0 to 1440
set scr_sd_roundlimit "10" // Max number of round wins per map
set scr_sd_roundlength "5" // Round length, in minutes
set scr_sd_graceperiod "15" // Time at round start where spawning and weapon choosing is still allowed, 0 - 60 seconds

// HQ
set scr_hqt_scorelimit "500"
set scr_hqt_timelimit "15"
set scr_hqt_roundlimit "1" // Max number of round wins per map

// SW
set scr_sw_scorelimit "7"
set scr_sw_timelimit "350"
set scr_sw_roundlimit "11"
set scr_sw_roundlength "10"
set scr_sw_graceperiod "10"

// TDM
set scr_tdm_scorelimit "200"
set scr_tdm_timelimit "15"

// DM
set scr_dm_scorelimit "150"
set scr_dm_timelimit "15"

// CTF
set scr_ctf_scorelimit "5"
set scr_ctf_timelimit "20"

// Behind Enemy Lines Settings
set scr_bel_alivepointtime "10"
set scr_bel_scorelimit "50"
set scr_bel_timelimit "20"

// Retrieval Settings
set scr_re_graceperiod "20"
set scr_re_roundlength "5"
set scr_re_roundlimit "7"
set scr_re_scorelimit "5"
set scr_re_showcarrier "0"
set scr_re_timelimit "15"

// ------------------ //
// set gameype to run //
// ------------------ //
set g_gametype "hq"

// ------------ //
// map rotation //
// ------------ //
set sv_mapRotation "gametype sd map mp_harbor gametype sd map mp_breakout gametype sd map mp_burgundy gametype sd map mp_toujane gametype sd map mp_dawnville gametype sd map mp_carentan gametype sd map mp_brecourt gametype sd map mp_matmata gametype sd map mp_trainstation gametype sd map mp_railyard" //default sd maps

//set sv_maprotationcurrent ""
//set sv_MapRotation ""

map_rotate // this must be at the bottom of your config

EOF

./cod2server start

sleep inf & wait
