alias d="z"
alias da="cd ~/src"
alias a="eza" # list files
alias af="type" # <cmd> - view definition of <cmd>
alias do="cd ~/src/org"
alias gl="git pull"
alias rr="rm -rf"
alias wr="cursor readme.md"
alias df="cd ~/src/config"
alias dw="cd ~/src/wiki"
alias aa="eza -la" # list files (with hidden)

# _functions
# TODO: make completions for `: ` so it gets the scripts found in package.json
# below is maybe hacky way to do it but it has to by dynamic
function :
    if not set -q argv[1]
        bun dev
    else
        bun $argv
    end
end

function w
    if not set -q argv[1]
        cursor .
    else
        cursor $argv
    end
end

# tunnels local telegram mini app
function ng
    set -l port 5173
    set -l domain "tma.internal"
    ngrok http "https://$domain:$port" --host-header="$domain:$port"
end

# g. - commit all with `.` as message
function g.
    git add .
    git commit -m "."
    git push
end

function prettierAll
    npx prettier --write "**/*.{js,json,css,tsx,ts}"
end
