# I don't use /bin/zsh interactively, but it is used in batch by some programs.
# Therefore, need to add homebrew path here too

# Homebrew is located in /usr/local on Intel macs and /opt/homebrew on ARM macs.
# By default, /usr/local/bin is in /etc/paths on macOS, so no need to adjust PATH there.
# But it does need to explicitly be added on ARM macs. 

# Also need Python path
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

# Determine the Homebrew installation path
if [ -d "/usr/local/Caskroom" ]; then
    BREW_PATH="/usr/local"
elif [ -d "/opt/homebrew" ]; then
    BREW_PATH="/opt/homebrew"
else
    echo "Homebrew is essential but not found. Please install Homebrew."
    BREW_PATH=""
fi

# If Homebrew is found, set up the environment
if [ -n "$BREW_PATH" ]; then
    eval "$("${BREW_PATH}/bin/brew" shellenv)"
    export PATH="${BREW_PATH}/bin:${PATH}"
fi
