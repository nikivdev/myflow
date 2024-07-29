fish_add_path /opt/homebrew/bin
fish_add_path ~/.bun/bin/
fish_add_path ~/.cargo/bin

source ~/src/config/fish/alias_and_functions.fish

# direnv (cd into folder, will get the `.env` etc.)
direnv hook fish | source

# activates global flox env. TODO: slows down shell by a bit, not sure why and how to improve
# if set -q SHLVL
#   eval $(flox activate -d $HOME)
# end

fish_add_path ~/.flox/run/aarch64-darwin.default/bin

