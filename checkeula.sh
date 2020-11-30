#!/bin/sh

cd ./server

# check if eula file exists:
EULA="./eula.txt"
if ! test -f "$EULA"; then
    echo "eula does not exist... running server.jar..."
    # if it does not, then run the server once to create it
    ./start.sh
fi

# ...and then accept the eula using sed
sed -i s/eula=false/eula=true/ eula.txt