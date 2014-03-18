#!/bin/bash
DOTFILES=$HOME/.dotfiles
PRIVATE=$DOTFILES/private

declare -a PRIVATE_ARR=($PRIVATE/.custom $PRIVATE/.profile $DOTFILES/.exports)
declare -a DOTFILES_ARR=($DOTFILES/.bash_prompt $DOTFILES/.aliases $DOTFILES/.functions)


loadFiles() 
{
	local_array=("$@")
	for file in ${local_array[@]}; do
	  echo "Loading $file"
	  [ -r $file ] && source $file
	done
	unset file
}


loadFiles "${PRIVATE_ARR[@]}";

loadFiles "${DOTFILES_ARR[@]}";



# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# RVM Stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
