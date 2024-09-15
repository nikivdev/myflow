source ~/src/config/fish/alias-and-functions.fish
source ~/src/config/fish/private.fish

source ~/.local/state/nix/profiles/profile/etc/profile.d/nix.fish # use latest version of nix
set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt # needed for flox/nix (some ssl bug or something) TODO: still needed?
# TODO: how to use latest version of nix daemon too with flox?

direnv hook fish | source # direnv (cd into folder, will get the `.env` etc.)
set -x DIRENV_LOG_FORMAT "" # hide direnv unloading messages

# TODO: for some reason, not all things in ~/.profile are being added to PATH (i.e. `brew doctor` was failing without below line)
fish_add_path /opt/homebrew/sbin
fish_add_path ~/go/bin
