# Flotilla Daemon Visual Studio/Linux

Visual Studio project, Makefile and files for Flotilla Daemon

## Requires

* WebsocketPP: https://github.com/zaphoyd/websocketpp
* libserialport: https://github.com/martinling/libserialport

## Docker

> docker build -t flotilla .

connect your dock and assuming it appears as /dev/ttyACM0 run:

> docker run -it --rm -p 9395:9395 --device=/dev/ttyACM0 flotilla 

then visit http://flotil.la/rockpool
