# general
alias g='gcloud'
# alias dev='pnpm run dev'
alias dev='bun dev'
alias .='open .'
# alias go="go1.19rc2"
alias nr="pnpm run dev"
alias python="python3"
alias n="pnpm"
alias nd="nr dev" # https://github.com/antfu/ni
alias ni="ni"
alias nb="pnpm run build"
# alias n="npm"
# alias nd="npm run dev"
# alias ni="npm install"
# alias nb="npm run build"
alias prettierwrite="prettier --write '**/*.{ts,tsx,js,css,html,md,json}'"
alias ip='ipconfig getifaddr en0 | pbcopy' # Copy IP address
alias t1="tree -L 1 -I 'node_modules|cache|test_*'"
alias t2="tree -L 2 -I 'node_modules|cache|test_*'"
alias t3="tree -L 3 -I 'node_modules|cache|test_*'"
alias f='open .'
alias pb='pbcopy'
alias te='tree'
alias op='open'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete" # Recursively delete `.DS_Store` files
# alias g='git' # Wrapper over git
alias peek='tee >(cat 1>&2)' # Mirror stdout to stderr, useful for seeing data going through a pipe
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo 'public key copied to pasteboard'"
alias lc='tokei'
alias _='sudo'
alias ae='subl readme.md'
alias aet='subl contributing.md'
alias yi="python -i"
alias le='less -r'
alias wifi='wifi-password -q'
alias eo='echo'
alias es='elasticsearch'
alias mc='md-to-alfred'
alias pd='pandoc'
alias yt='yotube-dl'
alias r='rg'
alias alf='alfred'
alias d='cd'
alias lg='ls | grep'
alias so='source'
alias top='gotop'
alias ka='echo'
alias rl='curl'
alias how='howdoi'
alias ua='unalias'
alias m='mkdir'
alias mm='tldr'
alias ma='man'
alias rec='asciinema rec'
alias dus='du -s'
alias to='touch'
alias t='bat'
alias zo='open'
alias ki='kill'
alias icat='imgcat'
alias tt='tldr'
alias tre='tree -a'
alias q='exit'
alias screen='screenfetch'
alias mx='chmod +x'
alias rr='rm -rf'
alias a='exa'
alias aa='exa -la' # See hidden files
alias v='mv'
alias os='osascript'
alias lt='ls -lart'
alias tp='type'

# Nix
# alias n='nix'
# alias nr='nix repl'
# alias R='darwin-rebuild switch'

# Nix shell
# alias ns="nix-shell --run zsh"
# alias nss="nix-shell --run zsh -p"

# Brew
alias bi='brew install'

# Watch files & run cmds
alias wa='watchexec --exts'
# alias wg='watchexec --exts go "echo -- && go run ."'
alias wg='watchexec --restart --exts go "echo -- && go run ."'
alias wf='watchexec --exts go "alfred build"'
alias wG='cd ~/src/learning/go && watchexec --exts go "echo -- && go run ."'
alias we='watchexec --restart --exts go "echo -- && go run ."'
alias wp='watchexec --exts py "echo -- && python3"'
alias wn='watchexec --exts js "echo -- && node"'
alias wb='watchexec --exts ts "echo -- && bun run"'
alias wtex='watchexec --exts "echo -- && .tex"'
alias wo='watchexec --exts go "echo -- && go install"'
alias wr='watchexec --exts rs "echo -- && cargo run -q"'

# Dev
alias ll='ln -s'
alias tm='task'
alias rf='reflex'
alias ser='serve'
alias cra='npx create-react-app'
alias lic='legit'

# Python
# alias p='python3'
# alias p2='python2'

# Alfred
alias wfl='alfred link'
alias wfa='alfred pack -o ~/Desktop'
alias ws='workflow-install -s workflow' # Symlink `source` directory

# Docker
alias do='docker'
alias dos='docker ps'
alias dcls='docker container ls'
alias css='docker stop $(docker ps -a -q)' # Stop running containers
alias csr='docker rm -f $(docker ps -q)' # Stop & remove running containers
# alias csr='docker kill $(docker ps -q)' # Kill active containers
alias dco='docker-compose'
alias dcu='docker-compose up'
alias dcs='docker-compose ps'

# Kubernetes
alias k='kubectl'
alias kl='kubectl logs'
alias kf='kubectl logs -f' # Get logs for <pod> streaming in real time
alias kde='kubectl describe'
alias ke='kubectl explain'
alias kg='kubectl get'
alias ks='kubectl get pods'
alias kd='kubectl delete pods'
alias ksw='kubectl get pods -o=wide -w'
alias kp='kubectl port-forward'

# Node
alias no='node'

# Yarn
alias ja='yarn add'
alias jad='yarn add --dev'
alias jt='yarn test'
alias jr='yarn run'
alias je='yarn remove'
alias js='yarn start'
alias jd='yarn  dev'
alias jg='yarn global add'

# Go
alias o='go install'
alias oi='go mod init github.com/nikitavoloboev/' # TODO: grab current dir and use it as name
alias org='richgo'
alias og.='go get ./...' # go get all packages for current project
alias ot='playgo'
alias or='go run'
alias ov='go vet'
alias ogu='go get -u' # use the network to update the named packages and their dependencies
alias ob='go build'
alias ora='go-pry'
alias oe='go build -o main'
alias ugo='Go-Package-Store' # displays updates to Go packages

# Ruby
alias rb='ruby'

# Piping
alias h2='head -n 2'
alias h10='head -n 10'
alias t10='tail -n 10'

alias hs='ghci'

alias cwd='pwd | pbcopy'

# Delete things
alias rrpdf='rm -rf *.pdf'

# Source things
# alias sz='exec zsh'
alias sz='source ~/.zshrc'

# Hugo
alias hu='hugo'
alias hug='hugo server -D'
alias huw='hugo server -w' # testing

# Nginx
alias ngup='sudo nginx'
alias ngdown='sudo nginx -s stop'
alias ngre='sudo nginx -s stop && sudo nginx'
alias nglog='tail -f /usr/local/var/log/nginx/access.log' # TODO: maybe wrong location
alias ngerr='tail -f /usr/local/var/log/nginx/error.log'

# Utility
alias net="ping ya.ru | grep -E --only-match --color=never '[0-9\.]+ ms'"                # check connection
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
alias ba="bash"

# Easier navigation
# alias .="cd -" # Go back to previous dir
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias cpu='top -o cpu'   # CPU
alias mem='top -o rsize' # Memory

# Apps
alias can="open -a Google\ Chrome\ Canary"
alias saf="open -a Safari"

# Edit configs
alias ew='nvim ~/.dotfiles/nvim/init.vim' # nvimrc
alias essh='nvim ~/.ssh/config' # ssh config
alias ek='nvim ~/.dotfiles/karabiner/karabiner.edn'
alias ez='nvim ~/.zshrc'

# cd places
alias doc='cd ~/Documents/'
alias dn='cd ~/clones'
alias ds='cd ~/.ssh'
alias dk='cd ~/Dropbox/Write/knowledge'
alias dl='cd ~/src/learning'
alias dg='cd ~/src/lib/go/go'
alias da='cd ~/src/'
alias dz='cd ~/.dotfiles'
alias de='cd ~/Desktop'
alias dq='cd ~/Downloads'
alias dls='cd ~/Library/Services'
alias drp='cd ~/Dropbox'
alias dbin='cd /usr/local/bin/'

# Config
alias db='cd /usr/local/bin'
alias dB='cd ~/.dotfiles/bin'
alias d.='cd ~/.config'

# Utilities
alias ungit="find . -name '.git' -exec rm -rf {} \;" # Remove git from a project
alias gto='gittower'

# Git
alias gj='open `git config remote.origin.url`'
alias gm='git branch -m' # Rename current branch
alias ger='git checkout -' # Checkout last branch you were on
alias grl='git reset --hard && git clean -df' # Reset to exact state as last commit
alias grhf='git checkout HEAD --' # Git reset single file
alias gf='git log --pretty=oneline --abbrev-commit --graph --decorate'
alias gpm="git push origin master"
alias gfk='git fetch && git reset --hard && git clean -dfx' # Reset repo to clean remote state
alias gsp='git pull --rebase --autostash' # Git stash, pull and apply stash
alias gu='git issues'
alias gdp='git reset --hard HEAD~; git push --force-with-lease' # Delete previous commit locally and remote
alias gpd="git push origin develop"
alias ggh='push -u origin HEAD'
alias gre='git rebase -i HEAD~4'
alias gS='git stash'
alias gqa='git stash apply'
alias gb='git checkout -b'
alias gr='git reset --hard'
alias grc='git rm --cached'
alias ggn='git_add_origin_and_origin_push'
alias g:='git push -u origin master'
alias ggf='git push -f'
alias g::='git_remote_add_origin_from_active_link'
alias gi='git init'
alias gl='git pull'
alias gn='git clone'
alias ga='git add'
alias gg='git push'
alias glp='git pull && git push'
alias grao='git remote add origin'
alias gnvm="git reset --soft HEAD~1" # undo commit https://twitter.com/bencodezen/status/1371564043278946305

alias greset='git reset --soft HEAD^' # Undo last commit, but don't throw away your changes

# Git Diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdn='git diff --name-only'

# Git Status
alias gs='git status --short'
alias gss='git show --word-diff=color' # See changes made

# Mage
alias fs='mage start'

# Django
alias dj='./manage'

## Dendron
# alias n='dendron-cli'
# alias ns='dendron-cli buildSiteV2 --wsRoot . --stage dev --serve' # serve dendron locally
# alias ng='dendron-cli buildSiteV2 --wsRoot .  --stage prod' # publish dendron
