# vim: sw=2 ts=2 et fdm=marker fdl=0 :
#
# autojump {{{1
# fasd is better
#[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# oh-my-zsh home {{{1
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# theme {{{1
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="pygmalion"
#ZSH_THEME="flazz"
ZSH_THEME="bira"

# misc {{{1
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# plugins {{{1
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rvm bundler lein git brew gem npm vi-mode history-substring-search)

source $ZSH/oh-my-zsh.sh
# path {{{1
# Customize to your needs...
PATH=/usr/local/share/python:/usr/local/sbin:/usr/local/bin:$PATH

# vi mode {{{1
bindkey -v
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^[[Z' reverse-menu-complete
# like vim 'backspace'
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char

# misc {{{1
fpath=(/usr/local/Cellar/ack/1.96/share/zsh/site-functions $fpath)
compinit -u

# 10ms for key sequences
# Esc in vi insert takes 40ms (default)
KEYTIMEOUT=1

# z {{{1
#. `brew --prefix`/etc/profile.d/z.sh

# server {{{1
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}

# fasd {{{1
eval "$(fasd --init auto)"
alias v="f -e mvim2"
alias o='a -e open'

# ls {{{1
alias ll="ls -l"
alias l="ls -la"
alias rt="ls -lrt"

# alias {{{1
alias u="cd .."
alias m="mvim"
alias b="bundle"
alias g="git"
# fasd uses a s d f z v o
# man {{{1
export PAGER="col -b | open -a /Applications/Google\ Chrome.app -f"
