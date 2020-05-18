# QTcreator into a Linux Container

This docker container permits to execute the last version of **QtCreator** into a container, without the need of install all the environement into your Operating System.
The software, the configurations of the software and the QT libraries will be installed into a system folder, bindend into the container, to reduce the size of the container image.

## Container
### build
The Dockerfile contains the environement needed by QtCreator. The docker build will create a container image named **qtcontainer**
```shell
$ docker build .
```

### start
To start the container use:
```shell
$ ./dockerrun.sh
```

## QTcreator
### install
The *QtCreator* installer need to be downloaded via the official website [here](https://www.qt.io/download-qt-installer?hsCtaTracking=99d9dd4f-5681-48d2-b096-470725510d34%7C074ddad0-fdef-4e53-8aa8-5e8a876d6ab4) and put into the root binded folder of the container. <br>

Once downloaded, start the container and launch the installer.
```shell
$ ./dockerrun
jenkins@qtLXC:~$ ./qt-unified-linux-x64-3.2.2-online.run
```
when the installation ask where to install **QTcreator** and the **QT**, use the bindend folder */QTcreator*.

### run
Just start the container and launch
```shell
jenkins@qtLXC:~$ qtcreator
```


## References

[Docker Project](https://www.docker.com/)<br>
[QtCreator](https://www.qt.io/download)<br>
[QtCreator Installer](https://www.qt.io/download-qt-installer?hsCtaTracking=99d9dd4f-5681-48d2-b096-470725510d34%7C074ddad0-fdef-4e53-8aa8-5e8a876d6ab4)<br>
[dannywillems/docker-qtcreator](https://github.com/dannywillems/docker-qtcreator)
