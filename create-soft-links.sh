#!/bin/sh

# Configure soft links for new system set up
pushd ${HOME} || return 
ln -fs ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs/ ic

ln -fs ic/linux/config/bash_logout    .bash_logout
ln -fs ic/linux/config/bash_profile   .bash_profile 
ln -fs ic/linux/config/bashrc         .bashrc 
ln -fs ic/linux/config/dircolors      .dircolors 
ln -fs ic/linux/config/editreadrc     .editreadrc
ln -fs ic/linux/config/emacs/init.el  .emacs 
ln -fs ic/linux/config/gitconfig      .gitconfig 
ln -fs ic/linux/config/inputrc        .inputrc
ln -fs ic/linux/config/ssh            .ssh
ln -fs ic/linux/config/vimrc          .vimrc
ln -fs ic/linux/config/emacs          .xemacs
ln -fs ic/Swift                       Swift 
ln -fs ic/linux/bin                   bin 

popd 
