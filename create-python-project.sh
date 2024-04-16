#!/usr/bin/env bash

# set -x  # enable this for bash debugging

# Create and populate a new Python project folder
# Restrictions: 
#   This setup assumes macOS, either x86 or ARM
#   This script needs to be sourced to retain the instantiated Python virtual enviornment

# Since this script is sourced, it's harder to debug, so adding logging

PROJECT="$1"
LOG_FILE="$(pwd)/${PROJECT}.log"
rm -f ${LOG_FILE}

log() {
    local type="$1"
    local message="$2"
    echo "$(date "+%Y-%m-%d %H:%M:%S") [$type] - $message" >> "${LOG_FILE}"
}

log "INFO" "Script started."

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    log "ABORT" "Script must be sourced."
    exit 1
else
    log "INFO" "Script was sourced."
fi

[ $# -lt 1 ] && { log "ABORT" "Usage: source create-python-project.sh project-name";  exit 1; }

log "INFO" "Passed parameter test."

[ -e "$1" ] && { log "ABORT" "Project folder $1 already exists" ; exit 1; }

log "INFO" "Verified directory "$1" doesn't already exist."

CONFIG=${HOME}/Documents/linux/config
CONFIG_SRC=${CONFIG}/python

log "INFO" "Creating project directories"

mkdir -p "${PROJECT}" "${PROJECT}/venv" "${PROJECT}/.vscode" "${PROJECT}/man" || { log "ABORT" "Failed makdir"; exit 1; }

cd "${PROJECT}" || { log "ABORT" "Failed cd ${PROJECT}"; exit 1; }

log "INFO" "Successfully created ${PROJECT} folder."

cp "${CONFIG_SRC}"/Python.gitignore ./.gitignore
cp "${CONFIG}"/vscode/clang-format ./.clang-format

cd .vscode || { log "ABORT" "Failed cd .vscode"; exit 1; } 

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
    log "ERROR" "Unrecognized system: ${chipset}" 
fi

cd ../man || { log "ABORT" "Failed cd man"; exit 1; }

CONFIG_MAN=${CONFIG}/man
cp "${CONFIG_MAN}"/foo.1.in ./"${PROJECT}".1.in
sed -i '' "s/foo/${PROJECT}/g" "${PROJECT}".1.in

cd .. || { log "ABORT" "Failed cd ${PROJECT}"; exit 1; } 

log "INFO" "Copied all config files. Instantiating Python virtual environment."

# Only enable the content below if you want to create a python virtual environment
python3 -m venv venv 
source venv/bin/activate

log "INFO" "Python virtual environment created: ${PROJECT}/venv."

if [ -f "${CONFIG_SRC}/requirements.txt" ]; then
    pip3 install -r "${CONFIG_SRC}/requirements.txt"
    log "INFO" "pip packages installed."
else
    log "INFO" "No requirements.txt found. Skipping dependency installation."
fi

echo \# Project "${PROJECT}" > README.md
echo "#!/usr/bin/env python3" > ${PROJECT}.py

log "INFO"  "Project '${PROJECT}' set up successfully."

set +x  # turn off bash debugging

log "INFO" "Script ended."