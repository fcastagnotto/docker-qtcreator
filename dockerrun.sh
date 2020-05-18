#!/bin/bash

docker run -it --rm --hostname="qtLXC" --name qtLXC -v /tmp:/tmp -v /dev/shm:/dev/shm -v "$PWD:/home/jenkins" -v "$PWD/QTcreator:/qtcreator" -v "$PWD/qtcode:/qtcode" -v "$PWD/QTcreator/conf:/home/jenkins/.config/:rw" -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --net=host qtcontainer /bin/bash


exit 0
