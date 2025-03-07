alias cwd='pwd | pbcopy'
alias js="just s" # TODO: do with watch like bun --watch
alias a="eza -I 'license'" # list files (without license)
alias af="type" # <cmd> - view definition of <cmd>
alias dF="cd ~/src/pause && eza"
alias gl="git pull"
alias rr="rm -rf"
alias wr="cursor readme.md"
alias da="cd ~/src && eza"
alias dj="cd ~/src/ts && eza"
alias ds="cd ~/test && eza"
alias pip="pip3"
alias dsr="cd ~/test/react && eza"
alias dv="cd ~/src/nikiv.dev && eza"
alias dn="cd ~/src/py && eza"
alias dm="cd ~/src/go && eza"
alias dl="cd ~/src/org/la/la && eza"
alias dL="cd ~/src/org/la/x && eza"
alias dz="cd ~/tmp && eza"
alias dr="cd ~/try && eza"
alias dw="cd ~/x && eza"
alias de="cd ~/new && eza"
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
alias npm="bun"
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
    bunx prettier --write "**/*.{js,json,css,tsx,ts}"
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

# full `bun i` reset
function :d
    find . -type d -name node_modules -prune -print | xargs rm -rf
    test -f bun.lock && rm bun.lock
    test -f bun.lockb && rm bun.lockb
    bun i
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
        python3
    else
        uv run -m $argv
    end
end


function nw
    if test -z "$argv[1]"
        echo "Usage: nw <script_name>"
        return 1
    end
    watchexec --no-vcs-ignore --restart --exts py --clear --project-origin . "tput reset && uv run -m scripts.$argv"
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
    # set run_file (fd -t f -p "scripts/run.ts" | head -n 1)
    # if test -n "$run_file"
    #     cursor "$run_file"
    # end
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
# function e
#     if not set -q argv[1]
#         code2prompt .
#     else
#         code2prompt $argv
#     end
# end

# function c
#     if not set -q argv[1]
#     else
#         bat $argv
#     end
# end

function e
    if not set -q argv[1]
        pwd | pbcopy $argv
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

function d
    if not set -q argv[1]
        cd
    else
        if cd $argv 2>/dev/null
            eza
        else
            z $argv
            if test $status -eq 0
                eza
            else
                return 1
            end
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

# TODO: move
# function s
#     if not set -q argv[1]
#     else
#         watchexec --no-vcs-ignore --restart --exts swift --clear --project-origin . "tput reset && swift $argv"
#     end
# end

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
function `
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
        just run
    else
        just $argv
    end
end

function co
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
    cd ~/rust && eza
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
    find . -type f -name "LICENSE" -not -path "*/node_modules/*" -exec sh -c '
        tmp="$1.tmp"
        mv "$1" "$tmp" && mv "$tmp" "$(dirname "$1")/license"
    ' _ {} \;
    find . -type f -name "CHANGELOG.md" -not -path "*/node_modules/*" -exec sh -c '
        tmp="$1.tmp"
        mv "$1" "$tmp" && mv "$tmp" "$(dirname "$1")/changelog.md"
    ' _ {} \;
    find . -type f -name "CODE_OF_CONDUCT.md" -not -path "*/node_modules/*" -exec sh -c '
        tmp="$1.tmp"
        mv "$1" "$tmp" && mv "$tmp" "$(dirname "$1")/code-of-conduct.md"
    ' _ {} \;
    find . -type f -name "CONTRIBUTING.md" -not -path "*/node_modules/*" -exec sh -c '
        tmp="$1.tmp"
        mv "$1" "$tmp" && mv "$tmp" "$(dirname "$1")/contributing.md"
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

# git sync
function gsync
    # Save current branch to return to it later
    set current_branch (git rev-parse --abbrev-ref HEAD)

    # Make sure we have upstream set
    if not git remote | grep -q upstream
        echo "No upstream remote found. Please add it first with:"
        echo "git remote add upstream git@github.com:original-owner/repository.git"
        return 1
    end

    # Fetch all from upstream
    echo "Fetching all branches from upstream..."
    git fetch upstream --prune

    # Get list of all upstream branches
    set upstream_branches (git branch -r | grep upstream/ | grep -v HEAD | sed 's/  upstream\///')

    echo "Syncing branches from upstream..."

    # For each upstream branch
    for branch in $upstream_branches
        # Skip if it's the same as our local test branch
        if test "$branch" = "test"
            echo "Skipping 'test' branch as you have a local branch with this name"
            continue
        end

        # Check if we already have this branch locally
        if git show-ref --verify --quiet refs/heads/$branch
            # Branch exists, update it
            echo "Updating existing branch: $branch"
            git checkout $branch
            git merge upstream/$branch
        else
            # Branch doesn't exist, create it
            echo "Creating new branch: $branch"
            git checkout -b $branch upstream/$branch
        end
    end

    # Return to the original branch
    echo "Returning to '$current_branch' branch"
    git checkout $current_branch

    echo "All branches have been synced with upstream"
end

function gsyncMain
    # Save current branch to return to it later
    set current_branch (git rev-parse --abbrev-ref HEAD)

    # Make sure we have upstream set
    if not git remote | grep -q upstream
        echo "No upstream remote found. Please add it first with:"
        echo "git remote add upstream git@github.com:original-owner/repository.git"
        return 1
    end

    # Fetch all from upstream
    echo "Fetching from upstream..."
    git fetch upstream --prune

    # Check if main branch exists locally
    if git show-ref --verify --quiet refs/heads/main
        # Branch exists, update it
        echo "Updating main branch"
        git checkout main
        git merge upstream/main
    else
        # Branch doesn't exist, create it
        echo "Creating main branch"
        git checkout -b main upstream/main
    end

    # Return to the original branch
    echo "Returning to '$current_branch' branch"
    git checkout $current_branch

    echo "Main branch has been synced with upstream"
end


# used as catch all for fast scripts
function ,
    for dir in *=*
        set newdir (string replace --all "=" "__" "$dir")
        mv "$dir" "$newdir"
    end
end


function triggerBuildWithNoCommit
    set current_branch (git rev-parse --abbrev-ref HEAD)

    # Validate git state
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not in a git repository"; return 1
    end
    if not git diff --quiet HEAD
        echo "Error: Working directory not clean"; return 1
    end

    # Push empty commit
    git commit --allow-empty -m "temp: trigger build"
    if not git push origin $current_branch
        git reset HEAD~1; return 1
    end

    # Cleanup immediately
    git reset HEAD~1
    git push --force origin $current_branch || begin
        echo "Error: Failed to cleanup. Run: git reset HEAD~1 && git push --force"
        return 1
    end

    echo "✓ Build triggered"
end


function sf
    if test -z "$argv[1]"
        echo "Usage: sf <url>"
        return 1
    end

    # Extract domain from URL (remove protocol if present and path)
    set domain (echo $argv[1] | sed -E 's|^https?://||' | cut -d'/' -f1)
    # Create filename from domain
    set filename "$HOME/sites/$domain.txt"

    # Check if URL already starts with http(s)://
    if string match -q 'http*://*' $argv[1]
        sitefetch "$argv[1]" -o $filename
    else
        sitefetch "https://$argv[1]" -o $filename
    end

    # Copy content to clipboard
    cat $filename | pbcopy
    echo "Saved to $filename (content copied to clipboard)"
end

function s
    if test -z "$argv[1]"
        echo "Usage: sf <url>"
        return 1
    end

    # Extract domain and path from URL
    set url (echo $argv[1] | sed -E 's|^https?://||')
    set domain (echo $url | cut -d'/' -f1)
    set path (echo $url | grep -o '/.*$' || echo '/')

    # Create filename from domain
    set filename "$HOME/sites/$domain.txt"

    # Build the sitefetch command with exact path matching
    if string match -q 'http*://*' $argv[1]
        sitefetch "$argv[1]" -o $filename -m "$path"
    else
        sitefetch "https://$argv[1]" -o $filename -m "$path"
    end

    # Copy content to clipboard
    cat $filename | pbcopy
    echo "Saved to $filename (content copied to clipboard)"
end


function killPort
    if test -z "$argv[1]"
        echo "Usage: killPort <port_number>"
        return 1
    end

    set port_processes (lsof -ti:$argv[1])
    if test -z "$port_processes"
        echo "No processes found on port $argv[1]"
        return 0
    end

    kill $port_processes
    echo "Killed process(es) on port $argv[1]"
end


function portCheck
    if test -z "$argv[1]"
        echo "Usage: portCheck <port_number>"
        return 1
    end
    lsof -i :$argv[1]
end

# TODO: find how to do smth like `tree-layout | tee /dev/tty | pbcopy` but preserve colors
# print folder/file layout deeply + copy to clipboard
function t
    tree-layout
    tree-layout | pbcopy
end

function T
    set current_path (string replace -r "^$HOME" "~" (pwd))
    echo $current_path
    tree-layout
    begin
        echo $current_path
        tree-layout
    end | pbcopy
end


function :b
    bun run build
end

# function c
#     set -l last_output (eval "echo (history --max=1)")
#     if test -n "$last_output"
#         echo "$last_output" | pbcopy
#         echo "Last command output copied to clipboard"
#     else
#         echo "No output from last command to copy"
#     end
# end

# copy last command output to clipboard (including the command that was executed)
function .
    # Get the last command from history
    set -l last_cmd (history --max=1)
    # For display purposes, try to get a clean name
    set -l cmd_name (string split ' ' $last_cmd)[1]
    set -l display_cmd $last_cmd
    # If the command is an alias or function, try to display a nicer version
    if functions -q $cmd_name
        # Look for the first line with actual command execution
        set -l actual_cmd (functions $cmd_name | grep -E '^\s+\w+' | head -n1 | string trim)
        if test -n "$actual_cmd"
            # Get just the command without the $argv
            set display_cmd (string replace -r '\s+\$argv.*$' '' $actual_cmd)
            # Add any arguments
            set -l args (string split ' ' $last_cmd | tail -n +2 | string join ' ')
            if test -n "$args"
                set display_cmd "$display_cmd $args"
            end
        end
    end

    # useful addition my personal use (not to confuse llms)
    # hard-code replacement of eza -I 'license' with ls
    set display_cmd (string replace "eza -I 'license'" "ls" $display_cmd)
    set display_cmd (string replace "eza -la" "ls -la" $display_cmd)

    # Create a temporary file to store command output
    set -l temp_file (mktemp)
    # Add the command line with $ prefix
    echo "\$ $display_cmd" >$temp_file
    # Re-run the last command and capture output
    eval $last_cmd >>$temp_file 2>&1
    # Copy to clipboard
    cat $temp_file | pbcopy
    # Clean up
    rm $temp_file
end

# symlink a file to ~/bin with a specified name
function b
    # Check if exactly two arguments are provided
    if test (count $argv) -ne 2
        echo "Usage: bin <source_file> <target_name>"
        echo "Example: bin dist/cli.js sitefetch"
        return 1
    end

    set -l source_file $argv[1]
    set -l target_name $argv[2]
    set -l bin_dir "$HOME/bin"

    # Ensure the source file exists
    if not test -f $source_file
        echo "Error: Source file '$source_file' does not exist"
        return 1
    end

    # Make the source file executable
    chmod +x $source_file
    if test $status -ne 0
        echo "Error: Failed to make '$source_file' executable"
        return 1
    end

    # Create ~/bin if it doesn't exist
    if not test -d $bin_dir
        mkdir -p $bin_dir
        if test $status -ne 0
            echo "Error: Failed to create '$bin_dir'"
            return 1
        end
    end

    # Ensure ~/bin is in PATH
    if not contains $bin_dir $PATH
        set -U fish_user_paths $bin_dir $fish_user_paths
        echo "Added '$bin_dir' to PATH"
    end

    # Resolve the absolute path of the source file
    set -l abs_source (realpath $source_file)
    if test $status -ne 0
        echo "Error: Failed to resolve absolute path of '$source_file'"
        return 1
    end

    # Create or update the symlink
    set -l target_path "$bin_dir/$target_name"
    if test -e $target_path
        echo "Removing existing '$target_path'"
        rm $target_path
        if test $status -ne 0
            echo "Error: Failed to remove existing '$target_path'"
            return 1
        end
    end

    ln -s $abs_source $target_path
    if test $status -eq 0
        echo "Symlinked '$abs_source' to '$target_path'"
    else
        echo "Error: Failed to create symlink"
        return 1
    end
end
