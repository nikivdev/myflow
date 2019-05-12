# My wonderful world of macOS [![Thanks](http://bit.ly/saythankss)](https://patreon.com/nikitavoloboev)

> List of applications and tools that make my macOS experience even more amazing

![](https://raw.githubusercontent.com/nikitavoloboev/my-mac-os/master/desktop.png)

> All the apps are in one desktop because there is delay in switching between macOS multiple desktops

##### Contents

- [Applications](#applications)
  - [Productivity](#productivity)
  - [Code](#code)
  - [Social](#social)
  - [Writing](#writing)
  - [Design](#design)
  - [Music](#music)
  - [Images](#images)
  - [Video](#video)
  - [Utilities](#utilities)
  - [Browsers](#browsers)
    - [Safari Extensions](#safari-extensions)
- [Command Line Apps](#command-line-apps)
- [Preference Panes](#preference-panes)
- [My wonderful world of iOS](#my-wonderful-world-of-ios-)
- [Similar Setups](#similar-setups)
- [Related](#related)
- [Contributing](#contributing)

## Applications

I use a lot of applications on my mac. Below is a list of the ones that I love and use the most in my day to day life.

I also share [my dotfiles](https://github.com/nikitavoloboev/dotfiles#readme) together with my [iOS setup](https://github.com/nikitavoloboev/my-ios#readme). And I made a [Telegram group](https://t.me/macOSautomation) to discuss all things macOS/iOS.

### Productivity

#### [Alfred](https://www.alfredapp.com) - Launcher

- Alfred is a powerful launcher that you can program to show anything you want. It saved me a lot of time in my life.

<img src="https://i.imgur.com/5h1BMVO.png" width="700" alt="img">

- It has a great [community](http://www.alfredforum.com/) and [amazing workflows](https://github.com/learn-anything/alfred-workflows#readme) that you can use.

- I wrote [an article](https://medium.com/@nikitavoloboev/writing-alfred-workflows-in-go-2a44f62dc432) on how anyone can start developing workflows of their own using Go language and [AwGo](https://github.com/deanishe/awgo) library.

#### [Karabiner](https://pqrs.org/osx/karabiner/) - Keyboard remapping

- Karabiner is an absolutely amazing app that [lets you remap keys at a very low level on macOS](https://medium.com/@nikitavoloboev/karabiner-god-mode-7407a5ddc8f6).
- I have completely remapped my keyboard with it and every key on my keyboard is a custom modifier key that I can program to do what I want.
- For example you can make caps lock into an escape key when pressed once but if you hold it, it becomes a [hyper key](https://medium.com/@nikitavoloboev/karabiner-god-mode-7407a5ddc8f6). Hyper key means that a key now serves two purposes, once when pressed alone and once when held down. So for example, for remapping caps lock, we can remap it to act as escape when pressed alone once but if we hold down on it, it becomes `⌘ + ⌃` modifier key. So `Caps Lock + F` becomes `⌘ + ⌃ + F`. And so on.
- I take this idea further and define these kind of hyper keys for **every single key on my keyboard**.
- I describe how I use Karabiner in detail [here](https://wiki.nikitavoloboev.xyz/macos/macos-apps/karabiner) and I generate [my configuration](https://github.com/nikitavoloboev/dotfiles/blob/master/karabiner/karabiner.edn) with a [Karabiner DSL](https://github.com/yqrashawn/GokuRakuJoudo#readme).

#### [Keyboard Maestro](https://www.keyboardmaestro.com/main/) - Automation tool

- Keyboard Maestro is essentially an IDE for automation. You create macros of actions that you can then easily call from Karabiner.
- It has a [wonderful community](https://forum.keyboardmaestro.com/) that is happy to help with whatever you are trying to achieve.
- I share [all the macros I use](https://wiki.nikitavoloboev.xyz/macOS/apps/keyboard-maestro/km-macros) with the app.

#### [Keytty](https://keytty.com) - Control mouse actions
- Enables you to control your mouse with a few key strokes.
- Mouse Keys Alternative.
- Inspired by Vim keybindings.

#### [2Do](http://www.2doapp.com/mac) - Flexible task manager

- I love GTD methodology. This app is phenomenal with helping me [organize my tasks](https://wiki.nikitavoloboev.xyz/macOS/apps/2do). Here is how my sidebar looks:

<img src="https://i.imgur.com/Q4EC6Qa.png" width="150">

- It also has global quick add with a hotkey. Together with lists, priorities, powerful search and a lot more.

<img src="https://i.imgur.com/QuBsexM.png" width="400" alt="img">

#### [Trello](https://trello.com) - Project management tool

- I use the app a lot to track various projects I have in my life.
- I share many boards I made [publicly](https://wiki.nikitavoloboev.xyz/sharing/my-trello). Here is an example of a public board for tracking various [things I want to learn](https://trello.com/b/cu32qF3q).

![](https://i.imgur.com/0l8Ivd5.jpg)

- I assign myself to the cards I am working on now and filter to see only them by [pressing Q key](https://trello.com/shortcuts). I mark cards I want to work on next with `Next` tag.

#### [1Password](https://1password.com) - Password manager

- Generate all of my passwords with it and keep everything in a secured and encrypted vault kept secure by my one master password.
- No longer need to remember passwords and I now have a unique password for every website that I am signed up on whilst [activating two factor authentication](https://support.1password.com/one-time-passwords/) wherever possible.

#### [Timing](https://timingapp.com/?) - Automatic time tracker

- I use Timing app to fully automate tracking my time on my computer.
- The fact that I can combine active and passive tracking together is very powerful and allows me to be more aware of where I spend my time.

![](https://i.imgur.com/lPloyw0.png)

#### [MindNode](https://mindnode.com) - Interactive Mind Mapping

- An application which allowed me to originally create all of the maps for [Learn Anything](https://learn-anything.xyz).

![](https://raw.githubusercontent.com/learn-anything/learn-anything/2017/media/header.png)

- I also use MindNode to visualize topics and their relations as an [interactive mind map](https://my.mindnode.com/dPmKpWZgTpZsaG4Rf1yaz7rXbYhnuqPDDpdss4w2#1594.8,-1084.6,1). I use [Monokai Night](mindnode#readme) theme for it.

![](https://i.imgur.com/Y7rqrKt.png)

#### [Typinator](http://www.ergonis.com/products/typinator/) - Text expansions

- I use the app to [fully automate writing repetitive text](https://medium.com/@nikitavoloboev/write-once-never-write-again-c2fa1f6c4e8).
- I share all the Typinator sets I made with the app [here](typinator).

#### [BetterTouchTool](https://www.boastr.net/) - Mac input customizer

- I use this app a lot for mapping [various trackpad gestures](https://medium.com/@nikitavoloboev/take-control-of-your-touchpad-on-macos-45c581f542e0#.7n1ye6vze) to hotkeys and actions both globally and per specific apps.
- I love scrolling through my tabs in Safari with three finger swipes left and right as well as opening and closing tabs with swiping up and down respectively.
- I share [all the different gestures I have setup to use with the app](btt#readme) that you can view and download.
- I also use the app to modify how my TouchBar looks.

![](https://i.imgur.com/BqBGuXq.png)

#### [PDF Expert](https://pdfexpert.com/) - PDF reader/editor

- I read a lot of PDFs like books, research papers and the like. This app is a huge upgrade over Preview app that I used before.
- Multiple tabs, sepia mode, very nice annotation tools, great search, performance.

#### [Fantastical](https://flexibits.com/fantastical) - Calendar

- I use the app to manage events in my life.
- I take great use of Fantastical's natural language input and I use [many Typinator expansions](https://medium.com/@nikitavoloboev/fantastical-natural-input-text-expansions-3ea8cf7ccac3#.pv5937ncr) to ease this process.
- I always view my events from `Week` view. And show 5 days only with all 24h shown for all days. This lets me have a perspective over what I have to do now. What deadlines I have to complete soon. And gives me the freedom to adjust my schedule in light of upcoming deadlines and events.

#### [Contexts](https://contexts.co) - Window switcher

- Allows me to fuzzy search through all the currently active windows that I have.

![](https://i.imgur.com/ZiRGtFc.png)

- Makes jumping to the right window I need effortless. I often may have many VS Code instances with different projects running and this lets me switch to the project I need in seconds.

#### [TaskPaper](https://www.taskpaper.com) - Plain text TODOs

- Use the app to [dissect problems I am trying to solve into smaller and smaller parts I can work on](https://wiki.nikitavoloboev.xyz/research/solving-problems).

![](https://i.imgur.com/2pGHIOu.png)

#### [Dictionary](<http://en.wikipedia.org/wiki/Dictionary_(software)>)

- Comes natively with macOS and I started to love using it for exploring and searching through Wikipedia.
- It is incredibly fast to make the searches and it gives quick autosuggestions for any query I type that I can then select with up and down arrows.

![](https://i.imgur.com/Nj4erv5.png)

#### [Bartender](https://www.macbartender.com/) - Menu bar organizer

- Allows you to customize and hide the contents of your menu bar and improve the aesthetics of your OS. Here is how mine looks:

<img src="https://i.imgur.com/ER32snR.png" width="500" alt="img">

- My menu bar is always hidden so I rarely ever use it and I show most needed info on the [TouchBar](btt#readme) instead.

#### [Focus](https://heyfocus.com) - Block distracting websites

- I use [Focus app](https://heyfocus.com) as a recurring [pomodoro timer](https://en.wikipedia.org/wiki/Pomodoro_Technique) which lets me work in sessions of 80 minutes with 10 min breaks by blocking [distracting websites](https://gist.github.com/nikitavoloboev/57340528a6dfb3eb498dce647ed6841f) and apps.

<img src="https://i.imgur.com/H7TMqgS.png" width="500" alt="img">

<img src="https://i.imgur.com/MZGyqQe.png" width="500" alt="img">

- If I go to any of my blocked websites during my `Focus` time, I am greeted with this message.

<img src="https://i.imgur.com/JML4ywh.png" width="500" alt="img">

#### [Annotate](https://itunes.apple.com/us/app/annotate-capture-screenshot/id918207447?mt=12) - Create and annotate screenshots

- Best annotation tool I found to exist. After you make a screenshot, it allows for quick edits. Adding arrows, some text, blurring parts of the image as well as ability to quickly save the image or drag it to Dropzone to upload to Imgur to share the link quickly with anyone I want.

#### [Popclip](https://pilotmoon.com/popclip/) - iOS like mouse text selection popover

- Another great utility I cannot live without, brings up a quick menu whenever some text is selected on which I can do a number of quick actions, like searching on Google, DuckDuckGo, YouTube, Dictionary, Reddit, Google Images or it can translate text selected, copy it or even make a SnippetsLab snippet from it. Here is how it looks for me:

<img src="https://i.imgur.com/DZmV10j.png" width="400" alt="img">

- I share all the extensions I use with it [here](popclip#readme.md).

#### [Noizio](http://noiz.io/) - Ambient sounds

- I sometimes like listening to sounds of rain, train or fire to focus. Although Nils Frahm [is better](https://open.spotify.com/track/2OroSHoRb4Sev1Jw82GN07).

#### [Hammerspoon](http://www.hammerspoon.org) - Automation tool

- Powerful automation engine I am still exploring. My config for it can be seen [here](https://github.com/nikitavoloboev/dotfiles/blob/master/hammerspoon/).

#### [Reeder](http://reederapp.com/mac/) - RSS Reeder

- The app I use to keep up with my RSS feeds. I use RSS to follow my favorite blogs, stay up to date on new podcast episodes and even track some software releases.
- I use [Inoreader](https://www.inoreader.com) to sync [blogs I follow](https://wiki.nikitavoloboev.xyz/research/blogs) between phone and mac.
- Here is how Reeder looks like for me:

![](https://i.imgur.com/2Ruad9G.png)

#### [Dropzone](https://aptonic.com) - Drag and drop actions

- A quick utility that pops up when I drag some file into it or open it with a hotkey. I use its [actions](https://atika.github.io/dropzone3-actions/) to [upload images to Imgur](https://www.dropbox.com/sh/yh78jmjw8ra43qb/AAAFJ0ba1WRkNY45FDjYPL00a?dl=1), [upload videos to YouTube](https://atika.github.io/dropzone3-actions/youtube-uploader-aptonic-software-action.html) & [searching images with Google](https://atika.github.io/dropzone3-actions/image-search-aptonic-software-action.html). I also use it to drop files into a preset number of common folders.

<img src="https://i.imgur.com/5InxMrE.png" width="300" alt="img">

#### [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html) - Control incoming/outgoing network traffic

- Amazing networking tool that gives you a clear picture of what connections are incoming to your computer and what are outgoing.
- Takes a bit of time to set it up correctly and is quite an insightful experience first turning it on and having it notify every couple of seconds that some app is trying to send data to some server and whether you want to allow that.
- This is essential if you want to take control of what information gets sent out from your computer and what connections have the right to connect to your data.

#### [BeardedSpice](https://github.com/beardedspice/beardedspice) - Extend Mac Media Keys

- Enhance play/pause as well as previous/next playback keys to not only work in iTunes and Spotify but work for SoundCloud, YouTube and many other services.

#### [Transmission](https://www.transmissionbt.com/) - BitTorrent client

- A torrent client that I use. Very minimal in its UI but very powerful and has all the features that I need.

#### [Transmit](https://www.panic.com/transmit/) - Transfer files

- I sometimes use this app to quickly send files from my local file system to the cloud and get a shareable link I can send to people.
- I use [this Alfred workflow](https://github.com/bigluck/alfred2-transmit) to quickly open the cloud storage I need.

<img src="https://i.imgur.com/TfCsokt.png" width="400" alt="img">

#### [Paprika Recipe Manager](https://itunes.apple.com/us/app/paprika-recipe-manager-3/id1303222628?ls=1&mt=12)

- Use the app to store the many [vegan recipes](https://github.com/nikitavoloboev/vegan-recipes#readme) I like to make.

### Code

#### [VS Code](https://github.com/Microsoft/vscode) - Code editor

- My favorite editor that I use to write code in. I use [many extensions](https://wiki.nikitavoloboev.xyz/text-editors/vs-code/vs-code-extensions) for it.
- My config for it can be found [here](https://github.com/nikitavoloboev/dotfiles/blob/master/vscode/settings.json).
- I use VS Code [Monokai Night](https://github.com/fabiospampinato/vscode-monokai-night#readme) theme with [Fira Code](https://github.com/tonsky/FiraCode) font. Here is how it looks:

![](https://i.imgur.com/hOgSQ7F.png)

#### [iTerm](https://www.iterm2.com/) - Terminal Emulator

- Use Zsh as my shell together with [Antibody](https://github.com/getantibody/antibody) to install [Zsh plugins I use](https://wiki.nikitavoloboev.xyz/unix/shell/zsh/zsh-plugins).
- Assigned w + j with [Karabiner](https://wiki.nikitavoloboev.xyz/macos/macos-apps/karabiner) to open the app from Keyboard Maestro in seconds.
- I made my own [Monokai Night theme](iterm#readme) for it.

<img src="https://i.imgur.com/ItDUF98.png" width="500" alt="img">

- I also love using [this workflow](https://github.com/isometry/alfred-tty) to quickly switch between active tty sessions.

<img src="https://i.imgur.com/kdo0x8Y.png" width="500" alt="img">

- I go over how I use the app [here](https://wiki.nikitavoloboev.xyz/macOS/apps/iterm).

#### [Sublime Text](https://www.sublimetext.com) - Text Editor

- Use this editor in addition to VS Code and Neovim for its blazing fast speed of opening files.
- I use it primarily to edit markdown files like [my wiki](https://wiki.nikitavoloboev.xyz/other/wiki-workflow). I also edit config files and open large and small files for quick edits.
- I use [many plugins](https://wiki.nikitavoloboev.xyz/text-editors/sublime-text/sublime-text-plugins) together with [Ayu theme](https://github.com/dempfi/ayu).

#### [Dash](https://kapeli.com/dash) - API Documentation Browser

- Allows you to download any docset that you might want to use, search for any method, class or anything that you need very quickly, comes with the amazing [Alfred workflow](https://www.alfredapp.com/blog/productivity/dash-quicker-api-documentation-search/) to simplify the process of searching for the right things.

<img src="https://i.imgur.com/dItnB52.png" width="500" alt="img">

- I also use [this workflow](https://github.com/nikitavoloboev/small-workflows/tree/master/dash-profile-switch#readme) I made to quickly switch between Dash profiles.

<img src="https://i.imgur.com/gCz4s9z.png" width="500" alt="img">

#### [SnippetsLab](https://www.renfei.org/snippets-lab/) - Snippet manager

- I use the app to manage my own personal library of snippets. I prefix all snippets I make. For example vim snippets are prefixed with `vim:`. Git related snippets with `git:` and so on.
- The app also provides an awesome Assistant to quickly search through the snippet database:

![](https://i.imgur.com/ax2NZ5q.png)

Here is how my library looks:

![](https://i.imgur.com/F7j1MSk.png)

- I share my entire library of snippets as [GitHub Gists](https://wiki.nikitavoloboev.xyz/sharing/my-gists).

#### [Tower](https://www.git-tower.com) - Git client

- Use the app to help me version control any project I am working on. Love the ability to search through commits, check out branches with ease and searching through all the Git repositories I have on my mac with quick search.
  ![](https://i.imgur.com/Ez9MmLe.png)

#### [Paw](https://paw.cloud) - HTTP client

- Use the tool to quickly make HTTP requests and test out API endpoints.

#### [Neovim](https://neovim.io) - Text Editor

- The best text editing experience you will ever get. It is worth learning it as you will start thinking about text editing differently.
- I use some kind of vim bindings in any app I use and if there is a vim plugin for the app, I often use it. I use [vim editor](https://wiki.nikitavoloboev.xyz/text-editors/vim/vim) often when connecting to remote sessions and when I need a console editor.
- My [Neovim](https://github.com/neovim/neovim) config can be seen [here](https://github.com/nikitavoloboev/dotfiles/blob/master/nvim/init.vim). I use [Monokai Night theme](https://github.com/nikitavoloboev/vim-monokai-night#readme) with [many plugins](https://wiki.nikitavoloboev.xyz/text-editors/vim/vim-plugins). Here is how it looks:

![](https://i.imgur.com/sLXBvv7.png)

#### [Bee](https://www.neat.io/bee/) - GitHub Issue Tracker

- Use the app to stay on top of all issues across my GitHub repos. All issues I want to work on soon are put into **Next** queue and I work through each one, one by one.

### Social

#### [Textual](https://www.codeux.com/textual/) - IRC Client

- I love IRC and this is the best macOS client for it.
- I created my own [Monokai Night theme](textual#readme) for it that I love.

![](https://i.imgur.com/Lpozk8X.png)

- The app also has an awesome channel search feature that I use a lot.

<img src="https://i.imgur.com/CMBW8Qf.png" width="500" alt="img">

#### [Telegram](https://desktop.telegram.org/) - Messenger

- The app has a very clean interface, a native client for macOS and stickers. Chats are not encrypted by default and don't use [approved cryptography](https://security.stackexchange.com/questions/49782/is-telegram-secure) but the client is amazing and fast.

#### [Spark](https://sparkmailapp.com) - Email client

- Love how it smartly categorizes emails by categories.
- I approach all of my email tasks in GTD style. Keeping my email Inbox close to 0 at all times.

#### [Tweetbot](http://tapbots.com/tweetbot/mac/) - Twitter client

- I use the app to stay up to date and communicate on Twitter.
- Tweetbot is also blocked for me during my [Focus time](https://wiki.nikitavoloboev.xyz/focusing). I can only post tweets but I can't visit the app to see my feeds.
- Twitter is my primary way to stay up to date on things and is my favorite social network after GitHub. I curate and publicly share all [Twitter lists](https://twitter.com/nikitavoloboev/lists) I personally use.
- I have Tweetbot open in full screen with three columns (Mentions/[Top](https://twitter.com/nikitavoloboev/lists/top)/[Top 2](https://twitter.com/nikitavoloboev/lists/top-2)). Here is how that looks for me:

![](https://i.imgur.com/gdQRoke.png)

### Writing

#### [Day One](http://dayoneapp.com/) - Digital journal

- Day One is my digital life journal.
- My entire life's experiences lives encrypted in the journal. Adding photographs I made, the thoughts I had and events that happened to me.
- I document and review [my life](https://wiki.nikitavoloboev.xyz/looking-back) publicly too.
- The app has integration with [IFTTT](https://ifttt.com/day_one) which I use to automatically log all [my tweets](https://twitter.com/nikitavoloboev) and [Instagram posts](https://instagram.com/nikitavoloboev).
- If you don't journal, I suggest you to start, it is a very powerful mind cleanser and acts as a wonderful history record of your life.

#### [Marked](http://marked2app.com) - Preview rendered markdown files

- If I ever need to preview a readme or any other markdown file that I wrote or just want to read, this app is the best application for that I found. It also features live updating and quite a lot of customizable features.

### Design

#### [Sketch](https://www.sketchapp.com/) - Design tool

- Use the app to quickly prototype new designs. I also enjoy using [Figma](https://www.figma.com) a lot.

#### [Sip](https://sipapp.io/) - Collect, organize & share colors

- A great color picker I use to collect my favorite colors and color schemes.

<img src="https://i.imgur.com/i8lJ1HO.png" width="400" alt="img">

#### [PixelSnap](https://getpixelsnap.com/) - Measure everything on screen

- Use it to quickly get measurements of objects and distances between elements.

### Music

#### [Spotify](https://www.spotify.com/us/) - Music streaming

- Found a [lot of great music](https://open.spotify.com/user/nikitavoloboev) with this application and the phenomenal [Alfred Workflow](http://alfred-spotify-mini-player.com/) makes using the application an absolute joy.
- Quickly finding artists, songs I want to listen, instantly adding the song playing to my [Likes](https://open.spotify.com/user/nikitavoloboev/playlist/0ERn0U4qZIKC8Dy7RrMMsn?) playlist or any other playlist I want, seeing what other songs the artist has and more.

<img src="https://i.imgur.com/tNThVG0.png" width="500" alt="img">

### Images

#### [Pixave](http://www.littlehj.com/mac) - Image/GIF/Video organizer

- I use Pixave as my own personal image library. I sort images in groups and I have powerful search I can use to find any image I need.
- Here is how my library looks:

![](https://i.imgur.com/I7x3cUX.jpg)

- The red tag means that the image was uploaded to my [Instagram page](https://instagram.com/prettiways).

### Video

#### [IINA](https://github.com/lhc70000/iina) - Video player

- Open source alternative to VLC built specifically for macOS.
- It is based on [mpv](https://github.com/mpv-player/mpv) and has a more modern and native look than VLC.

#### [Kap](https://github.com/wulkano/kap) - Screen recorder

- An open source screen recorder I use to record GIFs.
- Has keyboard support so I can quickly start and end recording of the GIF in one hotkey.

### Utilities

#### [Hazel](https://www.noodlesoft.com) - Automated File Organization

- Use it to fully automate my filing process and automatically commit changes in [many curated lists](https://github.com/learn-anything/curated-lists#readme).
- I share most Hazel rules and how I use them [here](hazel#readme).

#### [DaisyDisk](https://daisydiskapp.com) - Visualize taken disk space

- A great tool to quickly get a visual glance over what is taking up your disk space and where.

#### [iStat Menus](https://bjango.com/mac/istatmenus/) - Mac system monitoring from menu bar

- Great system monitoring tools which I use to quickly see my CPU/network/memory usage. I find it very valuable to know if my CPU is being abused by some application and if so by which. I then use [ProcessControl](https://github.com/vitorgalvao/alfred-workflows/tree/master/ProcessControl#readme) workflow to quickly kill off misbehaving processes. Often times iStat Menus is deactivated for me to preserve battery.

#### [PodcastMenu](https://github.com/insidegui/PodcastMenu) - Puts Overcast in menu bar

- Allows you to listen and control playback of podcasts from [Overcast](https://overcast.fm) right from your menu bar.

### Browsers

#### [Safari](https://www.apple.com/lae/safari/)

- My favorite browser. It is incredibly fast, doesn't have the baggage of all the Google Chrome tracking and is native to macOS so it is extremely optimized and doesn't kill your battery.
- One powerful plus that Chrome does have over safari is the amount of Chrome extensions that you can get. Fortunately the ones most needed for me do [exist on Safari](https://github.com/learn-anything/safari-extensions#readme).

##### Safari Extensions

- [sVim](https://github.com/flipxfx/sVim) - Adds a custom layer of keybinds you can customize to personalize your browsing experience. [My config](https://gist.github.com/c26e6a05e4e426e0542e55b7513b581c).
- [Wipr](https://itunes.apple.com/nl/app/wipr/id1320666476?l=en&mt=12) - Ad content blocker that uses [Safari native content blocking API's](https://developer.apple.com/library/content/documentation/Extensions/Conceptual/ContentBlockingRules/Introduction/Introduction.html).
- [1Password](https://agilebits.com/onepassword/extensions) - [1Password](https://1password.com) is a phenomenal password manager, this extension just gives a seamless interaction of it with the browser.
- [Cascadea](https://cascadea.app) - Custom styles extension. Use it to create dark themes for apps that don't have a dark mode option. Also allows importing of [Stylish themes](https://wiki.nikitavoloboev.xyz/web/browsers/stylish-themes).
- [Dark Reader](https://darkreader.org/safari/) - On websites that don't have a nice Stylish theme, I like to use Dark Reader to turn all the websites I visit to dark mode. It works surprisingly well.

#### [Google Chrome](https://www.google.com/chrome/)

- I only use Chrome for web development due to its superior Chrome Dev tools.
- I also love the variety of [Chrome extensions](https://github.com/learn-anything/chrome-extensions#readme) that people have built and shared.

#### [Beaker Browser](https://beakerbrowser.com)

- Experimental Peer to Peer browser. Experimenting with using it more and more as I find the [technology and the implications of it fascinating](https://www.youtube.com/watch?v=-ep0ZIe6i10).

#### [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/)

- Use it for web development for its superior Dev Tools in debugging CSS Grid. Prefer Chrome Dev tools still.

## Command Line Apps

I use [Nix](https://nixos.org/nix/) package manager to install all the [packages I use on my system](https://github.com/nikitavoloboev/dotfiles/blob/master/nix/darwin.nix#L6).

I curate a list of [interesting CLI tools](https://github.com/learn-anything/command-line-tools#readme) you can use. Below are some command line tools I personally use and love.

- [fzf](https://github.com/junegunn/fzf) - Command-line fuzzy finder.
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Search text for patterns fast.
- [fd](https://github.com/sharkdp/fd) - Simple, fast and user-friendly alternative to 'find'.
- [exa](https://github.com/ogham/exa) - Replacement for ls written in rust.
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
- [create-react-app](https://github.com/facebookincubator/create-react-app) - Create React apps with no build configuration.
- [now](https://github.com/zeit/now-cli) - Real time global deployments served over HTTP/2.
- [yarn](https://github.com/yarnpkg/yarn) - Fast, reliable, and secure dependency management.
- [hub](https://github.com/github/hub) - GitHub wrapper.
- [entr](http://www.entrproject.org/) - Run arbitrary commands when files change.
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

- [GPG Suite](https://gpgtools.org/) - Encrypt, decrypt, sign and verify files or messages.
- [SwiftDefaultApps](https://github.com/Lord-Kamina/SwiftDefaultApps/releases/latest) - Set the default application used for various URL schemes, file extensions, file types, MIME types, and Uniform Type Identifiers.
- [TinkerTool](https://www.bresink.com/osx/TinkerTool.html) - Gives you access to additional preference settings Apple has built into macOS.

I also [share screenshots of all the changes to System Preferences I have made](https://imgur.com/a/KoVAxFQ).

## Desktop Screenshot

![](https://i.imgur.com/uKsu94o.png)

> Using [screenfetch](https://github.com/KittyKatt/screenFetch)

## Alfred launcher

![](https://i.imgur.com/k2hrurX.png)

> Searching [Alfred Learn Anything](https://github.com/nikitavoloboev/alfred-learn-anything#readme). Using [Monokai Night theme](https://www.alfredapp.com/extras/theme/PQVZpeg4Zi/).

## Monokai Night themes

![](https://i.imgur.com/PsZMur5.jpg)

> Having a [unified theme](https://wiki.nikitavoloboev.xyz/design/monokai-night-themes) across apps is amazing

## Launchpad

![](https://i.imgur.com/J8szqco.jpg)

> I add a [small space in my Dock](https://www.imore.com/add-space-your-mac-dock) to separate apps I always have open with apps I seldom open

## [My wonderful world of iOS 📱](https://github.com/nikitavoloboev/my-ios#readme)

If you found this interesting, I also have [similar repository](https://github.com/nikitavoloboev/my-ios#readme) going over what applications I use on iOS/WatchOS as well as how and why I use them.

<a align="center" href="https://github.com/nikitavoloboev/my-ios#readme">
    <img width="250" heigth="400" src="https://i.imgur.com/wcp3Vrq.jpg"></a>

<a align="center" href="https://github.com/nikitavoloboev/my-ios#readme">
    <img width="250" heigth="400" src="https://i.imgur.com/Ji1pGJe.jpg"></a>

<a align="center" href="https://github.com/nikitavoloboev/my-ios#readme">
    <img width="250" heigth="400" src="https://i.imgur.com/apciZdL.jpg"></a>

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

You can support me on [Patreon](https://www.patreon.com/nikitavoloboev) or look into [other projects](https://nikitavoloboev.xyz/projects) I shared.

[![MIT](https://img.shields.io/badge/license-MIT-0a0a0a.svg?style=flat&colorA=0a0a0a)](LICENSE) [![Twitter](http://bit.ly/nikitweet)](https://twitter.com/nikitavoloboev)
