alias d="z"
alias da="cd ~/src"
alias a="eza" # list files
alias af="type" # <cmd> - view definition of <cmd>

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

