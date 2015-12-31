#!/usr/bin/env bash

cd $HOME/bin/dotfiles

stow -t $HOME bash
stow bin
stow -t $HOME emacs
stow -t $HOME git
stow -t $HOME misc
stow -t $HOME vim
