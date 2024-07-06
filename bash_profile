# ~/.bash_profile
# Use this file for globals, bashrc for locals 

# Use colors with man pages on my mac pro, but it's too dark on MBP
if [[ $(uname -m) == "x86_64" ]]; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"  # Use colors with MAN pages

  # Load user launch agents if not already loaded (MP only)
  ~/bin/load_launch_agents.sh 
fi

# Homebrew is loacted in /usr/local on Intel macs and /opt/homebrew on ARM macs 
if [ -d "/usr/local/Caskroom" ]; then
    BREW_PATH=/usr/local
elif [ -d "/opt/homebrew" ]; then
    BREW_PATH=/opt/homebrew
else
    echo "Homebrew is essential but not found. Please install Homebrew."
fi

if [ -n "$BREW_PATH" ]; then
  eval "$("${BREW_PATH}"/bin/brew shellenv)"
  # Use brew version of bash, Apple's version is ancient
  export BASH=${BREW_PATH}/bin/bash   
  export SHELL=${BREW_PATH}/bin/bash  
  export PATH="$BREW_PATH:$PATH"

  # enable bash_completions package 
  test -r "${BREW_PATH}/etc/profile.d/bash_completion.sh"  && source "${BREW_PATH}/etc/profile.d/bash_completion.sh"

  # set up Auto Jump for shell
  # Commented out for now as I'm not finding myself using this function that often.
  # test -r "${BREW_PATH}/etc/profile.d/autojump.sh" && source "${BREW_PATH}/etc/profile.d/autojump.sh"
fi

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

# iterm2 customizations
test -r "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# bashrc sets local environment vars and funcitons, aliases, etc
test -r ~/.bashrc && source ~/.bashrc   
