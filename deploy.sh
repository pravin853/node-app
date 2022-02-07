#!/bin/bash

# This is to demo

node_app=`docker ps -a | grep node-app | awk '{print $NF}'`
if [ $node_app=='node-app' ]; then
    echo "node-app is running, lets delete"
        docker rm -f node-app
fi

images=`docker images | grep kammana/nodejenkins | awk '{print $3}'`
docker rmi $images
docker run -d -p 8080:8080 --name node-app $1
