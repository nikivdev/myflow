alias cwd='pwd | pbcopy'
alias dc="cd ~/clones" # wrapping over dc existing cmd
alias dr="cd ~/forks"
alias a="eza -I 'license'" # list files (without license)
alias af="type" # <cmd> - view definition of <cmd>
alias df="cd ~/src/do && eza"
alias dF="cd ~/src/pause && eza"
alias gl="git pull"
alias rr="rm -rf"
alias wr="cursor readme.md"
alias da="cd ~/src && eza"
alias dj="cd ~/src/ts && eza"
alias de="cd ~/src/test && eza"
alias der="cd ~/src/test/react && eza"
alias dk="cd ~/src/nikiv.dev && eza"
alias dK="cd ~/src/nikiv.dev/private && eza"
alias dl="cd ~/src/do/learn-anything && eza"
alias dL="cd ~/src/do/learn-anything/private && eza"
alias dz="cd ~/tmp && eza"
alias ds="cd ~/try && eza"
alias dw="cd ~/src/new && eza"
alias dq="cd ~/Documents && eza"
alias dp="cd ~/past && eza"
alias dP="cd ~/past/private && eza"
alias dd="cd ~/data && eza"
alias dD="cd ~/data/private && eza"
alias dv="cd ~/downloads && eza"
alias dt="cd ~/desktop && eza"
alias do="cd ~/src/org && eza"
alias aa="eza -la" # list files (with hidden)
alias r="ronin"
alias v="mv" # move files/folders or rename
# alias df="cd ~/src/config"
# alias p="python3"
alias pr="gh pr checkout"
alias nb="nix-build"

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

function :p
    bun dev --port $argv
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

# function .
#     if not set -q argv[1]
#         # TODO:
#     else
#         python3 $argv
#     end
# end

function f
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

# TODO: change
# function gh
#     git fetch --unshallow
#     juxta .
# end

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

# R - run tests with cargo and watch
function R
    if not set -q argv[1]
        cargo watch -q -- sh -c "tput reset && cargo test -q --lib"
    else
        cargo watch -q -- sh -c "tput reset && cargo test -q --lib -- $argv --nocapture"
        # TODO: prob move it to separate cmd as there is use case of running specific test and not see logs as is usual
        # cargo watch -q -- sh -c "tput reset && cargo test -q --lib -- $argv"
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

function :s
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

function :u
    bun update --latest
end

function fsl
   flox services logs --follow
end

function fsr
   flox services restart
end


# TODO: replace with own tool
function e
    if not set -q argv[1]
        code2prompt .
    else
        code2prompt $argv
    end
end

function c
    if not set -q argv[1]
    else
        bat $argv
    end
end

function changeRemoteToFork
    set -l repo_url $argv[1]

    # Extract the repo name from the URL
    set -l repo_name (string split '/' $repo_url | tail -n 1)

    # Set the GitHub username directly in the function
    set -l github_username "nikitavoloboev"

    # Construct the new URL
    set -l new_url "https://github.com/$github_username/$repo_name"

    # Change the remote URL
    git remote set-url origin $new_url

    if test $status -eq 0
        echo "Remote URL changed successfully to: $new_url"
        echo "Current remotes:"
        git remote -v
    else
        echo "Error: Failed to change remote URL"
    end
end

# TODO: move to https://github.com/ClementNerma/Jumpy/issues/5
function d
    if not set -q argv[1]
        cd
    else
        if cd $argv
            eza
        else
            # cd failed, so we don't run eza
            return 1
        end
    end
end

function :w
   bun --watch $argv
end

function ..
    cd ..
    eza
end

function l
    ollama $argv
end


function p
    if not set -q argv[1]
        pnpm i
    else
        pnpm add $argv
    end
end

function s
    if not set -q argv[1]
    else
        watchexec --no-vcs-ignore --restart --exts swift --clear --project-origin . "tput reset && swift $argv"
    end
end

function :e
    bunx $argv
end

function :ts
    bun --watch ~/src/ts/lib/ts-utils/scripts/run.ts
end

function :r
    bun --watch ~/src/test/ts/scripts/run.ts
end

# TODO: make into proper tool with completions etc.
# TODO: do I miss anything by taking over `.` builtin?
function .
    bun ~/src/ts/scripts/new.ts $argv
    eza
    # TODO: only do it if its folder, the script should return something in that case, check for the return
    cd $argv
end

function gitRemoteOpen
    git remote get-url origin | sed -e 's/git@github.com:/https:\/\/github.com\//' | xargs open
end

function gitChangeRemote
    if not set -q argv[1]
        echo "Please provide a new repository URL"
        return 1
    end

    # Extract username and repo name from the URL
    set -l repo_path (echo $argv[1] | sed -E 's/.*github\.com[:/]([^/]+\/[^/]+)(\.git)?$/\1/')

    # Construct the SSH URL
    set -l ssh_url "git@github.com:$repo_path.git"

    git remote remove origin
    git remote add origin $ssh_url

    echo "Remote origin set to: $ssh_url"
end
