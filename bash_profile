# ~/.bash_profile

export BASH=/usr/local/bin/bash   # Use brew version of bash, Apple's version is ancient
export SHELL=/usr/local/bin/bash  
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
export MANPATH=/usr/local/share/man:/usr/share/man:/Library/Apple/usr/share/man:/usr/lib/*/man:/usr/share/*/man:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/share/man/:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man:/Library/Developer/CommandLineTools/usr/share/man/

# gls(1) by default adds single quotes around filenames with spaces.
# To get back to standard ls(1) behavior use -N or export this variable. 
# TL;DR this change to coreutils isn't opt-in, you have to explicitly opt-out.
# cf. https://tinyurl.com/2c7jpm2f
export QUOTING_STYLE=literal

# Chaning prompt to use colors messes up iTerm's ability to return cursor to BOL
# export PS1="\e[1;34m\w$ \e[m"          # light blue prompt
export PS1="\\w\\$ "

export CLICOLOR=1                        # use colors for ls(1) command
export LSCOLORS=Exfxcxdxbxegedabagacad   # set LS colors; cf. ls(1) for details

# set up Auto Jump for shell
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
 
test -r ~/.bashrc && source ~/.bashrc    # .bashrc to continue setup 
