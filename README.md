# Call of Duty 2 server
Dockerized Call of Duty 2 server

---

## Purpose

The purpose of this repo is to provide a dockerized version of a `call of duty 2` server so it can be run in any docker-enabled VM anywhere, without the need of any setup whatsoever.


## How do I turn this on?

Super simple! Just run the following command, and feel free to connect and pew pew the hell out of your friends:

`docker run -d --restart=always --rm --name myCod2Server --env SV_HOSTNAME="Cod2ServerHostname" --env SCR_MOTD="MyMessageOfTheDay" --env RCON_PASSWORD="myAdminPassword" -p 28960:28960 korrd2/cod2server:latest`

> NOTE: if you want it to be internet-accessible, you will need to open port 28960 on your router.

## Credits

This version is based on the one at [linuxgsm](https://linuxgsm.com/lgsm/cod2server). Thank you for your hard work!
Feel free to drop by their site and give them a thumbs up :)
