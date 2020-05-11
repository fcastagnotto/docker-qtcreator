#docker run --rm -it --volume `pwd`:/yocto -w /yocto/ --name qtdocker -t qtcontainer:latest /bin/bash
#docker run  --rm -it --volume `pwd`:/yocto --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v /dev/shm:/dev/shm --name qtLXC qtcontainer /bin/bash
#docker run --rm -it -v /tmp:/tmp -v `pwd`/sdk:/sdk -v `pwd`/QTcreator/conf:/home/jenkins/.config/ -v `pwd`/QTcreator:/qtcreator -v `pwd`:/yocto -v /home/fcastagnotto/DEV/REPO/QT:/qt -v ="$HOME/.Xauthority:/root/.Xauthority:rw" --net=host --env="DISPLAY"--name qtLXC qtcontainer -c "%U %G" /home/jenkins/.config/
####docker run --rm -it -v "$PWD:/yocto" -v "$PWD/sdk:/sdk" -v "$PWD/QTcreator:/qtcreator" -v /tmp:/tmp -v /home/fcastagnotto/DEV/REPO/QT:/qt -v "$PWD/QTcreator/conf:/home/jenkins/.config/:rw" -v ="$HOME/.Xauthority:/root/.Xauthority" --env="DISPLAY" --net=host --name qtLXC qtcontainer
docker run -it --rm --hostname="qtLXC" --name qtLXC -v /tmp:/tmp -v /dev/shm:/dev/shm -v "$PWD:/yocto" -v "$PWD/QTcreator:/qtcreator" -v "$PWD/sdk:/opt/endor/" -v /home/fcastagnotto/DEV/REPO/QT:/qtcode -v "$PWD/QTcreator/conf:/home/jenkins/.config/:rw" -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --net=host qtcontainer /bin/bash


exit 0
