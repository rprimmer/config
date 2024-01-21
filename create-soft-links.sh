#!/bin/sh

# Configure home directory soft links for new system set up
pushd ${HOME} || return 

# The Downloads dir stays in iCloud folder
# ln -fsv ic/Downloads Downloads

# The remaining files are now in ~/Downloads/linux 
ln -fsv ${HOME}/Documents/linux/config/bash_logout    .bash_logout
ln -fsv ${HOME}/Documents/linux/config/bash_profile   .bash_profile 
ln -fsv ${HOME}/Documents/linux/config/bashrc         .bashrc 
ln -fsv ${HOME}/Documents/linux/config/dircolors      .dircolors 
ln -fsv ${HOME}/Documents/linux/config/editreadrc     .editreadrc
ln -fsv ${HOME}/Documents/linux/config/emacs/init.el  .emacs 
ln -fsv ${HOME}/Documents/linux/config/gitconfig      .gitconfig 
ln -fsv ${HOME}/Documents/linux/config/inputrc        .inputrc
ln -fsv ${HOME}/Documents/linux/config/ssh            .ssh
ln -fsv ${HOME}/Documents/linux/config/vimrc          .vimrc
ln -fsv ${HOME}/Documents/linux/config/emacs          .xemacs
ln -fsv ${HOME}/Documents/linux/bin                   bin 

popd 
