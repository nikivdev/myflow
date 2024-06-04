# from https://gist.github.com/nikoheikkila/dd4357a178c8679411566ba2ca280fcc
function envsource
    for line in (cat $argv | grep -v '^#' | grep -v '^\s*$')
        set item (string split -m 1 '=' $line)
        set -gx $item[1] $item[2]
        echo "Exported key $item[1]"
    end
end

# af <cmd> - view definition of <cmd>
function af
    type $argv
end

function o
    ollama run llama3:8b-instruct-q5_K_M "$argv"
end

# TODO: breaks down, move to https://github.com/sobelio/llm-chain or update the code
function os
    set max_attempts 3
    set attempt 1
    set command_failed true
    set output ""
    set error_output ""

    while test $attempt -le $max_attempts
        set command (ollama run llama3:8b-instruct-q5_K_M "return with the command I can enter in my terminal for this task: $argv. Just the command, so it runs. If you are uncertain, reply `false`")

        if test "$command" = false
            if test $attempt -eq $max_attempts
                echo "Command could not be determined."
            end
            return 1
        end

        # Attempt to run the command, capturing stdout and stderr
        set output (eval $command 2>&1 | tee /dev/stderr)

        # Check if the command was successful
        if test $status -eq 0
            set command_failed false
            echo $output
            break
        else
            set error_output $output
            set attempt (math $attempt + 1)
        end
    end

    if test $command_failed = true
        echo $error_output
        echo "Failed to execute command after $max_attempts attempts."
    end
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

function we
    if not set -q argv[1]
        zed .
    else
        zed $argv
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
        # TODO: test below, supposedly it's better and safer (per https://matrix.to/#/!YLTeaulxSDauOOxBoR:matrix.org/$mM0QC4VSo5BmI1o3qfKg5vjDs6sok1FwBtKy2UlI4Xs?via=gitter.im&via=matrix.org&via=tchncs.de)
        # cargo watch -q -- sh -c 'tput reset && cargo run -q -- "$@"' watchscript $argv
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
    set commit_hash (string split ":" $argv)[1]m i
    set branch_name (string split ":" $argv)[2]
    git push origin $commit_hash:$branch_name --force
end

# p - pnpm i
# p <dep> - pnpm i <dep>
function p
    if not set -q argv[1]
        pnpm i
    else
        pnpm i $argv
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
# function :i
#     if not set -q argv[1]
#         bun i
#     else
#         bun add $argv
#     end
# end

function :i
    if not set -q argv[1]
        bun i
    else
        bun i $argv
    end
end

# pw <package.json command> - rerun command if .ts files change
# function pw
#     watchexec --no-vcs-ignore --restart --exts ts "tput reset && pnpm --silent run $argv" --project-origin .
# end

function goGetLatestPackage
    go get -u $argv@latest
end

function ios
    yarn ios
end

function iosCleanBuild
    expo prebuild --clean --ios
end

function .
    if not set -q argv[1]
        open .
    else
        # copy output to clipboard
        set -l output (eval $argv)
        echo $output | pbcopy
    end
end

# TODO:
# function :r
#     if not set -q argv[1]
#         # TODO: list all packages installed with bunx with fzf (top result is most recently ran bunx <package>)
#     else
#         bunx $argv
#     end
# end


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

function findFolder
    find . -type d -name $argv[1] -prune
end

function deleteNodeModules
    find . -type d -name node_modules -prune -print | xargs rm -rf
end

function revertLastCommitAndPushForce
    git reset --hard HEAD~1
    git push origin HEAD --force
end

function killPort
    lsof -ti:$argv | xargs kill
end

function gitRemoteAddOriginWhileRemovingOldOne
    if test (count $argv) -lt 1
        echo "Usage: gitRemoteAddOriginWhileRemovingOldOne <new-origin-url>"
        return 1
    end

    set -l new_origin_url $argv[1]

    # Check if the 'origin' remote exists
    if git remote show | grep -q "^origin\$"
        # Remove the existing 'origin' remote
        git remote remove origin
    end

    # Add the new 'origin' remote
    git remote add origin $new_origin_url
    echo "Remote 'origin' set to $new_origin_url"
end

function fileToClipboard
    osascript \
        -e 'on run args' \
        -e 'set the clipboard to POSIX file (first item of args)' \
        -e end \
        $argv
end

# TODO: fix https://github.com/chand1012/git2gpt/issues/7
function turnCurrentFolderIntoZipForGpt
    git ls-files | zip ~/do/repo.zip -@; and fileToClipboard ~/do/repo.zip
    # rm -rf ~/do/repo.zip
end

# run rust with watch, log output/errors to log file
function :r
    env CARGO_TERM_COLOR=always cargo watch -q -- sh -c "tput reset && cargo run -q" 2>&1 | tee ~/log/cmd.log
end

function prettierAll
    npx prettier --write "**/*.{js,json,css,tsx,ts}"
end

function deleteAllGitFoldersRecursivelyExceptRootOne
    find . -type d -name ".git" -not -path "./.git" -exec rm -rf {} +
end

function :u
    bun update --latest
end
