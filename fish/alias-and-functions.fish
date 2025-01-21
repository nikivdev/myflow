alias sf="sitefetch"
alias cwd='pwd | pbcopy'
alias go="go1.24rc1"
alias a="eza -I 'license'" # list files (without license)
alias af="type" # <cmd> - view definition of <cmd>
alias dF="cd ~/src/pause && eza"
alias gl="git pull"
alias rr="rm -rf"
alias wr="cursor readme.md"
alias da="cd ~/src && eza"
alias dj="cd ~/src/ts && eza"
alias de="cd ~/test && eza"
alias pip="pip3"
alias der="cd ~/test/react && eza"
alias dv="cd ~/src/nikiv.dev && eza"
alias dk="cd ~/src/py && eza"
alias dl="cd ~/src/org/la/la && eza"
alias dL="cd ~/src/org/la/x && eza"
alias dz="cd ~/tmp && eza"
alias ds="cd ~/try && eza"
alias dw="cd ~/new && eza"
alias db="cd ~/src/base && eza"
alias dq="cd ~/Documents && eza"
alias dp="cd ~/past && eza"
alias dg="cd ~/src/other && eza"
alias dP="cd ~/past/private && eza"
alias dd="cd ~/data && eza"
alias dD="cd ~/data/private && eza"
alias dk="cd ~/src/org/solbond/solbond && eza"
alias dt="cd ~/desktop && eza"
alias df="cd ~/src/org && eza"
alias dv="cd ~/src/nikiv.dev && eza"
alias di="cd ~/clones && eza"
alias do="cd ~/forks && eza"
alias aa="eza -la" # list files (with hidden)
alias r="ronin"
alias v="mv" # move files/folders or rename
alias dc="cd ~/src/config && eza"
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

function ng
    ngrok http 3000
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
    # Remove existing origin if it exists
    git remote remove origin 2>/dev/null
    # Add new origin with SSH URL
    git remote add origin $ssh_url
    # Get current branch name
    set -l current_branch (git rev-parse --abbrev-ref HEAD)

    # Check if this is a new repository
    if test (git rev-parse HEAD 2>/dev/null)
        # If repository has commits, try to set upstream
        git push -u origin $current_branch
    else
        echo "New repository detected. Please make an initial commit first, then run:"
        echo "git push -u origin $current_branch"
    end

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

function n
    if not set -q argv[1]
        # TODO:
    else
        python3 $argv
    end
end

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

# run `cargo run` when rust files change | <query> - run with query
function i
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

# rs - run rust test code for quick edits
function rs
    cargo watch -q -- sh -c "tput reset && cargo test -q --lib -- run --nocapture"
end

# function :c
#     if not set -q argv[1]
#         set cli_file (fd -t f -p "cli.ts" | head -n 1)
#         if test -n "$cli_file"
#             cursor "$cli_file"
#             bun cli
#         else
#             # TODO:
#             # bun cli
#         end
#     else
#         # TODO:
#     end
# end

function :s
    set run_file (fd -t f -p "scripts/run.ts" | head -n 1)
    if test -n "$run_file"
        cursor "$run_file"
    end
    bun s
end

function :sr
    set run_file (find . -name "p-run.ts" -path "*/scripts/*" | head -n 1)
    if test -n "$run_file"
        cursor "$run_file"
    end
    bun sr
end

function find.git
    find . -type d -name ".git"
end

function find.DS_Store
    find . -type f -name ".DS_Store"
end


function m
    if not set -q argv[1]
        watchexec --no-vcs-ignore --restart --quiet --exts go --clear --project-origin . "go run ."
    else
        go $argv
    end
end


# oi = go install ..
function mi
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

function fa
    flox activate -s
end

function :u
    bun update --latest
end

function fl
   flox services logs --follow
end

function fr
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

# TODO: prob no need for this, can just get active path and pass it to bun --watch
# function :ws
#     if test -n "$argv[1]"
#         if test -f "$argv[1]"
#             bun --watch "$argv[1]"
#         else if test -f "scripts/$argv[1]"
#             bun --watch "scripts/$argv[1]"
#         else
#             echo "Could not find file: $argv[1] or scripts/$argv[1]"
#             return 1
#         end
#     else
#         bun --watch
#     end
# end

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
    bun --watch ~/test/ts/scripts/run.ts
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

function j
    if not set -q argv[1]
        cody --help
    else
        cody $argv
    end
end

function d:
    cd ~/src/swift && eza
end

function d.
    cd ~/x && eza
end

function k
    if not set -q argv[1]
        # TODO: what is equivalent to `bun dev` in uv
        # uv run main.py
        watchexec --no-vcs-ignore --restart --exts py --clear --project-origin . "tput reset && uv run main.py"
    else
        uv $argv
    end
end


# function dk
#     if not set -q argv[1]
#         # bunx drizzle-kit generate && bunx drizzle-kit migrate
#         bunx drizzle-kit generate
#     else
#         bunx drizzle-kit $argv
#     end
# end

function dkm
    if not set -q argv[1]
        bunx drizzle-kit migrate
    else
        bunx drizzle-kit $argv
    end
end

function .a
    set bike_file (find . -name "*.bike" | head -n 1)
    if test -n "$bike_file"
        open -a "Bike" "$bike_file"
    else
        pwd | pbcopy
        open -a "Bike"
        # TODO: maybe run KM macro and automate creating the file via the `new file` thing in bike
        # https://support.hogbaysoftware.com/t/why-is-it-when-i-create-a-bike-file-from-shell-it-will-show-extension-in-app/6020 due to this issue
    end
end

# TODO: not used until https://support.hogbaysoftware.com/t/why-is-it-when-i-create-a-bike-file-from-shell-it-will-show-extension-in-app/6020 is fixed
# function .a
#     set bike_file (find . -name "*.bike" | head -n 1)
#     if test -n "$bike_file"
#         open -a "Bike" "$bike_file"
#     else
#         set dir_name (basename (pwd))
#         set new_file "$dir_name.bike"
#         touch "$new_file"
#         open -a "Bike" "$new_file"
#     end
# end

function replace
    if test (count $argv) -ne 2
        echo "Usage: replace <from> <to>"
        echo "Example: replace '~' '~~'"
        return 1
    end

    for file in *
        set newname (string replace -a "$argv[1]" "$argv[2]" "$file")
        if test "$file" != "$newname"
            mv "$file" "$newname"
        end
    end
end


function :c
    find . -type d -name node_modules -prune -print | xargs rm -rf
    bun i
end

# clone using SSH URL format
function gc
    if not set -q argv[1]
        echo "Usage: gc <github-url>"
        return 1
    end
    # extract repo path from the URL
    set repo_path (string replace -r 'https://github.com/' '' $argv[1])
    # clone using SSH URL format
    git clone "git@github.com:$repo_path.git"
end

function repoCleanup
    find . -type f -name "README.md" -not -path "*/node_modules/*" -exec sh -c '
        tmp="$1.tmp"
        mv "$1" "$tmp" && mv "$tmp" "$(dirname "$1")/readme.md"
    ' _ {} \;
    find . -type f -name "CHANGELOG.md" -not -path "*/node_modules/*" -exec sh -c '
        tmp="$1.tmp"
        mv "$1" "$tmp" && mv "$tmp" "$(dirname "$1")/changelog.md"
    ' _ {} \;
end

# sync local .git folder with remote repo
function gs
    set current_folder (basename $PWD)
    if string match -rq '(.+)--(.+)' $current_folder
        set -l original_author (string match -r '(.+)--(.+)' $current_folder)[2]
        set -l repo_name (string match -r '(.+)--(.+)' $current_folder)[3]
        gh repo sync "nikitavoloboev/$repo_name" --source "git@github.com:$original_author/$repo_name"
        git pull
    else
        echo "Error: Could not parse repository info from directory name"
        echo "Directory should be in format: author--repo"
        return 1
    end
end

# used as catch all for fast scripts
function ,
    for dir in *=*
        set newdir (string replace --all "=" "__" "$dir")
        mv "$dir" "$newdir"
    end
end
