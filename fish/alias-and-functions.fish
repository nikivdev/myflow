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

function :se
    bun seed $argv
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

# TODO: might be buggy
function gitSetSshOrigin
    set -l repo_url $argv[1]

    # Extract username and repo name from the URL
    set -l repo_path (echo $repo_url | sed -E 's/.*github\.com[:/]([^/]+\/[^/]+)(\.git)?$/\1/')

    # Construct the SSH URL
    set -l ssh_url "git@github.com:$repo_path.git"

    # Remove existing origin
    git remote remove origin

    # Add new origin with SSH URL
    git remote add origin $ssh_url

    echo "Remote origin set to: $ssh_url"
end

function deleteNodeModules
    find . -type d -name node_modules -prune -print | xargs rm -rf
end

function find.EnvFiles
    for env_file in (find . -type d -name node_modules -prune -o -type f -name ".env" -print)
        bat $env_file
    end
end

function f
    if not set -q argv[1]
        flox init
    else
        flox search $argv
    end
end

function fi
    if not set -q argv[1]
        # flox init TODO:
    else
        flox install $argv
    end
end


function fs
    if not set -q argv[1]
        # flox TODO:
    else
        flox search $argv
    end
end

function fsa
    if not set -q argv[1]
        # flox TODO:
    else
        flox search $argv --all
    end
end

function w.
    cursor .env
end
