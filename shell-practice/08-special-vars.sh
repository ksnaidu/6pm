#!/bin/bash

echo "All varaibles passed to the script: $@"
echo "Number of varaibles: $#"

echo "Script name: $0"
echo "Current Directory: $PWD"
echo "User running this script: $USER"
echo "Home directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"

