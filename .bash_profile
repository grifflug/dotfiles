#!/bin/bash


myBash='.dotfiles' 


declare -a DOTFILES_ARR=(~/$myBash/.bash_prompt ~/$myBash/.exports ~/$myBash/.aliases ~/$myBash/.functions ~/$myBash/.git-completion.bash ~/$myBash/.profile)

for file in ${DOTFILES_ARR[@]}; do
  echo "Loading $file"
  [ -r $file ] && source $file
done
unset file

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# RVM Stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
