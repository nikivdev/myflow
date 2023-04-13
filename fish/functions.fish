# af <cmd> - view definition of <cmd>
function af
    type $argv
end

function la
    command la # overwrite `la` fish builtin function
end

# w - open current path in VSCode
# w <path> - open path in VSCode
function w
    if not set -q argv[1]
        code-insiders .
    else
        code-insiders $argv
    end
end

# TODO: pass arg for extension, and also the command to rerun
# for now `js` is hardcoded
function W
    watchexec --restart --exts js "tput reset && $argv" --project-origin .
end

function wb
    watchexec --restart --exts ts "tput reset && bun run $argv" --project-origin .
end

function wbi
    watchexec --restart --exts ts "tput reset && bun run index.ts" --project-origin .
end

function wbk
    watchexec --restart --exts ts "tput reset && bun run ../bin/$argv" --project-origin .
end

function wd
    watchexec --restart --exts ts "tput reset && deno run $argv" --project-origin .
end

function wn
    watchexec --restart --exts ts "tput reset && node $argv" --project-origin .
end

function wgm
    watchexec --restart --exts go "tput reset && go run $argv" --project-origin .
end

function wgm
    watchexec --restart --exts go "tput reset && go run main.go" --project-origin .
end

# r - run `cargo run` when rust files change
# r <cmd> - cargo <cmd>
function r
    if not set -q argv[1]
        cargo watch -q -x "run -q"
    else
        cargo $argv
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

# gi - go get package
# `go get -u github.com/spf13/cobra@latest
# function gi
#     go get -u github.com/leaanthony/clir@latest
# end

# source .env files (https://gist.github.com/nikoheikkila/dd4357a178c8679411566ba2ca280fcc)
function envsource
    for line in (cat $argv | grep -v '^#')
        set item (string split -m 1 '=' $line)
        set -gx $item[1] $item[2]
        echo "Exported key $item[1]"
    end
end
