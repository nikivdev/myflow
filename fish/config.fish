source ~/src/config/fish/alias-and-functions.fish
source ~/src/config/fish/private.fish

source ~/.local/state/nix/profiles/profile/etc/profile.d/nix.fish # use latest version of nix
set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt # needed for flox/nix (some ssl bug or something) TODO: still needed?
# TODO: how to use latest version of nix daemon too with flox?

direnv hook fish | source # direnv (cd into folder, will get the `.env` etc.)
set -x DIRENV_LOG_FORMAT "" # hide direnv unloading messages

fish_add_path $HOME/.flox/run/aarch64-darwin.default.dev/bin
fish_add_path ~/go/bin
fish_add_path /opt/homebrew/bin
fish_add_path "$HOME/Library/Application Support/edgedb/bin"
fish_add_path "$HOME/.bun/bin"
fish_add_path "$HOME/.cargo/bin"

set -gx PATH /Users/nikiv/.local/share/solana/install/active_release/bin $PATH # solana https://solana.com/docs/intro/installation
