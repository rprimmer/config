#!/bin/sh

# shellcheck disable=SC3040
set -euo pipefail

# Configure home directory soft links for new system set up
# shellcheck disable=SC3044
pushd "${HOME}" || exit

# The Downloads dir stays in iCloud folder
# ln -fsv ic/Downloads Downloads

# The remaining files are now in ~/Downloads/linux 
ln -fsv "${HOME}"/Documents/linux/config/bash_logout    .bash_logout
ln -fsv "${HOME}"/Documents/linux/config/bash_profile   .bash_profile 
ln -fsv "${HOME}"/Documents/linux/config/bashrc         .bashrc 
ln -fsv "${HOME}"/Documents/linux/config/bash_aliases   .bash_aliases
ln -fsv "${HOME}"/Documents/linux/config/dircolors      .dircolors 
# ln -fsv ${HOME}/Documents/linux/config/editreadrc     .editreadrc
ln -fsv "${HOME}"/Documents/linux/config/emacs/init.el  .emacs 
ln -fsv "${HOME}"/Documents/linux/config/gitconfig      .gitconfig 
ln -fsv "${HOME}"/Documents/linux/config/inputrc        .inputrc
ln -fsv "${HOME}"/Documents/linux/config/profile        .profile
ln -fsv "${HOME}"/Documents/linux/config/ssh            .ssh
ln -fsv "${HOME}"/Documents/linux/config/vimrc          .vimrc
ln -fsv "${HOME}"/Documents/linux/config/emacs          .xemacs
ln -fsv "${HOME}"/Documents/linux/bin                   bin 
ln -fsv "${HOME}"/Library/Mobile\ Documents/com~apple~CloudDocs ic
ln -fsv "${HOME}"/Library/Mobile\ Documents/iCloud~md~obsidian/Documents ob

# shellcheck disable=SC3044
popd || exit 
