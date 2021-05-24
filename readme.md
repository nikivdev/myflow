# My wonderful world of macOS [![Thanks](https://bit.ly/saythankss)](https://github.com/sponsors/nikitavoloboev)

> List of applications and tools that make my macOS experience even more amazing

![](https://raw.githubusercontent.com/nikitavoloboev/my-mac-os/master/light.png)

> Light appearance. Prefer to use light themes as it makes text more readable during the day with natural light around.

![](https://raw.githubusercontent.com/nikitavoloboev/my-mac-os/master/night.png)

> Dark appearance. All apps are in one desktop since there is delay in switching between macOS multiple desktops. Dock is hidden. Desktop background is dynamic.

- [Applications](#applications)
  - [Productivity](#productivity)
  - [Code](#code)
  - [Social](#social)
  - [Design](#design)
  - [Music](#music)
  - [Video](#video)
  - [Browsers](#browsers)
    - [Safari Extensions](#safari-extensions)
- [Command Line Apps](#command-line-apps)
- [My wonderful world of iOS](#my-wonderful-world-of-ios-)
- [Similar Setups](#similar-setups)
- [Related](#related)
- [Contributing](#contributing)

## Applications

I use a [lot of apps](https://code.nikitavoloboev.xyz/config#macos-apps-i-have-installed) on my mac. Below is a list of my favorite tools with descriptions of how I use them.

I also share [my dotfiles](https://github.com/nikitavoloboev/dotfiles) together with my [iOS setup](https://github.com/nikitavoloboev/my-ios). And I made a [Telegram group](https://t.me/joinchat/BBKnQU4_rty6_942PFbPbw) to discuss all things macOS/iOS.

I have [extensive wiki](https://wiki.nikitavoloboev.xyz) where I share [everything I know](https://wiki.nikitavoloboev.xyz/sharing/everything-I-know). Apps that I described in the wiki are linked to from here.

### Changing themes

I made [KM macro](https://wiki.nikitavoloboev.xyz/macos/macos-apps/keyboard-maestro/km-macros) with [this AppleScript](https://www.macobserver.com/tips/quick-tip/change-light-dark-mode-applescript-app/) to switch [between light/dark macOS appearances](https://twitter.com/nikitavoloboev/status/1311336647338983432). As appearances are switched, the themes get updated accordingly on most apps.

### Productivity

#### [Alfred](https://www.alfredapp.com) - Launcher

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/alfred).

#### [Karabiner](https://pqrs.org/osx/karabiner/) - Keyboard remapping

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/karabiner).

#### [Keyboard Maestro](https://www.keyboardmaestro.com/main/) - Automation tool

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/keyboard-maestro).

#### [2Do](https://www.2doapp.com/mac) - Flexible task manager

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/2do).

#### [1Password](https://1password.com) - Password manager

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/1password).

#### [BetterTouchTool](https://folivora.ai) - Mac input customizer

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/bettertouchtool).

#### [Fantastical](https://flexibits.com/fantastical) - Calendar

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/fantastical).

#### [Dictionary](<http://en.wikipedia.org/wiki/Dictionary_(software)>)

- Comes natively with macOS and I started to love using it for exploring and searching through Wikipedia.
- It is incredibly fast to make the searches and it gives quick autosuggestions for any query I type that I can then select with up and down arrows.

![](https://i.imgur.com/wFkJXwd.png)

#### [CleanShot](https://getcleanshot.com) - Create & annotate screenshots/recordings

- After you make a screenshot, it allows for quick edits (arrows, text, blurring).

#### [Popclip](https://pilotmoon.com/popclip/) - iOS like mouse text selection popover

- Brings up a quick menu whenever some text is selected on which I can do a number of quick actions, like searching selected text on Google, YouTube or copy the text. Here are the extensions I have activated:

![](https://i.imgur.com/PS3HFvS.png)

- And here is how it looks for me:

<img src="https://i.imgur.com/dxt2qjK.png" width="400" alt="img">

- Everything I use comes by default with PopClip except YouTube extension which you can download [here](https://www.dropbox.com/sh/gckplsy5d4mg4rq/AABgvWT9QKg0NlwC9Bz8X9B0a?dl=0). I used [PopMaker](http://brettterpstra.com/2014/05/12/popmaker-popclip-extension-generator/) tool to create this web search extension.

#### [Reeder](http://reederapp.com/mac/) - RSS Reeder

- The app I use to keep up with my RSS feeds. I use RSS to follow my favorite blogs, stay up to date on new podcast episodes and even track some software releases.
- I use [Inoreader](https://www.inoreader.com) to sync [blogs I follow](https://wiki.nikitavoloboev.xyz/research/blogs) between phone and mac.
- Here is how Reeder looks like for me:

![](https://i.imgur.com/l0Cq6ZT.jpg)

#### [Transmission](https://www.transmissionbt.com/) - BitTorrent client

- A torrent client that I use. Very minimal in its UI but very powerful and has all the features that I need.

#### [Notion](https://www.notion.so/) - All-in-one workspace

- Described in [wiki](https://wiki.nikitavoloboev.xyz/tools/notion).

#### [Linear](https://linear.app/) - Issue tracker

- Nice private project tracker. I like to use GitHub issues primarily for projects.

### Code

#### [VS Code](https://github.com/Microsoft/vscode) - Code editor

- Described in [wiki](https://wiki.nikitavoloboev.xyz/text-editors/vs-code).

#### [iTerm](https://www.iterm2.com/) - Terminal Emulator

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/iterm).

#### [Sublime Text](https://www.sublimetext.com) - Text Editor

- Described in [wiki](https://wiki.nikitavoloboev.xyz/text-editors/sublime-text).

#### [Sublime Merge](https://www.sublimemerge.com) - Git Client

- Use it to version control projects I work on. Use it together with [gitupdate](https://github.com/nikitavoloboev/gitupdate) to frictionlessly manage updates.

#### [Dash](https://kapeli.com/dash) - API Documentation Browser

- Allows you to download any docset that you might want to use, search for any method, class or anything that you need very quickly, comes with the amazing [Alfred workflow](https://www.alfredapp.com/blog/productivity/dash-quicker-api-documentation-search/) to simplify the process of searching for the right things.

<img src="https://i.imgur.com/P5LQaLz.png" width="500" alt="img">

#### [Paw](https://paw.cloud) - HTTP client

- Use it to quickly make HTTP requests and test out API endpoints.

#### [Neovim](https://neovim.io) - Text Editor

- Described in [wiki](https://wiki.nikitavoloboev.xyz/text-editors/vim).

### Social

#### [Telegram](https://desktop.telegram.org/) - Messenger

- Described in [wiki](https://wiki.nikitavoloboev.xyz/tools/telegram).

#### [Spark](https://sparkmailapp.com) - Email client

- Love how it smartly categorizes emails by categories. I approach all of my email tasks in GTD style. Keeping my email Inbox close to 0 at all times.

#### [Tweetbot](http://tapbots.com/tweetbot/mac/) - Twitter client

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/tweetbot).

#### [Textual](https://www.codeux.com/textual/) - IRC Client

- Described in [wiki](https://wiki.nikitavoloboev.xyz/macos/macos-apps/textual).

### Design

#### [Figma](https://www.figma.com) - Design tool

- Described in [wiki](https://wiki.nikitavoloboev.xyz/design/figma).

#### [Sip](https://sipapp.io/) - Collect, organize & share colors

- Great color picker I use to collect my favorite colors and color schemes.

<img src="https://i.imgur.com/RbtDn7n.png" width="400" alt="img">

#### [PixelSnap](https://getpixelsnap.com/) - Measure everything on screen

- Use it to quickly get measurements of objects and distances between elements.

### Music

#### [Spotify](https://www.spotify.com/us/) - Music streaming

- Found a [lot of great music](https://open.spotify.com/user/nikitavoloboev) with this app and the phenomenal [Alfred Workflow](http://alfred-spotify-mini-player.com/) makes using the application an absolute joy.
- Quickly finding artists, songs I want to listen, instantly adding the song playing to my [Likes](https://open.spotify.com/user/nikitavoloboev/playlist/0ERn0U4qZIKC8Dy7RrMMsn?) playlist or any other playlist I want, seeing what other songs the artist has and more.

<img src="https://i.imgur.com/WqobmyT.png" width="500" alt="img">

### Video

#### [IINA](https://github.com/lhc70000/iina) - Video player

- Open source alternative to VLC built specifically for macOS.
- It is based on [mpv](https://github.com/mpv-player/mpv) and has a more modern and native look than VLC.

### Browsers

#### [Safari](https://www.apple.com/lae/safari/)

- Described in [wiki](https://wiki.nikitavoloboev.xyz/web/browsers/safari).

##### Safari Extensions

- [Vimari](https://github.com/televator-apps/vimari) - Adds custom layer of keybinds you can customize to personalize the browsing experience like hinting and moving between tabs.
- [Wipr](https://itunes.apple.com/nl/app/wipr/id1320666476?l=en&mt=12) - Ad content blocker that uses [Safari native content blocking API's](https://developer.apple.com/library/content/documentation/Extensions/Conceptual/ContentBlockingRules/Introduction/Introduction.html).
- [1Password](https://agilebits.com/onepassword/extensions) - [1Password](https://1password.com) is a phenomenal password manager, this extension just gives a seamless interaction of it with the browser.

#### [Google Chrome Canary](https://www.google.com/chrome/canary/)

- Described in [wiki](https://wiki.nikitavoloboev.xyz/web/browsers/google-chrome).

## Command Line Apps

I use [brew](https://brew.sh) package manager to install all the [tools I use on my system](https://github.com/nikitavoloboev/dotfiles/blob/master/magefile.go).

I curate a list of [interesting CLI tools](https://github.com/learn-anything/command-line-tools). Below are ones I love & use:

- [exa](https://github.com/ogham/exa) - Replacement for ls written in rust.
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Search text for patterns fast.
- [fzf](https://github.com/junegunn/fzf) - Command-line fuzzy finder.
- [fd](https://github.com/sharkdp/fd) - Simple, fast and user-friendly alternative to 'find'.
- [watchexec](https://github.com/watchexec/watchexec) - Executes commands in response to file modifications.
- [bat](https://github.com/sharkdp/bat) - Cat clone with wings.
- [up](https://github.com/apex/up) - Deploy infinitely scalable serverless apps, APIs, and sites in seconds to AWS.
- [jq](https://github.com/stedolan/jq) - JSON processor.
- [git](https://github.com/git/git) - Version control.
- [curl](https://curl.haxx.se/docs/manpage.html) - Transfer data from or to a server.
- [youtube-dl](https://github.com/rg3/youtube-dl) - Download videos from YouTube and other video sites.
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer.
- [direnv](https://direnv.net/) - Environment switcher for the shell.
- [htop](https://github.com/hishamhm/htop) - Interactive text-mode process viewer for Unix systems.
- [httpie](https://github.com/jakubroztocil/httpie) - HTTP client.
- [rq](https://github.com/dflemstr/rq) - Tool for doing record analysis and transformation.
- [pandoc](https://github.com/jgm/pandoc) - Universal markup converter.
- [trash](https://github.com/sindresorhus/trash) - Move files and folders to the trash.
- [vtop](https://github.com/MrRio/vtop) - Graphical activity monitor.
- [gotop](https://github.com/cjbassi/gotop) - Terminal based graphical activity monitor inspired by gtop and vtop.
- [howdoi](https://github.com/gleitz/howdoi) - Instant coding answers.
- [asciinema](https://github.com/asciinema/asciinema) - Terminal session recorder.
- [tldr](https://github.com/tldr-pages/tldr) - Simplified and community-driven man pages.
- [imgcat](https://github.com/eddieantonio/imgcat) - Like [cat](http://www.linfo.org/cat.html) but for images.
- [screenfetch](https://github.com/KittyKatt/screenFetch) - Fetches system/theme information in terminal.
- [hugo](https://github.com/gohugoio/hugo) - Fast and flexible static site generator.
- [reflex](https://github.com/cespare/reflex) - Run a command when files change.
- [modd](https://github.com/cortesi/modd) - Flexible tool for responding to file system changes.
- [now](https://github.com/zeit/now-cli) - Real time global deployments served over HTTP/2.
- [yarn](https://github.com/yarnpkg/yarn) - Fast, reliable, and secure dependency management.
- [hub](https://github.com/github/hub) - GitHub wrapper.
- [xsv](https://github.com/BurntSushi/xsv) - Fast CSV command line toolkit written in Rust.
- [pv](https://ivarch.com/programs/pv.shtml) - Pipe Viewer.
- [m-cli](https://github.com/rgcr/m-cli) - Useful utils for macOS.
- [pgcli](https://github.com/dbcli/pgcli) - Postgres CLI with autocompletion and syntax highlighting.
- [mas](https://github.com/mas-cli/mas) - CLI for mac app store.
- [loc](https://github.com/cgag/loc) - Count lines of code quickly.
- [alfred](https://godoc.org/github.com/jason0x43/go-alfred/alfred) - Manage Go-based Alfred workflows.
- [neofetch](https://github.com/dylanaraps/neofetch) - System information tool.
- [license-up](https://github.com/nikitavoloboev/license-up) - Create a license quickly for your project.
- [piknik](https://github.com/jedisct1/piknik) - Copy/paste anything over the network.
- [bench](https://github.com/Gabriel439/bench) - Command-line benchmark tool.
- [ghq](https://github.com/motemen/ghq) - Manage remote repository clones.
- [npx](https://github.com/zkat/npx) - Execute npm package binaries.
- [devd](https://github.com/cortesi/devd) - Local webserver for developers.
- [wifi-password](https://github.com/rauchg/wifi-password) - Get the password of the WiFi you're on.
- [fkill](https://github.com/sindresorhus/fkill-cli) - Fabulously kill processes.
- [ran](https://github.com/m3ng9i/ran) - Simple static web server written in Go.
- [mcfly](https://github.com/cantino/mcfly) - Fast visual command history search.
- [hyperfine](https://github.com/sharkdp/hyperfine) - Excellent command-line benchmarking tool.

## Launchpad

![](https://i.imgur.com/Xm0EpfG.jpg)

## [My wonderful world of iOS 📱](https://github.com/nikitavoloboev/my-ios)

If you found this interesting, I also have [similar repository](https://github.com/nikitavoloboev/my-ios) going over what applications I use on iOS/WatchOS as well as how and why I use them.

<a align="center" href="https://github.com/nikitavoloboev/my-ios">
    <img width="250" heigth="400" src="https://i.imgur.com/Kkv5ral.png"></a>

<a align="center" href="https://github.com/nikitavoloboev/my-ios">
    <img width="250" heigth="400" src="https://i.imgur.com/IzVAy2F.png"></a>

<a align="center" href="https://github.com/nikitavoloboev/my-ios">
    <img width="250" heigth="400" src="https://i.imgur.com/LiILeEK.jpg"></a>

## Similar Setups

Here you can find more setups by other people that you can take ideas and inspiration from.

- [Works for me](https://works-for-me.github.io/) - Collection of developer toolkits.
- [Use This Interviews](https://usesthis.com) - What do people use to get stuff done?
- [Omar Bahareth's my-mac-os](https://github.com/obahareth/my-mac-os) - Another my-mac-os.

## Related

- [Awesome mac](https://github.com/jaywcjlove/awesome-mac)
- [Interesting macOS apps](https://github.com/learn-anything/macos-apps)
- [Open Source macOS apps](https://github.com/serhii-londar/open-source-mac-os-apps)

## Contributing

If you shared a similar personal setup to this, be it for Windows, Linux or anything else, you can add it in [Similar Setups](#similar-setups) section.

I love finding new awesome tools and apps. If you have a favorite tool or app that you think I missed, please [say it](../../issues/new).

## Thank you

You can support me on [GitHub](https://github.com/sponsors/nikitavoloboev) or look into [other projects](https://nikitavoloboev.xyz/projects) I shared.

[![CC4](https://img.shields.io/badge/license-CC4-0a0a0a.svg?style=flat&colorA=0a0a0a)](https://creativecommons.org/licenses/by/4.0/) [![Twitter](http://bit.ly/nikitatweet)](https://twitter.com/nikitavoloboev)
