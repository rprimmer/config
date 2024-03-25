#!/usr/bin/env sh

# Create and populate a new C project folder

[ $# -lt 2 ] && { echo "Usage: `basename $0` project-name light | full";  exit 1; }

# Use "light" or "full" as arg 2 to indicate which version of the makefile to use

if [ "$2" = "light" ] || [ "$2" = "full" ] ; then
    MAKE=$2
else
    echo "Error: argument 2 must be either light or full"
    echo "Usage: `basename $0` project-name light | full"
    exit 1
fi

[ -e $1 ] && { echo "Error: project folder $1 already exists";  exit 1; }

PROJECT=$1

CONFIG=${HOME}/Documents/linux/config
CONFIG_SRC=${CONFIG}/src

mkdir -p ${PROJECT}/bin ${PROJECT}/obj ${PROJECT}/src ${PROJECT}/docs ${PROJECT}/.vscode 

cd ${PROJECT}

cp ${CONFIG_SRC}/makefile-${MAKE} ./makefile
cp ${CONFIG_SRC}/main.c ./src/main.c
cp ${CONFIG_SRC}/system-actions.c ./src/system-actions.c
cp ${CONFIG_SRC}/system-actions.h ./src/system-actions.h
cp ${CONFIG_SRC}/C.gitignore ./.gitignore

echo \# Project ${PROJECT} > README.md 

cp ${CONFIG}/vscode/clang-format ./.clang-format

cd .vscode 
cp -r ${CONFIG}/vscode/* .
