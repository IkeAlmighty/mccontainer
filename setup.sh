#!bin/sh

python3 ./getLatestJar.py

./checkeula.sh

./setport.sh 25565

./setworld world