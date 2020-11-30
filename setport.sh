#!/bin/sh

cd ./server
PORT=$1
sed -i -E s/server-port=.+/server-port=$PORT/ server.properties