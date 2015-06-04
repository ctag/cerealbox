#!/bin/bash

# This script will check the status of a print
# and have ReqQueen alert me when a print is done.

# "Locks" printer for our use
export CB_BUSY=1

FILE=$1

echo -n ..:fo >> /dev/ttyUSB0

MSG="Be aware, [${FILE}] replication has initiated. Coolant deactivated."

. /home/pi/cerealbox/rq_msg.sh "$MSG"


