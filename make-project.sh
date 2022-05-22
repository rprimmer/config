#!/usr/bin/env bash

# Create and populate a new C project folder

[[ $# -eq 0 ]] && { echo "Usage: `basename $0` project-name";  exit 1; }

[[ -e $1 ]] && { echo "Project folder $1 already exists";  exit 1; }

PROJECT=$1
CONFIG=${HOME}/ic/linux/config

mkdir -p ${PROJECT}/bin ${PROJECT}/obj ${PROJECT}/src ${PROJECT}/.vscode 

cd ${PROJECT}

cp ${CONFIG}/makefile .

echo \# Project ${PROJECT} > README.md 

echo -en "*.dSYM\n*.o\n*.so\n*.dylib\n*.a\n${PROJECT}" > .gitignore

cd .vscode 

cp -r ${CONFIG}/vscode/* .
