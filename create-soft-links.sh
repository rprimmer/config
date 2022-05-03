#!/bin/sh

# Configure soft links for new system set up
pushd $HOME
ln -s ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs/ ic

ln -s ic/linux/config/bash_logout    .bash_logout
ln -s ic/linux/config/bash_profile   .bash_profile 
ln -s ic/linux/config/bashrc         .bashrc 
ln -s ic/linux/config/dircolors      .dircolors 
ln -s ic/linux/config/editreadrc     .editreadrc
ln -s ic/linux/config/emacs/init.el  .emacs 
ln -s ic/linux/config/gitconfig      .gitconfig 
ln -s ic/linux/config/inputrc        .inputrc
ln -s ic/linux/config/ssh            .ssh
ln -s ic/linux/config/vimrc          .vimrc
ln -s ic/linux/config/emacs          .xemacs
ln -s ic/Swift                       Swift 
ln -s ic/linux/bin                   bin 

popd 
