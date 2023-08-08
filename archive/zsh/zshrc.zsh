export PATH=/opt/homebrew/bin:$PATH
source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
source ~/.zsh_plugins.sh # Load zsh plugins (using antibody)
source ~/src/config/zsh/env.zsh
source ~/src/config/zsh/options.zsh
source ~/src/config/zsh/functions/functions.zsh
source ~/src/config/zsh/functions/fzf-functions.zsh
source ~/src/config/zsh/functions/git-functions.zsh
source ~/src/config/zsh/bindings.zsh
source ~/src/config/zsh/alias.zsh

eval "$(fnm env --use-on-cd)"

# EdgeDB
source ~/Library/Application\ Support/edgedb/env
fpath+=~/.zfun

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Bun
export BUN_INSTALL="/Users/nikivi/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# eval "$(mcfly init zsh)"

# Bun completions
[ -s "/Users/nikivi/.bun/_bun" ] && source "/Users/nikivi/.bun/_bun"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nikiv/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nikiv/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nikiv/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nikiv/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Deno
export PATH="/Users/nikiv/.deno/bin:$PATH"
export PNPM_HOME="/Users/nikiv/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# pnpm
export PNPM_HOME="/Users/nikiv/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun
BUN_INSTALL="/Users/nikiv/.bun"
PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(starship init zsh)"
