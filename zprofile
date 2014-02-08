PATH=~/local/hadoop/bin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $HOME/.nvm ]] && source $HOME/.nvm/nvm.sh

# go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
