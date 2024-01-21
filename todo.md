- add zed config & keymap (symlink)
- use [chezmoi](https://www.chezmoi.io/)
- replace magefile.go with chezmoi + ts instead
- remove install script too. ts instead
- use nix
  - `bin` folder and `bin/private` folder is messy, should be done with nix
- upload images that are in [images] to cloudflare and use links `images.nikiv.dev/link..` to not fill git history with images

## Old (probably not needed any more)

- Create a ./install command that can be run from anywhere the dotfiles dir is on macOS
  - So you can even install dotfiles to ~/Desktop and then run ./install and it will magically work too and set the system up as I specified. Perhaps it would move the dotfiles to ~/.dotfiles on its own. Not sure what the correct Nix way to do this is.
- Use Nix (home-manager/nix-darwin) instead Dotbot
  - home manager: https://github.com/rycee/home-manager
  - nix-darwin: https://github.com/LnL7/nix-darwin
  - nix dots:
  - https://github.com/LnL7/dotfiles
  - Add installing of Xcode tools. Check if they are installed already.
  - `xcode-select --install`
- Write a script to auto update Typinator sets / Import BTT settings
  - Specify in the script which sets from ~/Dropbox/Config/Typinator to move into this dir. BTT may also have ability to automatically export a profile
- Create proper ./install or nix apply script
  - It should automatically install Nix on the system if it isn’t installed and then run the other necessary commands to get my system to the state I want it to be in.
- Nix specify all the commands I use on my system. Nix/Rust/Go/NPM/..
  - Should all be specified neatly in nix.
  - Go: ~/go/bin
  - Rust: ~/.cargo/bin
  - NPM: ~/.npm-global/bin . NOTE: have to run npm set prefix ~/.npm-global first to set this location.
- Symlink all the necessary configs
  - in dotbot it currently looks like this:

```
# Zsh
~/.zshrc: zsh/zshrc.zsh
# Git
~/.gitconfig: git/gitconfig
~/.gitignore_global: git/gitignore_global
# Hammerspoon
~/.hammerspoon: hammerspoon
# Sublime Text
"~/Library/Application Support/Sublime Text 3/Packages/User": sublime
# Neovim
~/.config/nvim: nvim
# VS Code
~/Library/Application Support/Code/User/settings.json: vscode/settings.json
~/Library/Application Support/Code/User/keybindings.json: vscode/keybindings.json
```

- Setup and install secret configuration (Keybase)

  - Things like:
  - ~/.ssh -> SSH config + certs
  - ~/.wakatime.cfg -> WakaTime settings (API Key)
  - Perhaps I missed something else. Not sure what the best way to do that would be.
  - Keybase can be used for it I believe.

- Grab preferences for some apps too on install

  - `~/Library/Application Support` -> holds app auxiliary files
  - `~/Library/Preferences` -> holds app preferences
  - `~/Library/Fonts` -> Custom fonts
  - `~/Pictures/Photos Library` -> Apple Photos (which should be iCloud synced so it shouldn’t matter)
  - The other parts too should be iCloud synced ideally.
  - Other things like Popclip and few other apps can be stored on Dropbox.
  - Migration assistant helps transfer files from one mac to another mac easily too. But ideally it should be avoided.

- Clean vimrc. use lua for nvim

  - Remove everything i don’t use. Perhaps I only need to have init.vim in the repo. No ftplugin and autoload. Check!

- Move functions & maybe aliases under go binary to speed up shell startup
- use https://github.com/twpayne/chezmoi
