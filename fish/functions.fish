# af <cmd> - view definition of <cmd>
function af
    type $argv
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
