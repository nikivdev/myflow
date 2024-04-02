# cd places
alias d="z"
alias da="cd ~/src"
alias dg="cd ~/src/config"
alias de="cd ~/Desktop"
alias ds="cd ~/try"
alias dm="cd ~/temp"
alias dv="cd ~/try/private"
alias dt="cd ~/data"
alias dw="cd ~/data/wiki"
alias d.="cd ~/.scripts"

# rust
# alias rbnowarning="RUSTFLAGS="-A warnings" cargo build"

# run code fast
alias :ts="fish -c 'cd ~/src/ts; bun dev'"

# other
alias :id="bun i -d" # dev dep install
alias a="eza" # list files
alias aa="eza -la" # list files (with hidden)
alias cwd='pwd | pbcopy'
alias v="mv" # move files/folders or rename
alias sf="source ~/.config/fish/config.fish" # source fish config
alias rr="rm -rf"
alias md="mkdir"
alias wgi="watchexec --restart --exts go \"tput reset && go install .\""
alias wg="watchexec --restart --exts go \"tput reset && go run .\""
# alias dw="deno task watch"
alias :id="bun i -d" # dev dep install
alias :d="bun dev"
alias :t="bun test --watch"
alias e="edgedb"
alias :s="cd ~/src/ts/packages/solid && bun dev" # run solid web server
alias :j="cd ~/src/ts && bun dev"
# alias :r="cd ~/src/rust && bun dev"
alias :t="cd ~/src/python && bun dev"
alias getLastCommitHash="git log -1 --format=\"%H\""
alias pr="pnpm run"
alias w.="cursor-nightly .env"
alias pw='pnpm add -w'
alias gmt='go mod tidy'
alias findAll.gitInCurrentDir="find . -type d -name .git"
alias :g="bun install -g"
alias nv="sudo nvim"
# alias .="open ."
alias pi="pnpm i"
