# TODO: what is this?
if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/src/config/fish/functions-and-alias.fish
source ~/src/config/fish/private.fish

# path
fish_add_path /opt/homebrew/bin
fish_add_path ~/.bun/bin/
fish_add_path ~/src/config/bin
fish_add_path ~/src/config/bin/private
fish_add_path ~/.local/share/solana/install/active_release/bin
fish_add_path ~/.cargo/bin

# node version switcher
fnm env --use-on-cd | source # https://github.com/Schniz/fnm#fish-shell setup

# edgedb
# TODO: don't hard code /nikiv/ (how to do ~/ in fish?)
source "/Users/nikiv/Library/Application Support/edgedb/env"

# go
set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# -- other
__fish_cursor_xterm line # make cursor into thin line (doesn't make a difference in Warp.dev)
#set fish_cursor_unknown block

# https://docs.nativescript.org/setup/macos#setting-up-macos-for-ios
fish_add_path /opt/homebrew/lib/ruby/gems/2.7.0/bin

# testing area below (anything useful is moved up)

# TODO: uncomment if things break, trying to use bun only
# pnpm
set -gx PNPM_HOME /Users/nikiv/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end


ulimit -f unlimited
set -Ux NODE_OPTIONS "--max-old-space-size=8096"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# TODO: adds `base` to shell which is annoying
# if test -f /Users/nikiv/miniconda3/bin/conda
#     eval /Users/nikiv/miniconda3/bin/conda "shell.fish" hook $argv | source
# else
#     if test -f "/Users/nikiv/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/Users/nikiv/miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH /Users/nikiv/miniconda3/bin $PATH
#     end
# end
# <<< conda initialize <<<

# mise activate fish | source

# Deno
set -gx DENO_INSTALL "/Users/nikiv/.deno"
set -gx PATH "$DENO_INSTALL/bin" $PATH

# Atuin (shell history)
set -gx ATUIN_NOBIND true
atuin init fish | source
# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
# TODO: doesn't work due to https://github.com/warpdotdev/Warp/issues/537..
bind \cr _atuin_search
bind -M insert \cr _atuin_search

# LLVM
fish_add_path /opt/homebrew/opt/llvm/bin

# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# direnv
direnv hook fish | source

# odin TODO: fix below, LSP doesn't work, not sure about what `if test -d` purpose is, test it works on https://github.com/thetarnav/odin-graphql-parser
set -x ODIN_ROOT "$HOME/clones/odin"
if test -d $ODIN_ROOT
    set -x PATH $PATH $ODIN_ROOT
else
    echo "ODIN LANG NOT FOUND IN \"$ODIN_ROOT\"!"
end

fish_add_path ~/bin
