# ENV vars

# Vars
# export EDITOR='nvim'
# export SUDO_EDITOR='nvim'

# PATH
export PATH=$PATH:~/.fnm/node-versions/v16.2.0/installation/lib/node_modules
export PATH=$PATH:~/.dotfiles/bin # Scripts & utilities
export PATH=$PATH:~/.dotfiles/bin/private # Private scripts & utilities
export PATH=$PATH:~/.cargo/bin # Rust
export GOPATH="$(go env GOPATH)" # Go
export PATH="$PATH:$GOPATH/bin" # Go
# export PATH=$PATH:~/anaconda3/bin # Anaconda
export PATH=$PATH:./node_modules/.bin
# export JAVA_HOME=$(/usr/libexec/java_home)

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf bindings and fuzzy completion
# eval "$(direnv hook zsh)"
# eval "$(starship init zsh)" # Zsh prompt (https://github.com/starship/starship)

# fnm
# eval "$(fnm env --multi)"
# eval "$(fnm env)" # https://github.com/Schniz/fnm

export PATH=$PATH:/usr/local/bin # brew

typeset -U PATH # Remove duplicates in $PATH
