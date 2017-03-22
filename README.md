# homebridge-vera Docker

This docker uses VeraLink by damianxd (https://github.com/damianxd/homebridge-vera) and HomeBridge by nfarina (https://github.com/nfarina/homebridge).

This docker was designed to work with unRaid Media Server.


Installation
===
Requires the Docker to run.

## Docker HELP

Build image:
$ docker build -t jrowland/homebridge-vera .

Run image:
$ docker run --net=host -p 51826:51826 jrowland/homebridge-vera

One liner to stop / remove all of Docker containers:
$ docker stop $(docker ps -a -q)
$ docker rm $(docker ps -a -q)

And similar for all images:
$  docker rmi $(docker images -q)
