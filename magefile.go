//go:build mage
// +build mage

package main

import (
	"log"
	"os"

	"github.com/magefile/mage/sh"
)

// Setup macOS. Install apps, tools, link dotfiles.
func Setup() {
	// installApps()
	// installCLI()
	Link()
}

// Link dotfiles.
func Link() {
	// TODO: check that user has `~/.dotfiles` repo. Quit otherwise.

	home, err := os.UserHomeDir()
	if err != nil {
		log.Fatal(err)
	}

	home = home + "/"
	dots := home + ".dotfiles/"
	links := make(map[string]string) // original file location -> location in dotfiles

	// Zsh
	links[home+".zshrc"] = dots + "zsh/zshrc.zsh"
	// links[home+".zprofile"] = dots + "zsh/zprofile.zsh"

	// Git
	links[home+".gitconfig"] = dots + "git/gitconfig"
	links[home+".gitignore_global"] = dots + "git/gitignore_global"

	// Karabiner
	links[home+".config/karabiner.edn"] = dots + "karabiner/karabiner.edn"

	// Sublime Text
	// TODO: only link files in dots. rest stays as is (cache etc)
	// links[home+"Library/Application Support/Sublime Text 3/Packages/User"] = dots + "sublime"
	// TODO: setup https://www.sublimetext.com/docs/3/osx_command_line.html

	// Neovim
	links[home+".config/nvim/init.vim"] = dots + "nvim/init.vim"

	// VS Code
	links[home+"Library/Application Support/Code - Insiders/User/settings.json"] = dots + "vscode/settings.json"
	links[home+"Library/Application Support/Code - Insiders/User/keybindings.json"] = dots + "vscode/keybindings.json"

	for origLoc, dotLoc := range links {
		os.Remove(origLoc)
		err := os.Symlink(dotLoc, origLoc)
		if err != nil {
			log.Fatal(err)
		}
	}
}

func installApps() {
	// TODO: for apps not part of brew cask, offer to open URLs for download pages of apps
}

func caskInstall() {
	// TODO: check if app is installed
	// apps := []string{"vscode-insiders", "iterm", "mactex"}
	// for _, app := range apps {
	// 	// brew cask install <app>
	// }
}

func masInstall() {
	// TODO: check if app is installed
	// mas install .. (https://github.com/mas-cli/mas)
}

// Install CLI tools.
func InstallCLI() {
	brewInstall() // must be run 1st as it installs deps for rust (rustup)
	// goInstall()
	// rustInstall()
}

// TODO: maybe good to setup Brewfile (for casks at least), hook into mage
// example file: https://github.com/skibitsky/dotfiles/blob/master/macos/Brewfile

func brewInstall() {
	cmds := []string{"neovim", "starship", "exa", "diff-so-fancy", "rustup", "openssl", "fzf",
		"watchman", "kubectl", "awscli", "ripgrep", "vault", "tree", "node", "screenfetch", "sk",
		"ghc", "cabal-install",
		"getantibody/tap/antibody", "denisidoro/tools/navi", "agrinman/tap/wormhole", "Schniz/tap/fnm"}
	// brew tap bvaisvil/zenith & brew install zenith TODO: do brew taps first. then do cmds
	// don't actually use zenith. untap & delete

	for _, app := range cmds {
		// check if cmd is installed
		err := sh.Run("brew", "list", app)
		if err != nil {
			// install it if it doesn't exist
			err = sh.RunV("brew", "install", app)
			continue
		}
		// skip to next cmd
		continue
	}
}

func goInstall() {
	// TODO: install with go
	// cmds := []string{"R4yGM/netscanner"}
	// err := sh.RunV("go", "get")
	// if err != nil {
	// 	log.Fatal(err)
	// }
}

// TODO: replace with nix ideally because compiling rust from source is pain..
// TODO: should just get precompiled binaries
func rustInstall() {
	cmds := []string{"git-trim", "zoxide", "loc", "kickstart"}
	for _, app := range cmds {
		err := sh.RunV("brew", "install", app)
		if err != nil {
			log.Fatal(err)
		}
		// skip to next cmd
		continue
	}
	// TODO: check if rust is installed (cargo is in path)
	// TODO: if not, run rustup-init (https://formulae.brew.sh/formula/rustup-init)
}

func yarnInstall() {
	// cmds := []string{"prettier"}
	// TODO: yarn global add ..
}

func cabalInstall() {
	// cmds := []string{"brok"}
	// TODO: cabal install ..
}

func vscodeExtensionInstall() {
	// extensions := []string{"go", "vscodevim"}
	// code --list-extensions = all exts
	// maybe can sync folder or config
	// TODO: code-ext install .. (or alt cmd)
}

func ZshSetup() {
	home, err := os.UserHomeDir()
	if err != nil {
		log.Fatal(err)
	}
	// hide annoying `Last login ` msg on shell startup
	os.Create(home + "/.hushlogin")
}

func zshPluginsInstall() {

}

func VimSetup() {
	// check that ~/.config/nvim exist
	// TODO: cd to ~/.config/nvim & run
	// https://github.com/junegunn/vim-plug#neovim
	// curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

func Defaults() {
	// TODO: move running of default set cmds from macos/set-defaults.sh
	// TODO: check that its running in macos
	// TODO: run cmds
}

// Install provided commands with a package manager.
func installCMDS(cmds []string, packageManager string) {
	// TODO: have a way to run cmd in go by giving it a full string
	// so can then do sh.Run(packageManager + cmd)

	// for _, app := range cmds {
	// 	// check if cmd is installed
	// 	err := sh.Run("brew", "list", app)
	// 	if err != nil {
	// 		// install it if it doesn't exist
	// 		err = sh.RunV("brew", "install", app)
	// 		continue
	// 	}
	// 	// skip to next cmd
	// 	continue
	// }
}

// Update brew/go/rust.
func CLIUpdate() {
	// TODO: brew update
	// cargo update? go get update?
}

// TODO: add cmd with https://github.com/r-darwish/topgrade?
// TODO: combile mage into binary to use globally
// TODO: cleanup dead symlinks as part of Link
// - clean: ["~", "~/.config"] had this in dotbot
