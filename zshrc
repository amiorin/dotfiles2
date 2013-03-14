# vim: sw=2 ts=2 et :
#
# autojump
# fasd is better
#[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# oh-my-zsh home
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# theme
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="pygmalion"
#ZSH_THEME="flazz"
ZSH_THEME="bira"

# plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rvm lein git brew gem npm vi-mode history-substring-search)

source $ZSH/oh-my-zsh.sh

# vi mode
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

# misc
fpath=(/usr/local/Cellar/ack/1.96/share/zsh/site-functions $fpath)
compinit -u

# 10ms for key sequences
# Esc in vi insert takes 40ms (default)
KEYTIMEOUT=1

# z
#. `brew --prefix`/etc/profile.d/z.sh

# server
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}

# fasd
eval "$(fasd --init auto)"
alias v="f -e mvim2"
alias o='a -e open'

# ls
alias ll="ls -l"
alias l="ls -la"
alias rt="ls -lrt"

# alias
# fasd uses a s d f z v o
alias u="cd .."
alias m="mvim"
alias b="bundle"
alias g="git"

# man
export PAGER="col -b | sed 's/1m\(.*\)0m/\1/' | open -a /Applications/Google\ Chrome.app -f"


# rvmrc and zsh
[[ `type __rvm_project_rvmrc`"" == 'function' ]] && __rvm_project_rvmrc
