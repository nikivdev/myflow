# alias _date="/Users/nikiv/.flox/run/aarch64-darwin.default/bin/date" # for debugging how long things take

fish_add_path ~/.flox/run/aarch64-darwin.default/bin
fish_add_path /opt/homebrew/bin # TODO: remove in favor of flox
fish_add_path ~/.bun/bin
fish_add_path ~/.cargo/bin

source ~/src/config/fish/alias-and-functions.fish
source ~/src/config/fish/private.fish

# use latest version of nix
source /Users/nikiv/.local/state/nix/profiles/profile-1-link/etc/profile.d/nix.fish
# TODO: how to use latest version of nix daemon too with flox?

# direnv (cd into folder, will get the `.env` etc.)
direnv hook fish | source
set -x DIRENV_LOG_FORMAT "" # hide direnv unloading messages

# activates global flox env TODO: disabled as it slows down shell by quite a bit. most likely due to network call
# if set -q SHLVL
#   _date +%T.%N >> ~/Downloads/fishlog
#   eval $(flox activate -d $HOME -vvvvv)
#   eval $(flox activate -d $HOME)
#   _date +%T.%N >> ~/Downloads/fishlog
#   echo ">>>>>>>>>>" >> ~/Downloads/fishlog
# end
