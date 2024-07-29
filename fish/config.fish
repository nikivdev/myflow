fish_add_path /opt/homebrew/bin
fish_add_path ~/.bun/bin/
fish_add_path ~/.cargo/bin

source ~/src/config/fish/alias_and_functions.fish

# direnv (cd into folder, will get the `.env` etc.)
direnv hook fish | source

# activates global flox env
# if set -q SHLVL
#   eval $(flox activate -d $HOME)
# end
