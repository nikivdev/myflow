source ~/src/config/fish/functions-and-alias.fish

# path
fish_add_path ~/.bun/bin/
fish_add_path ~/src/config/bin
fish_add_path ~/src/config/bin/private
fish_add_path ~/.local/share/solana/install/active_release/bin

# TODO: uncomment if things break, trying to use bun only
# pnpm
#set -gx PATH /Users/nikiv/Library/pnpm $PATH
# pnpm
#set -gx PNPM_HOME /Users/nikiv/Library/pnpm
#kset -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# node version switcher
fnm env --use-on-cd | source # https://github.com/Schniz/fnm#fish-shell setup

# go
set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin

# other
__fish_cursor_xterm line # make cursor into thin line (doesn't make a difference in Warp.dev)
set fish_cursor_unknown block

direnv hook fish | source

# testing
