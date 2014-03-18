#!/bin/bash

DOTFILES=$HOME/.dotfiles
PRIVATE=$DOTFILES/private
DEFAULTSUBREPO="git@github.com:grifflug/private.git"

if [ -d "$PRIVATE" ]; then
  rm -Rf $PRIVATE;
fi


#Make this create and fill in the .profile file.
# echo "What is your default User: "
# read input_variable
# echo "You entered: $input_variable";


echo "Please enter the address to your git that has your settings: "
read gitRepo_variable
echo "You entered: $gitRepo_variable";


#this needs to be changed to submodule?
#Though there is a problem of changing the remote ref a submodule that is already
#been added. Help.
if [[ -z "$gitRepo_variable" ]]; then
    git clone $DEFAULTSUBREPO private; 
    cd $PRIVATE;
    git remote rm origin
    cd $DOTFILES;
else 
    git clone $gitRepo_variable private;
fi;

#install git comletion
curl https://gist.githubusercontent.com/jahead/9578308/raw/install-git-completion.sh -OL
source $DOTFILES/install-git-completion.sh
rm $DOTFILES/install-git-completion.sh
# Make sure everything is up-to-date

unlink ~/.bash_profile;
unlink ~/.bashrc;
unlink ~/.gitconfig;

link $DOTFILES/.bash_profile ~/.bash_profile;
link $DOTFILES/.bashrc ~/.bashrc;
link $DOTFILES/.gitconfig ~/.gitconfig;