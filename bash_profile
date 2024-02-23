# ~/.bash_profile
# Use this file for globals, bashrc for locals 

# Use colors with man pages on my mac pro, but it's too dark on MBP
if [[ $(uname -m) == "x86_64" ]]; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"  # Use colors with MAN pages
fi

# Homebrew is loacted in /usr/local on Intel macs and /opt/homebrew on ARM macs 
if [ -d "/usr/local/Caskroom" ]; then
    BREW_PATH=/usr/local
elif [ -d "/opt/homebrew" ]; then
    BREW_PATH=/opt/homebrew
fi

# Set PATH and environment vars for homebrew (cf. man brew)
eval "$(${BREW_PATH}/bin/brew shellenv)"

# Use brew version of bash, Apple's version is ancient
export BASH=${BREW_PATH}/bin/bash   
export SHELL=${BREW_PATH}/bin/bash  

# My bin should always come first in the path
export PATH="~/bin:${PATH}" 

# Changing prompt to use colors messes up iTerm's ability to return cursor to Beginning of Line
# export PS1="\e[1;34m\w$ \e[m"          # light blue prompt
export PS1="\\w\\$ "

# gls(1) by default adds single quotes around filenames with spaces.
# To get back to standard ls(1) behavior use gls -N or export this variable. 
# TL;DR this change to coreutils isn't opt-in, you have to explicitly opt-out.
# cf. https://tinyurl.com/2c7jpm2f
# Uncomment below if using gls
# export QUOTING_STYLE=literal

# set up Auto Jump for shell
test -r "${BREW_PATH}/etc/profile.d/autojump.sh" && source "${BREW_PATH}/etc/profile.d/autojump.sh"

# iterm2 customizations
test -r "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# enable bash_completions package 
[[ -r "${BREW_PATH}/etc/profile.d/bash_completion.sh" ]] && . "${BREW_PATH}/etc/profile.d/bash_completion.sh"

# bashrc sets local environment vars and funcitons, aliases, etc
test -r ~/.bashrc && source ~/.bashrc   
