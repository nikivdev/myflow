# My wonderful world of macOS [![Thanks](https://bit.ly/saythankss)](https://github.com/sponsors/nikitavoloboev)

> List of applications and tools that make my macOS experience even more amazing

![](https://raw.githubusercontent.com/nikitavoloboev/my-mac-os/master/desktop.png)

> All apps are in one desktop since there is delay in switching between macOS multiple desktops. Dock is hidden.

#### Contents

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
- [Preference Panes](#preference-panes)
- [My wonderful world of iOS](#my-wonderful-world-of-ios-)
- [Similar Setups](#similar-setups)
- [Related](#related)
- [Contributing](#contributing)

## Applications

I use a lot of apps on my mac. Below is a list of my favorite tools with descriptions of how I use them.

I also share [my dotfiles](https://github.com/nikitavoloboev/dotfiles) together with my [iOS setup](https://github.com/nikitavoloboev/my-ios). And I made a [Telegram group](https://t.me/joinchat/BBKnQU4_rty6_942PFbPbw) to discuss all things macOS/iOS.

### Productivity

#### [Alfred](https://www.alfredapp.com) - Launcher

- Alfred is a powerful launcher that you can program to show anything you want. It save me a lot of time as I use it to search through anything instantly.

<img src="https://i.imgur.com/pr19IYn.jpg" width="700" alt="img">

- It has a great [community](https://www.alfredforum.com/) and [amazing workflows](https://github.com/learn-anything/alfred-workflows#readme) that you can use.

- I wrote [an article](https://medium.com/@nikitavoloboev/writing-alfred-workflows-in-go-2a44f62dc432) on how anyone can start developing workflows of their own using Go language and [AwGo](https://github.com/deanishe/awgo) library.

#### [Karabiner](https://pqrs.org/osx/karabiner/) - Keyboard remapping

- Karabiner is life changing tool that [lets you remap keys at a low level on macOS](https://medium.com/@nikitavoloboev/karabiner-god-mode-7407a5ddc8f6).
- I completely remapped my keyboard with it and every key on my keyboard is a custom modifier key that I can program to do what I want.
- For example you can make caps lock into an escape key when pressed once but if you hold it, it becomes a hyper key. Hyper key means that a key now serves two purposes, once when pressed alone and once when held down. So for example, for remapping caps lock, we can remap it to act as escape when pressed alone once but if we hold down on it, it becomes `⌘ + ⌃` modifier key. So `Caps Lock + F` becomes `⌘ + ⌃ + F`. And so on.
- I take this idea further and define these kind of hyper keys for **every single key on my keyboard**.
- I describe how I use Karabiner in detail [here](https://wiki.nikitavoloboev.xyz/macos/macos-apps/karabiner) and I generate [my configuration](https://github.com/nikitavoloboev/dotfiles/blob/master/karabiner/karabiner.edn) with a [Karabiner DSL](https://github.com/yqrashawn/GokuRakuJoudo#readme).

#### [Keyboard Maestro](https://www.keyboardmaestro.com/main/) - Automation tool

- Keyboard Maestro is essentially an IDE for automation. You create macros of actions that you can then easily call from Karabiner.
- It has a [wonderful community](https://forum.keyboardmaestro.com/) that is happy to help with whatever you are trying to achieve.
- I share [all the macros I use](https://wiki.nikitavoloboev.xyz/macOS/apps/keyboard-maestro/km-macros) with the app.

#### [2Do](https://www.2doapp.com/mac) - Flexible task manager

- I love GTD methodology. This app is phenomenal with helping me [organize my tasks](https://wiki.nikitavoloboev.xyz/macOS/apps/2do). Here is how my sidebar looks:

<img src="https://i.imgur.com/Hsdov6C.png" width="150">

- It also has global quick add with a hotkey. Together with lists, priorities, powerful search and a lot more.

<img src="https://i.imgur.com/QuBsexM.png" width="400" alt="img">

#### [Trello](https://trello.com) - Project management tool

- I use the app a lot to track various projects I have in my life.
- I share many boards I made [publicly](https://wiki.nikitavoloboev.xyz/sharing/my-trello). Here is an example of a public board for tracking various [things I want to learn](https://trello.com/b/cu32qF3q).

![](https://i.imgur.com/U0KSBJT.png)

- I assign myself to the cards I am working on now and filter to see only them by [pressing Q key](https://trello.com/shortcuts). I mark cards I want to work on next with `Next` tag.

#### [1Password](https://1password.com) - Password manager

- Generate all of my passwords with it and keep everything in a secured and encrypted vault kept secure by my one master password.
- No longer need to remember passwords and I now have a unique password for every website that I am signed up on whilst [activating two factor authentication](https://support.1password.com/one-time-passwords/) wherever possible.

#### [Typinator](http://www.ergonis.com/products/typinator/) - Text expansions

- I use the app to [fully automate writing repetitive text](https://medium.com/@nikitavoloboev/write-once-never-write-again-c2fa1f6c4e8).
- I share all the Typinator sets I made with the app [here](typinator).

#### [BetterTouchTool](https://www.boastr.net/) - Mac input customizer

- I use this app a lot for mapping [various trackpad gestures](https://medium.com/@nikitavoloboev/take-control-of-your-touchpad-on-macos-45c581f542e0#.7n1ye6vze) to hotkeys and actions both globally and per specific apps.
- I love scrolling through my tabs in Safari with three finger swipes left and right as well as opening and closing tabs with swiping up and down respectively.
- I share [all the different gestures I have setup to use with the app](btt#readme) that you can view and download.
- I also use the app to modify how my TouchBar looks.

![](https://i.imgur.com/Ubna3yL.png)

#### [PDF Expert](https://pdfexpert.com/) - PDF reader/editor

- I read a lot of PDFs like books, research papers and the like. This app is a huge upgrade over Preview app that I used before.
- Multiple tabs, sepia mode, very nice annotation tools, great search, performance.

#### [Fantastical](https://flexibits.com/fantastical) - Calendar

- I use the app to manage events in my life.
- I take great use of Fantastical's natural language input and I use [many Typinator expansions](https://medium.com/@nikitavoloboev/fantastical-natural-input-text-expansions-3ea8cf7ccac3#.pv5937ncr) to ease this process.
- I always view my events from `Week` view. And show 5 days with 16h shown for all days. This lets me have a perspective over what I have to do now. What deadlines I have to complete soon. And gives me the freedom to adjust my schedule in light of upcoming deadlines and events.

#### [Contexts](https://contexts.co) - Window switcher

- Allows me to fuzzy search through all the currently active windows that I have.

![](https://i.imgur.com/VdNRlGM.png)

- Makes jumping to the right window I need effortless. I often may have many VS Code instances with different projects running and this lets me switch to the project I need in seconds.

#### [Dictionary](<http://en.wikipedia.org/wiki/Dictionary_(software)>)

- Comes natively with macOS and I started to love using it for exploring and searching through Wikipedia.
- It is incredibly fast to make the searches and it gives quick autosuggestions for any query I type that I can then select with up and down arrows.

![](https://i.imgur.com/Nj4erv5.png)

#### [CleanShot](https://getcleanshot.com) - Create & annotate screenshots/recordings

- After you make a screenshot, it allows for quick edits (arrows, text, blurring).

#### [Popclip](https://pilotmoon.com/popclip/) - iOS like mouse text selection popover

- Brings up a quick menu whenever some text is selected on which I can do a number of quick actions, like searching selected text on Google, YouTube or copy the text. Here is how it looks for me:

<img src="https://i.imgur.com/dxt2qjK.png" width="400" alt="img">

- I share all the extensions I use with it [here](popclip#readme.md).

#### [Noizio](http://noiz.io/) - Ambient sounds

- I use it to play sounds of rain when focusing.

#### [Reeder](http://reederapp.com/mac/) - RSS Reeder

- The app I use to keep up with my RSS feeds. I use RSS to follow my favorite blogs, stay up to date on new podcast episodes and even track some software releases.
- I use [Inoreader](https://www.inoreader.com) to sync [blogs I follow](https://wiki.nikitavoloboev.xyz/research/blogs) between phone and mac.
- Here is how Reeder looks like for me:

![](https://i.imgur.com/2Ruad9G.png)

#### [Transmission](https://www.transmissionbt.com/) - BitTorrent client

- A torrent client that I use. Very minimal in its UI but very powerful and has all the features that I need.

### Code

#### [VS Code](https://github.com/Microsoft/vscode) - Code editor

- My favorite editor that I use to write code in. I use [many extensions](https://wiki.nikitavoloboev.xyz/text-editors/vs-code/vs-code-extensions) for it.
- My config for it can be found [here](https://github.com/nikitavoloboev/dotfiles/blob/master/vscode/settings.json).
- I use [GitHub theme]slhttps://marketplace.visualstudio.com/items?itemName=GitHub.github-vscode-theme() theme with [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font. Here is how it looks:

![](https://i.imgur.com/sxhWBjq.png)

#### [iTerm](https://www.iterm2.com/) - Terminal Emulator

- Use Zsh as my shell together with [Antibody](https://github.com/getantibody/antibody) to install [Zsh plugins I use](https://wiki.nikitavoloboev.xyz/unix/shell/zsh/zsh-plugins).
- Assigned w + j with [Karabiner](https://wiki.nikitavoloboev.xyz/macos/macos-apps/karabiner) to open the app from Keyboard Maestro in seconds.
- I made my own [GitHub theme](https://github.com/fcaldera/github-primer-iterm2) for it.

<img src="https://i.imgur.com/pmmSRVN.png" width="500" alt="img">

#### [Sublime Text](https://www.sublimetext.com) - Text Editor

- Use this editor in addition to VS Code and Neovim for its blazing fast speed of opening files.
- I use it primarily to edit markdown files like [my wiki](https://wiki.nikitavoloboev.xyz/other/wiki-workflow). I also edit config files and open large and small files for quick edits.
- I use [many plugins](https://wiki.nikitavoloboev.xyz/text-editors/sublime-text/sublime-text-plugins) together with [Ayu theme](https://github.com/dempfi/ayu).

#### [Dash](https://kapeli.com/dash) - API Documentation Browser

- Allows you to download any docset that you might want to use, search for any method, class or anything that you need very quickly, comes with the amazing [Alfred workflow](https://www.alfredapp.com/blog/productivity/dash-quicker-api-documentation-search/) to simplify the process of searching for the right things.

<img src="https://i.imgur.com/Km4wFRr.png" width="500" alt="img">

#### [Tower](https://www.git-tower.com) - Git client

- Use the app to help me version control any project I am working on. Love the ability to search through commits, check out branches with ease and searching through all the Git repositories I have on my mac with quick search.

![](https://i.imgur.com/fwCDoKR.png)

#### [Paw](https://paw.cloud) - HTTP client

- Use it to quickly make HTTP requests and test out API endpoints.

#### [Neovim](https://neovim.io) - Text Editor

- The best text editing experience you will ever get. It is worth learning it as you will start thinking about text editing differently.
- I use some kind of vim bindings in any app I use and if there is a vim plugin for the app, I often use it. I use [vim editor](https://wiki.nikitavoloboev.xyz/text-editors/vim/vim) often when connecting to remote sessions and when I need a console editor.
- My [Neovim](https://github.com/neovim/neovim) config can be seen [here](https://github.com/nikitavoloboev/dotfiles/blob/master/nvim/init.vim). I use [GitHub theme](https://github.com/AlexanderEkdahl/github-sublime-theme) with [many plugins](https://wiki.nikitavoloboev.xyz/text-editors/vim/vim-plugins). Here is how it looks:

![](https://i.imgur.com/RNEKTMP.png)

### Social

#### [Telegram](https://desktop.telegram.org/) - Messenger

- My favorite messenger.

#### [Spark](https://sparkmailapp.com) - Email client

- Love how it smartly categorizes emails by categories.
- I approach all of my email tasks in GTD style. Keeping my email Inbox close to 0 at all times.

#### [Tweetbot](http://tapbots.com/tweetbot/mac/) - Twitter client

- Use it to stay up to date and communicate on Twitter. I have Tweetbot open in full screen with two columns (Mentions or [Other](https://twitter.com/i/lists/1131319788012285952) & [Timeline](https://twitter.com/nikitavoloboev/following)). Here is how that looks for me:

![](https://i.imgur.com/uMoGfGx.png)

#### [Textual](https://www.codeux.com/textual/) - IRC Client

- I love IRC and this is the best macOS client for it.
- I created my own [Monokai Night theme](textual#readme) for it that I love.

![](https://i.imgur.com/VZX63Ae.jpg)

- The app also has an awesome channel search feature that I use a lot.

<img src="https://i.imgur.com/CMBW8Qf.png" width="500" alt="img">

app due to its clean interface, a native client and stickers. I use few [KM macros](https://wiki.nikitavoloboev.xyz/macOS/apps/keyboard-maestro/km-macros) & quick jump search to instantly jump to chats.

### Design

#### [Figma](https://www.figma.com) - Design tool

- Use the app to quickly prototype & collaborate on designs.

#### [Sip](https://sipapp.io/) - Collect, organize & share colors

- A great color picker I use to collect my favorite colors and color schemes.

<img src="https://i.imgur.com/B7d1W3v.png" width="400" alt="img">

#### [PixelSnap](https://getpixelsnap.com/) - Measure everything on screen

- Use it to quickly get measurements of objects and distances between elements.

### Music

#### [Spotify](https://www.spotify.com/us/) - Music streaming

- Found a [lot of great music](https://open.spotify.com/user/nikitavoloboev) with this application and the phenomenal [Alfred Workflow](http://alfred-spotify-mini-player.com/) makes using the application an absolute joy.
- Quickly finding artists, songs I want to listen, instantly adding the song playing to my [Likes](https://open.spotify.com/user/nikitavoloboev/playlist/0ERn0U4qZIKC8Dy7RrMMsn?) playlist or any other playlist I want, seeing what other songs the artist has and more.

<img src="https://i.imgur.com/tNThVG0.png" width="500" alt="img">

### Video

#### [IINA](https://github.com/lhc70000/iina) - Video player

- Open source alternative to VLC built specifically for macOS.
- It is based on [mpv](https://github.com/mpv-player/mpv) and has a more modern and native look than VLC.

#### [Kap](https://github.com/wulkano/kap) - Screen recorder

- An open source screen recorder I use to record GIFs.
- Has keyboard support so I can quickly start and end recording of the GIF in one hotkey.

### Browsers

#### [Safari](https://www.apple.com/lae/safari/)

- My favorite browser. It is incredibly fast & cares about my privacy unlike Chrome.

##### Safari Extensions

- [Vimari](https://github.com/televator-apps/vimari) - Adds custom layer of keybinds you can customize to personalize the browsing experience like hinting and moving between tabs.
- [Wipr](https://itunes.apple.com/nl/app/wipr/id1320666476?l=en&mt=12) - Ad content blocker that uses [Safari native content blocking API's](https://developer.apple.com/library/content/documentation/Extensions/Conceptual/ContentBlockingRules/Introduction/Introduction.html).
- [1Password](https://agilebits.com/onepassword/extensions) - [1Password](https://1password.com) is a phenomenal password manager, this extension just gives a seamless interaction of it with the browser.

#### [Google Chrome Canary](https://www.google.com/chrome/canary/)

- Use it to develop websites with Dev Tools and [Pesticide](http://pesticide.io) & [React Dev Tools](https://reactjs.org/blog/2019/08/15/new-react-devtools.html) extensions. Chrome has few [other extensions I like](https://wiki.nikitavoloboev.xyz/web/browsers/google-chrome).

## Command Line Apps

I use [brew](https://brew.sh) package manager to install all the [tools I use on my system](https://github.com/nikitavoloboev/dotfiles/blob/master/magefile.go).

I curate a list of [interesting CLI tools](https://github.com/learn-anything/command-line-tools#readme). Below are ones I love & use often:

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

## Preference Panes

- [SwiftDefaultApps](https://github.com/Lord-Kamina/SwiftDefaultApps/releases/latest) - Set the default application used for various URL schemes, file extensions, file types, MIME types, and Uniform Type Identifiers.
- [TinkerTool](https://www.bresink.com/osx/TinkerTool.html) - Gives you access to additional preference settings Apple has built into macOS.

I also [share screenshots of changes to System Preferences I made](https://imgur.com/a/KoVAxFQ).

## Desktop Screenshot

![](https://i.imgur.com/petNhFp.jpg)

> Using [screenfetch](https://github.com/KittyKatt/screenFetch)

## Alfred launcher

![](https://content.invisioncic.com/r229491/monthly_2020_05/image.png.19a1fde4be98df7dfdb00e53bdd296b1.png)

> Searching [Alfred Learn Anything](https://github.com/nikitavoloboev/alfred-learn-anything#readme). Using [Mono](https://www.alfredapp.com/extras/theme/pKn3GJWnOM/).

## Launchpad

![](https://i.imgur.com/rlrnzOi.png)

## [My wonderful world of iOS 📱](https://github.com/nikitavoloboev/my-ios#readme)

If you found this interesting, I also have [similar repository](https://github.com/nikitavoloboev/my-ios#readme) going over what applications I use on iOS/WatchOS as well as how and why I use them.

<a align="center" href="https://github.com/nikitavoloboev/my-ios#readme">
    <img width="250" heigth="400" src="https://i.imgur.com/q6lSHQI.png"></a>

<a align="center" href="https://github.com/nikitavoloboev/my-ios#readme">
    <img width="250" heigth="400" src="https://i.imgur.com/faN6HSB.jpg"></a>

<a align="center" href="https://github.com/nikitavoloboev/my-ios#readme">
    <img width="250" heigth="400" src="https://i.imgur.com/9N2zJgM.png"></a>

## Similar Setups

Here you can find more setups by other people that you can take ideas and inspiration from.

- [Works for me](https://works-for-me.github.io/) - Collection of developer toolkits.
- [Use This Interviews](https://usesthis.com) - What do people use to get stuff done?
- [Omar Bahareth's my-mac-os](https://github.com/obahareth/my-mac-os) - Another my-mac-os.

## Related

- [Awesome mac](https://github.com/jaywcjlove/awesome-mac#readme)
- [Interesting macOS apps](https://github.com/learn-anything/macos-apps#readme)
- [Open Source macOS apps](https://github.com/serhii-londar/open-source-mac-os-apps#readme)

## Contributing

If you shared a similar personal setup to this, be it for Windows, Linux or anything else, you can add it in [Similar Setups](#similar-setups) section.

I love finding new awesome tools and apps. If you have a favorite tool or app that you think I missed, please [say it](../../issues/new).

## Thank you

You can support me on [GitHub](https://github.com/sponsors/nikitavoloboev) or look into [other projects](https://nikitavoloboev.xyz/projects) I shared.

[![MIT](https://img.shields.io/badge/license-MIT-0a0a0a.svg?style=flat&colorA=0a0a0a)](LICENSE) [![Twitter](http://bit.ly/nikitatweet)](https://twitter.com/nikitavoloboev)
