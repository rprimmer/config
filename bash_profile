# ~/.bash_profile
# Use this file for globals, bashrc for locals

# Use colors with man pages on my MP, but it's too dark on the MBP-M2
if [[ $(uname -m) == "x86_64" ]]; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"  # Use colors with MAN pages
fi

# Locate Homebrew dynamically by checking for the executable
if [[ -x "/opt/homebrew/bin/brew" ]]; then
    BREW_PATH="/opt/homebrew"
elif [[ -x "/usr/local/bin/brew" ]]; then
    BREW_PATH="/usr/local"
elif command -v brew >/dev/null 2>&1; then
    # Fallback: if brew is already in the PATH but in a non-standard location
    BREW_PATH="$(dirname "$(dirname "$(command -v brew)")")"
else
    echo "Homebrew is essential but not found. Please install Homebrew."
    BREW_PATH=""
fi 

[[ -n "$BREW_PATH" ]] && eval "$("${BREW_PATH}"/bin/brew shellenv)"

# Use brew version of bash, Apple's version is ancient
if [[ -x "${BREW_PATH}/bin/bash" ]]; then
  export BASH="${BREW_PATH}/bin/bash"
  export SHELL="${BREW_PATH}/bin/bash"
fi

# enable bash_completions package
[[ -r "${BREW_PATH}/etc/profile.d/bash_completion.sh" ]] && source "${BREW_PATH}/etc/profile.d/bash_completion.sh"

# set up Auto Jump for shell
# [[ -r "${BREW_PATH}/etc/profile.d/autojump.sh" ]] && source "${BREW_PATH}/etc/profile.d/autojump.sh"

# My bin should always come first in the path
export PATH="$HOME/bin:${PATH}"

# Changing prompt to use colors messes up iTerm's ability to return cursor to Beginning of Line
# export PS1="\e[1;34m\w$ \e[m"          # light blue prompt
export PS1="\\w\\$ "

# gls(1) by default adds single quotes around filenames with spaces.
# To get back to standard ls(1) behavior use gls -N or export this variable.
# TL;DR this change to coreutils isn't opt-in, you have to explicitly opt-out.
# cf. https://tinyurl.com/2c7jpm2f
# Uncomment below if using gls
# export QUOTING_STYLE=literal

# iterm2 customizations
[[ -r "${HOME}/.iterm2_shell_integration.bash" ]] && source "${HOME}/.iterm2_shell_integration.bash"

# bashrc sets local environment vars and functions, aliases, etc
[[ -r ~/.bashrc ]] && source ~/.bashrc
