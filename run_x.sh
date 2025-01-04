#!/bin/bash

export DESIGNS="$HOME/opdk/designs"
echo "DESIGNS is set to $DESIGNS"

#export WEBSERVER_PORT=
#echo "WEBSERVER_PORT is set to $WEBSERVER_PORT"

#export VNC_PORT=
#echo "VNC_PORT is set to $VNC_PORT"

export DOCKER_USER=""
echo "DOCKER_USER is set to $DOCKER_USER"

export DOCKER_IMAGE=sg13g2-tools
echo "DOCKER_IMAGE is set to $DOCKER_IMAGE"

export DOCKER_TAG=latest
echo "DOCKER_TAG is set to $DOCKER_TAG"

#export CONTAINER_USER=
#echo "CONTAINER_USER is set to $CONTAINER_USER"

#export CONTAINER_GROUP=
#echo "CONTAINER_GROUP is set to $CONTAINER_GROUP"

export CONTAINER_NAME=opdk-tools
echo "CONTAINER_NAME is set to $CONTAINER_NAME"

export DISP=host.docker.internal:0
echo "DISP is set to $DISP"

#export XSOCK=/tmp/.X11-unix

# export DRY_RUN=1

if [ -n "${DRY_RUN}" ]; then
    ./start_x.sh
else
    docker run -it --user 1000:1000 \
    -e DISPLAY=host.docker.internal:0 \
    -e XAUTHORITY=/headless/.xauthority \
    -v /home/hunter/opdk/designs:/foss/designs:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /tmp/.opdk-tools_xauthority:/headless/.xauthority:rw \
    --device=/dev/dri:/dev/dri \
    --name opdk-tools sg13g2-tools:latest
fi