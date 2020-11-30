#!/bin/sh

cd ./server
WORLD=$1
# sed -i 's/server-port=.+/server-port="$PORT"' server.properties
sed -i -E s/level-name=.+/level-name=$WORLD/ server.properties