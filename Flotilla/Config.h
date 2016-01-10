#pragma once
#ifndef _CONFIG_H
#define _CONFIG_H

#define MAX_DOCKS    8
#define MAX_CHANNELS 8

#define BAUD_RATE    115200

#define PID 0x08C3 //9220
#define VID 0x16D0 //1003
#define FLOTILLA_PORT 9395

#define PID_FILE_PATH "/var/run/flotilla.pid"
#define LOG_FILE_PATH "/var/log/flotilla.log"

#ifndef TRUE
#define TRUE  (1==1)
#endif
#ifndef FALSE
#define FALSE (1==0)
#endif

#endif