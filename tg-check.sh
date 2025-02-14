#!/bin/bash

PROGRAM_NAME_GREP="[t]raffic-generator"
PROGRAM_NAME="traffic-generator"
PROGRAM_CMD="continuous"

if [ -z "$1" ]; then
  echo "Usage: $0 <PROGRAM_PATH> <PROGRAM_FILE>"
  exit 1
elif [ -z "2" ]; then
  echo "Usage: $0 <PROGRAM_PATH> <PROGRAM_FILE>"
  exit 1
fi

PROGRAM_PATH=$1
PROGRAM_FILE=$2

# Check if the program is running
#
PID=$(ps aux | grep "$PROGRAM_NAME_GREP" | awk '{print $2}')

if [ -z "$PID" ]; then 
    echo "$PROGRAM_NAME is not running. Starting it now..."
    nohup "$PROGRAM_PATH/$PROGRAM_NAME"  $PROGRAM_CMD "$PROGRAM_FILE" &> /dev/null &
    PID=$(ps aux | grep "[t]raffic-generator" | awk '{print $2}')

fi
if [ -z "$PID" ]; then
    echo "Failed to start $PROGRAM_NAME"
    echo "make sure you are using sudo to run this script(needed for listeners on ports < 1024)"
    exit 1
fi
echo "$PROGRAM_NAME is running. ID $PID"
