#!/usr/bin/env bash

# Create and populate a new C project folder
# Restrictions: this setup assumes macOS, either x86 or ARM

set -euo pipefail

[ $# -lt 2 ] && { echo "Usage: $(basename "$0") project-name light | full";  exit 1; }

# Use "light" or "full" as arg 2 to indicate which version of the makefile to use

if [ "$2" = "light" ] || [ "$2" = "full" ] ; then
    MAKE=$2
else
    echo "Error: argument 2 must be either light or full"
    echo "Usage: $(basename "$0") project-name light | full"
    exit 1
fi

[ -e "$1" ] && { echo "Error: project folder $1 already exists";  exit 1; }

PROJECT=$1

mkdir -p "${PROJECT}"/bin "${PROJECT}"/obj "${PROJECT}"/src "${PROJECT}"/docs "${PROJECT}"/man "${PROJECT}"/.vscode 

CONFIG=${HOME}/Documents/linux/config
CONFIG_SRC=${CONFIG}/c-src

cd "${PROJECT}" || exit

cp "${CONFIG_SRC}"/makefile-"${MAKE}" ./GNUmakefile
sed -i '' "s/foo/${PROJECT}/g" GNUmakefile

cd src || exit
cp "${CONFIG_SRC}"/main.c ./main.c
sed -i '' "s/foo/${PROJECT}/g" main.c
cp "${CONFIG_SRC}"/system-actions.c ./system-actions.c
cp "${CONFIG_SRC}"/system-actions.h ./system-actions.h
cp "${CONFIG_SRC}"/foo.h ./"${PROJECT}".h
cp "${CONFIG_SRC}"/foo.c ./"${PROJECT}".c
sed -i '' "s/foo/${PROJECT}/g" "${PROJECT}".h
sed -i '' "s/foo/${PROJECT}/g" "${PROJECT}".c

cd .. || exit
cp "${CONFIG_SRC}"/C.gitignore ./.gitignore
cp "${CONFIG}"/vscode/clang-format ./.clang-format

cd .vscode || exit 
cp -r "${CONFIG}"/vscode/*.json .
sed -i '' "s/foo/${PROJECT}/g" launch.json
sed -i '' "s/foo/${PROJECT}/g" settings.json
sed -i '' "s/foo/${PROJECT}/g" tasks.json

chipset=$(uname -m)
if [ "$chipset" = "arm64" ] ; then
    sed -i '' "s/foo/macos-clang-arm64/g" c_cpp_properties.json
elif [ "$chipset" = "x86_64" ] ; then
    sed -i '' "s/foo/macos-clang-x64/g" c_cpp_properties.json
else
    printf "Unrecognized system: %s\n" "$chipset" 
fi

cd ../man || exit
CONFIG_MAN=${CONFIG}/man
cp "${CONFIG_MAN}"/foo.1.in ./"${PROJECT}".1.in
sed -i '' "s/foo/${PROJECT}/g" "${PROJECT}".1.in

cd .. || exit 
echo \# Project "${PROJECT}" > README.md 

