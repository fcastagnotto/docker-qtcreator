# QTcreator into a Linux Container

This Docker container permits to execute the software *QtCreator* without install the build tools into the base Operating System.

## QtCreator install
The *QtCreator* installer need to be downloaded via the official website
[Download qt installer] (https://www.qt.io/download-qt-installer?hsCtaTracking=99d9dd4f-5681-48d2-b096-470725510d34%7C074ddad0-fdef-4e53-8aa8-5e8a876d6ab4)

## QT folder bindings
The QtCreator files, the QT libraries and the configurations will be saved into the local folder, that is binded into the container.

# How to use
To start the container use:
```shell
$ ./dockerrun.#!/bin/sh
```
