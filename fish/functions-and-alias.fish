# af <cmd> - view definition of <cmd>
function af
    type $argv
end

function la
    command la # overwrite `la` fish builtin function
end

# w - open current path in VSCode
# w <path> - open path in VSCode
#function w
#    if not set -q argv[1]
#        code-insiders .
#    else
#        code-insiders $argv
#    end
#end

# TODO: make completions for `: ` so it gets the scripts found in package.json
# below is maybe hacky way to do it but it has to by dynamic
function :
    if not set -q argv[1]
        bun dev
    else
        bun $argv
    end
end

# function generate_completions_for_colon_function
#     for script in (jq -r '.scripts | keys[]' package.json)
#         complete -c : -a "$script"
#     end
# end
# generate_completions_for_colon_function

# autocomplete from `package.json scripts` as you type with fzf matching
function ::
    set selected_script (jq -r '.scripts | to_entries | .[] | .key + " " + .value' package.json | fzf | awk '{print $1}')
    if test -n "$selected_script"
        bun run $selected_script
    end
end

bind \cg ::

function copyfile
    cat $argv | pbcopy
end

# function W
#     if not set -q argv[1]
#         zed .
#     else
#         zed $argv
#     end
# end

function w
    if not set -q argv[1]
        cursor-nightly .
    else
        cursor-nightly $argv
    end
end

function W
    if not set -q argv[1]
        cursor .
    else
        cursor $argv
    end
end

# TODO: pass arg for extension, and also the command to rerun
# for now `js` is hardcoded
#function W
#    watchexec --no-vcs-ignore --restart --exts js "tput reset && $argv" --project-origin .
#end

function :w
    if not set -q argv[1]
        # TODO: replace with own wrapper that will watch for any `.ts` file in current dir (recursive). if file found, run it with `bun --watch <file-path>`
        bun --watch
    else
        bun --watch $argv
    end
end

# function wb
#     watchexec --no-vcs-ignore --restart --exts ts "tput reset && bun run $argv" --project-origin .
# end

function wbi
    watchexec --no-vcs-ignore --restart --exts ts "tput reset && bun run index.ts" --project-origin .
end

function wbk
    watchexec --no-vcs-ignore --restart --exts ts "tput reset && bun run ../bin/$argv" --project-origin .
end

function wt
    watchexec --no-vcs-ignore --restart --exts ts "tput reset && tsx $argv" --project-origin .
end

function wd
    watchexec --no-vcs-ignore --restart --exts ts "tput reset && deno run $argv" --project-origin .
end

# function wn
#     watchexec --restart --exts ts "tput reset && node $argv" --project-origin .
# end

function wn
    watchexec --no-vcs-ignore --restart --exts ts "tput reset && tsx $argv" --project-origin .
end

function wg
    watchexec --no-vcs-ignore --restart --exts go "tput reset && go run $argv" --project-origin .
end

function gg
    if not set -q argv[1]
        go mod tidy
    else
        go get -u $argv
    end
end

function g
    if not set -q argv[1]
        watchexec --no-vcs-ignore --restart --exts go "tput reset && go run ."
    else
        go $argv
    end
end

function G
    if not set -q argv[1]
        watchexec --no-vcs-ignore --restart --exts go "tput reset && go test"
    else
        watchexec --no-vcs-ignore --restart --exts go "tput reset && go test -run $argv"
    end
end

# r - run `cargo run` when rust files change
function r
    if not set -q argv[1]
        cargo watch -q -- sh -c "tput reset && cargo run -q"
    else
        cargo watch -q -- sh -c "tput reset && cargo run -q -- $argv"
    end
end

# rb - put rust binary into PATH in debug
function rb
    set current_folder (basename (pwd))
    cargo build
    if test $status -eq 0
        mv target/debug/$current_folder ~/src/config/bin
    end
end

# R <cmd> - cargo <cmd>
function R
    cargo $argv
end

# TODO: it skips doing doc-tests, have another function for it?
# rt - `cargo test` on rust file changes
function rt
    if not set -q argv[1]
        cargo watch -q -- sh -c "tput reset && cargo test -q --lib"
    else
        # cargo $argv
    end
end

# forceRemoteGitBranchToBeThisCommit <commit-hash>:<branch-name>
function forceRemoteGitBranchToBeThisCommit
    set commit_hash (string split ":" $argv)[1]
    set branch_name (string split ":" $argv)[2]
    git push origin $commit_hash:$branch_name --force
end

# p - pnpm install dependencies
# p <cmd> - pnpm <cmd>
function p
    if not set -q argv[1]
        pnpm i
    else
        pnpm add $argv
    end
end

# R <flags or things to pass to CLI>
function R
    cargo watch -q -x "run -q -- $argv"
end

# ga. - commit all with `.` as message
function g.
    git add .
    git commit -m "."
    git push
end

function gitCheckoutRemote
    git fetch origin
    git checkout -b $argv[1] origin/$argv[1]
end

# gi - go get package
# `go get -u github.com/spf13/cobra@latest
# function gi
#     go get -u github.com/leaanthony/clir@latest
# end

# envsource - source .env files (https://gist.github.com/nikoheikkila/dd4357a178c8679411566ba2ca280fcc)
function envsource
    for line in (cat $argv | grep -v '^#')
        set item (string split -m 1 '=' $line)
        set -gx $item[1] $item[2]
        echo "Exported key $item[1]"
    end
end

# :i = bun i
# :i <package> = bun add <package>
function :i
    if not set -q argv[1]
        bun i
    else
        bun add $argv
    end
end

# pw <package.json command> - rerun command if .ts files change
function pw
    watchexec --no-vcs-ignore --restart --exts ts "tput reset && pnpm --silent run $argv" --project-origin .
end

function goGetLatestPackage
    go get -u $argv@latest
end

# Aliases
# cd places
alias d="cd"
alias da="cd ~/src"
alias dg="cd ~/src/config"
alias de="cd ~/Desktop"
alias ds="cd ~/try"
alias dv="cd ~/try/private"
alias dt="cd ~/data"
alias dw="cd ~/data/wiki"
alias d.="cd ~/.scripts"

# rust
# alias rbnowarning="RUSTFLAGS="-A warnings" cargo build"

# run code fast
alias :ts="fish -c 'cd ~/src/ts; bun dev'"

# other
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
alias .="open ."
alias :g="bun install -g"
alias nv="sudo nvim"

function :r
    if not set -q argv[1]
        # TODO: list all packages installed with bunx with fzf (top result is most recently ran bunx <package>)
    else
        bunx $argv
    end
end


function deleteGitLocalAndRemoteBranch
    set -l branch_name $argv[1]

    if test -z "$branch_name"
        echo "Please provide a branch name."
        return 1
    end

    # Delete local branch
    git branch -D $branch_name
    echo "Deleted local branch: $branch_name"

    # Delete remote branch
    git push origin --delete $branch_name
    echo "Deleted remote branch: $branch_name"
end

# TODO: not sure how useful
# function runPrettierOnAllGitFiles
#     git ls-files | grep -E '\.(js|css|html|ts|tsx)$' | xargs prettier --write
# end
