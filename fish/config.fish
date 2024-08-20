# alias _date="/Users/nikiv/.flox/run/aarch64-darwin.default/bin/date" # for debugging how long things take (wrap around lines to measure and see time diffs)
fish_add_path ~/.flox/run/aarch64-darwin.default/bin
fish_add_path /opt/homebrew/bin # TODO: remove in favor of flox
fish_add_path ~/.bun/bin
fish_add_path ~/.cargo/bin

source ~/src/config/fish/alias-and-functions.fish
source ~/src/config/fish/private.fish

source ~/.local/state/nix/profiles/profile/etc/profile.d/nix.fish # use latest version of nix
set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt # needed for flox/nix (some ssl bug or something)
# TODO: how to use latest version of nix daemon too with flox?

direnv hook fish | source # direnv (cd into folder, will get the `.env` etc.)
set -x DIRENV_LOG_FORMAT "" # hide direnv unloading messages

# activates global flox env
# TODO: disabled now as it slows down shell massively (mostly due to network call) (what flox is doing: https://gist.github.com/nikitavoloboev/4435ba3afa291bda38f9373aa1a3adef)
# if set -q SHLVL
#   # _date +%T.%N >> ~/log/config.fish
#   # eval $(flox activate -d $HOME -vvvvv)
#   eval $(flox activate -d $HOME)
#   # _date +%T.%N >> ~/log/config.fish
#   # echo ">>>>>>>>>>" >> ~/log/config.fish
# end
