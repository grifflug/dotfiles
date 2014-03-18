#!/bin/bash

DOTFILES=$HOME/.dotfiles
PRIVATE=$DOTFILES/private

if [ -d "$PRIVATE" ]; then
  rm -Rf $PRIVATE;
fi

git rm -f private

echo "Please enter the address to your git that has your settings: "
read input_variable
echo "You entered: $input_variable"

#swap to a 

git clone $input_variable private 
# Make sure everything is up-to-date

unlink ~/.bash_profile;
unlink ~/.bashrc;
unlink ~/.gitconfig;

link $DOTFILES/.bash_profile ~/.bash_profile;
link $DOTFILES/.bashrc ~/.bashrc;
link $DOTFILES/.gitconfig ~/.gitconfig;