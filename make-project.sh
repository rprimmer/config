#!/usr/bin/env sh

# Create and populate a new C project folder
# Restrictions: at present this setup assumes macOS, either on x86 or ARM

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
sed -i '' "s/PROGRAM = \(.*\)/PROGRAM = ${PROJECT}/g" makefile

cd src
cp ${CONFIG_SRC}/main.c ./main.c
cp ${CONFIG_SRC}/system-actions.c ./system-actions.c
cp ${CONFIG_SRC}/system-actions.h ./system-actions.h
cp ${CONFIG_SRC}/foo.h ./${PROJECT}.h
cp ${CONFIG_SRC}/foo.c ./${PROJECT}.c
sed -i '' "s/foo/${PROJECT}/g" ${PROJECT}.h
sed -i '' "s/foo/${PROJECT}/g" ${PROJECT}.c

cd ..
cp ${CONFIG_SRC}/C.gitignore ./.gitignore

echo \# Project ${PROJECT} > README.md 

cp ${CONFIG}/vscode/clang-format ./.clang-format

cd .vscode 
cp -r ${CONFIG}/vscode/*.json .
sed -i '' "s/foo/${PROJECT}/g" launch.json
sed -i '' "s/foo/${PROJECT}/g" settings.json
sed -i '' "s/foo/${PROJECT}/g" tasks.json

chipset=`uname -m`
if [ "$chipset" = "arm64" ] ; then
    sed -i '' "s/foo/macos-clang-arm64/g" c_cpp_properties.json
elif [ "$chipset" = "x86_64" ] ; then
    sed -i '' "s/foo/macos-clang-x64/g" c_cpp_properties.json
else
    printf "Unrecognized system: %s\n" $chipset 
fi
