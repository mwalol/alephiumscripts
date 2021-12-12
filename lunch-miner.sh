#!/bin/bash

download() {
    apt-get install -y wget libuv1 libuv1-dev
    wget https://github.com/alephium/gpu-miner/releases/download/v0.4.3/alephium-0.4.3-cuda-miner-linux
    chmod +x alephium-0.4.3-cuda-miner-linux
}

checkminer() {
    FILE=alephium-0.4.3-cuda-miner-linux
    if test -f "$FILE"; then
        echo "$FILE exists."
    else
        download
    fi
}

checkservice () {
    echo "./lunch_miner.sh -a ip"
    SERVICE="aleph"
    if pgrep -l "$SERVICE" >/dev/null
    then
        echo "$SERVICE is running"

    else
        echo "$SERVICE stopped"
        if [ -z "$1" ]
        then
                echo "using 127.0.0.1 as nodeip"
                nohup ./alephium-0.4.3-cuda-miner-linux -a 127.0.0.1 > logs.txt &
        else
                echo "using $1 as nodeip"
                nohup ./alephium-0.4.3-cuda-miner-linux -a $1 > logs.txt &
        fi

        echo "Continue..."
    fi
}

checkminer

while :
do
    checkservice $1
        sleep 10
done

