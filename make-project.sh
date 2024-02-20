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

CONFIG=${HOME}/ic/linux/config

mkdir -p ${PROJECT}/bin ${PROJECT}/obj ${PROJECT}/src ${PROJECT}/.vscode 

cd ${PROJECT}

cp ${CONFIG}/makefile-${MAKE} ./makefile
cp ${CONFIG}/C.gitignore ./.gitignore
cp ${CONFIG}/clang-format ./.clang-format 

echo \# Project ${PROJECT} > README.md 

cd .vscode 

cp -r ${CONFIG}/vscode/* .
