# alias _date="/Users/nikiv/.flox/run/aarch64-darwin.default/bin/date" # for debugging how long things take (wrap around lines to measure and see time diffs)

# path TODO: not used mostly
fish_add_path ~/.local/share/solana/install/active_release/bin
# TODO: can I use flox for this?
fish_add_path ~/bin
fish_add_path ~/bin/private

source ~/src/config/fish/alias.fish
source ~/src/config/fish/private.fish

# node version switcher TODO: use flox for this
fnm env --use-on-cd | source # https://github.com/Schniz/fnm#fish-shell setup

# edgedb TODO: need?
set -l edgedb_env "$HOME/Library/Application Support/edgedb/env"
if test -f $edgedb_env
    source $edgedb_env
else
    echo "EdgeDB environment file not found: $edgedb_env"
end

# make cursor into thin line (doesn't make a difference in Warp.dev)
__fish_cursor_xterm line
# set fish_cursor_unknown block # useful?

# https://docs.nativescript.org/setup/macos#setting-up-macos-for-ios
fish_add_path /opt/homebrew/lib/ruby/gems/2.7.0/bin

# useful for node TODO: need?
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

# deno TODO: use? move to ~/
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
# fish_add_path /opt/homebrew/opt/llvm/bin
# https://github.com/ajeetdsouza/zoxide

zoxide init fish | source

# odin TODO: fix below, LSP doesn't work, not sure about what `if test -d` purpose is, test it works on https://github.com/thetarnav/odin-graphql-parser
# set -x ODIN_ROOT "$HOME/clones/odin"
# if test -d $ODIN_ROOT
#     set -x PATH $PATH $ODIN_ROOT
# else
#     echo "ODIN LANG NOT FOUND IN \"$ODIN_ROOT\"!"
# end
# fish_add_path ~/bin

# Created by `pipx` on 2024-05-12 15:06:10
set PATH $PATH /Users/nikiv/.local/bin

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/nikiv/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/nikiv/Downloads/google-cloud-sdk/path.fish.inc'; end

# TODO: too slow with it https://python-poetry.org/docs/
# poetry completions fish > ~/.config/fish/completions/poetry.fish

# Setting PATH for Python 3.12
# The original version is saved in /Users/nikiv/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.12/bin" "$PATH"

# was needed for https://github.com/NixOS/nix/issues/10892
set -Ux NIX_FIRST_BUILD_UID 331

# TODO: replace fully with uv
# conda
# source /opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish
