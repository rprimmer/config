# ~/.bash_profile
# Use this file for globals, bashrc for locals 

export MANPAGER="sh -c 'col -bx | bat -l man -p'"  # Use colors with MAN pages.

# Homebrew is loacted in /usr/local on Intel macs and /opt/homebrew on ARM macs 
if [ -d "/usr/local/Caskroom" ]; then
    BREW_PATH=/usr/local
else
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

# Uncomment to get color for {g,}ls(1)
# export CLICOLOR=1                        # use colors for ls(1) command
# export LSCOLORS=Exfxcxdxbxegedabagacad   # set LS colors; cf. ls(1) for details

# To set colors for eza(1), cf. eza_colors(5)

# set up Auto Jump for shell
test -r "${BREW_PATH}/etc/profile.d/autojump.sh" && source "${BREW_PATH}/etc/profile.d/autojump.sh"

# iterm2 customizations
test -r "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# bashrc sets local environment vars and funcitons, aliases, etc
test -r ~/.bashrc && source ~/.bashrc   
