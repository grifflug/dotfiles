myBash='.dotfiles' 


for file in ~/$myBash/.{secrets,bash_prompt,exports,aliases,functions,git-completion.bash,profile}; do
    [ -r "$file" ] && source "$file"
    echo "Loading $file"
done
unset file

# RVM Stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
