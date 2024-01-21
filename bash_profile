# ~/.bash_profile

# Use this file for globals, bashrc for locals 

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
export PATH="~/bin:${PATH}" 

# gls(1) by default adds single quotes around filenames with spaces.
# To get back to standard ls(1) behavior use -N or export this variable. 
# TL;DR this change to coreutils isn't opt-in, you have to explicitly opt-out.
# cf. https://tinyurl.com/2c7jpm2f
export QUOTING_STYLE=literal

# Changing prompt to use colors messes up iTerm's ability to return cursor to Beginning of Line
# export PS1="\e[1;34m\w$ \e[m"          # light blue prompt
export PS1="\\w\\$ "

# Uncomment to get color for {g,}ls(1)
# export CLICOLOR=1                        # use colors for ls(1) command
# export LSCOLORS=Exfxcxdxbxegedabagacad   # set LS colors; cf. ls(1) for details

# To set colors for exa(1), cf. exa_colors(5)

# set up Auto Jump for shell
test -r "${BREW_PATH}/etc/profile.d/autojump.sh" && source "${BREW_PATH}/etc/profile.d/autojump.sh"

test -r "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

test -r ~/.bashrc && source ~/.bashrc   
