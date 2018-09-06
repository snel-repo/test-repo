#!/bin/bash

SERVER_NAME=''
ZONE=''

function start {

SERVER_NAME="$1"
ZONE="$2"

gcloud compute instances start ${SERVER_NAME} --zone=${ZONE} -q


}

function stop {

SERVER_NAME="$1"
ZONE="$2"

gcloud compute instances stop ${SERVER_NAME} --zone=${ZONE} -q


}

function delete {

SERVER_NAME="$1"
ZONE="$2"

gcloud compute instances delete ${SERVER_NAME} --zone=${ZONE} -q


}



if [ "$1" == 'help' -o "$1" == '-help' -o "$1" == '--help' ]
then
echo "Specify one of the following task: create, stop, delete server instance"
echo "To start a server instance run: bash /server-manager.sh start <server_name> <zone>"
echo "To stop a server instance run: bash /server-manager.sh stop <server_name> <zone>"
echo "To delete a server instnace run: bash /server-manager.sh delete <server_name> <zone>"
else
echo "Running task ${1}"
${@:1}
fi

