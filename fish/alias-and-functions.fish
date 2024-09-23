alias cwd='pwd | pbcopy'
alias dc="cd ~/clones" # wrapping over dc existing cmd
alias nb="nix-build"
alias d="cd" # TODO: move to https://github.com/ClementNerma/Jumpy/issues/5
alias a="eza" # list files
alias af="type" # <cmd> - view definition of <cmd>
alias do="cd ~/src/org"
alias gl="git pull"
alias rr="rm -rf"
alias wr="cursor readme.md"
alias df="cd ~/src/config"
alias da="cd ~/src"
alias dj="cd ~/src/ts"
alias dt="cd ~/src/test"
alias dtr="cd ~/src/test/react"
alias dk="cd ~/src/nikiv.dev"
alias dK="cd ~/src/nikiv.dev/private"
alias dl="cd ~/src/org/learn-anything"
alias dL="cd ~/src/org/learn-anything/private"
alias dm="cd ~/tmp"
alias ds="cd ~/try"
alias dp="cd ~/past"
alias dd="cd ~/data"
alias aa="eza -la" # list files (with hidden)
alias r="ronin"
alias v="mv" # move files/folders or rename
alias p="pip3"
alias pr="gh pr checkout"

function run_ts_script
    set script_name $argv[1]
    set script_path ~/src/ts/scripts/$script_name.ts

    if test -f $script_path
        set -e argv[1]
        bun $script_path $argv
    else
        echo "Script not found: $script_path"
        return 1
    end
end
for script in ~/src/ts/scripts/*.ts
    set script_name (basename $script .ts)
    alias $script_name "run_ts_script $script_name"
end

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

# TODO: add nice
# function en
#     if not set -q argv[1]
#         encore run
#     else
#         encore $argv
#     end
# end

function i
    if not set -q argv[1]
        bun i
    else
        bun i $argv
    end
end

function ::
    if not set -q argv[1]
        deno repl # TODO: change
    else
        deno $argv
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

# tunnels local telegram mini app (usually on port 5173 with the `tma.internal` domain)
function ngTelegram
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

# find .env files
function f.
    for env_file in (find . -type d -name node_modules -prune -o -type f -name ".env" -print)
        bat $env_file
    end
end

function fg
    if not set -q argv[1]
        # cd ~/
        # flox list
    else
        # cd ~/
        # flox install $argv
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

function .
    if not set -q argv[1]
        open .
    else
        open $argv
    end
end

function md
    mkdir -p $argv[1] && cd $argv[1]
end

function :i
    if not set -q argv[1]
        bun i
    else
        bun i $argv
    end
end

function :id
    bun i -d $argv
end

function :g
    bun i -g $argv
end

# set env vars in current shell
function x
    if test (count $argv) -eq 1
        set -x $argv[1]
    else if test (count $argv) -ge 2
        set -x $argv[1] $argv[2..-1]
    else
        echo "Usage: x VARIABLE [VALUE]"
        return 1
    end
end

# nix eval file (with watch)
function ne
    if test -z "$argv[1]"
        echo "Usage: ne <nix_file>"
        return 1
    end
    set -l file $argv[1]
    watchexec --no-vcs-ignore --restart --exts nix --clear --project-origin . "tput reset && nix-instantiate --eval --strict --json $file | jq"
end

# unstable, but does work for https://github.com/nikitavoloboev/cpp
function cpp
    watchexec --no-vcs-ignore --restart --exts cpp --clear --project-origin . "tput reset && make -C build && src/main"
end

function nv
    if not set -q argv[1]
        nvim .
    else
        nvim $argv
    end
end

function gh
    git fetch --unshallow
    juxta .
end

function g
    if not set -q argv[1]
        smerge .
    else
        git $argv
    end
end

# r - run `cargo run` when rust files change
function r
    if not set -q argv[1]
        cargo watch -q -- sh -c "tput reset && cargo run -q"
    else
        cargo watch -q -- sh -c "tput reset && cargo run -q -- $argv"
        # TODO: test below, supposedly it's better and safer (per https://matrix.to/#/!YLTeaulxSDauOOxBoR:matrix.org/$mM0QC4VSo5BmI1o3qfKg5vjDs6sok1FwBtKy2UlI4Xs?via=gitter.im&via=matrix.org&via=tchncs.de)
        # cargo watch -q -- sh -c 'tput reset && cargo run -q -- "$@"' watchscript $argv
    end
end

function :c
    if not set -q argv[1]
        set cli_file (fd -t f -p "cli.ts" | head -n 1)
        if test -n "$cli_file"
            cursor "$cli_file"
            bun cli
        else
            # TODO:
            # bun cli
        end
    else
        # TODO:
    end
end

function :r
    if not set -q argv[1]
        set run_file (fd -t f -p "run.ts" | head -n 1)
        if test -n "$run_file"
            cursor "$run_file"
            bun run ts
        else
            # TODO:
        end
    else
        # TODO:
    end
end

function find.git
    find . -type d -name ".git"
end

function find.DS_Store
    find . -type f -name ".DS_Store"
end


function o
    if not set -q argv[1]
        go run .
    else
        go $argv
    end
end


# oi = go install ..
function oi
    if not set -q argv[1]
        echo "Usage: oi <github-user/repo>"
        return 1
    else
        # TODO: turn this into ts script
        # example cmd: go install github.com/no-src/gofs/...@latest
        go install github.com/$argv[1]/...@latest
    end
end

function re
    if not set -q argv[1]
        repopack .
    else
        repopack $argv
    end
end

function fs
    flox activate -s
end

function fsl
   flox services logs --follow
end

function fsr
   flox services restart
end


function e
    if not set -q argv[1]
        code2prompt .
    else
        code2prompt $argv
    end
end

