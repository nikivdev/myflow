# testing

# path

fish_add_path ~/.bun/bin/
# fish_add_path /opt/homebrew/bin
# fish_add_path ~/.dotfiles/bin
# fish_add_path $HOME/.cargo/bin # rust
# set -x PATH "$HOME/.cargo/bin:$PATH"

# source
source ~/.dotfiles/fish/alias.fish
source ~/.dotfiles/fish/functions.fish
# source "$HOME/.cargo/env"

__fish_cursor_xterm line # make cursor into thin line (doesn't make a difference in Warp.dev)

# pnpm
set -gx PNPM_HOME /Users/nikiv/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# go
set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin
