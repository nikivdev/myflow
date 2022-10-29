# af <cmd> - view definition of <cmd>
function af
    type $argv
end

# w - open current path in VSCode
# w <path> - open path in VSCode
function w
    if not count $argv
        code-insiders .
    else
        code-insiders $argv
    end
end
