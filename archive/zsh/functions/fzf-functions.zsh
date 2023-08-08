# mage commands to run
ff() {
  if [ $# -eq 0 ]; then
    mage | tail -n +2 | fzf | while read -r cmd _; do if [ "$cmd" ]; then mage "$cmd"; fi; done
  else
    # TODO: resort to run `make` if no magefile.go is found?
    mage "${1:-.}"
  fi
}

# unalias z 2> /dev/null # Unbind z
# z command + fzf
# z() {
#   [ $# -gt 0 ] && _z "$*" && return
#   cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
# }

# zz() {
#   cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
# }

# Kill process
fkil() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fa <dir> - Search dirs and cd to them - TODO: ignore node_modules + other things
fa() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fah <dir> - Search dirs and cd to them (included hidden dirs)
fah() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fb() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fshow - git commit browser
fg() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# git
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

fgc() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

gbf() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

# gh() {
#   is_in_git_repo || return
#   git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
#   fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
#     --header 'Press CTRL-S to toggle sort' \
#     --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
#   grep -o "[a-f0-9]\{7,\}"
# }

grr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}


# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
ft() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# fm - checkout git commit
fm() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && nvim "${files[@]}"
}

se() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && subl "${files[@]}"
}

# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}

# fs() {
#   local dir
#   dir=$(find ${1:-.} -path '*/\.*' -prune \
#                   -o -type d -print 2> /dev/null | fzf +m) &&
#   cd "$dir"
# }

# cd into the directory of the selected file
fw() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
   exa
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fdd <file> - cd into the directory of the selected file
fdd() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fh - Repeat history, assumes zsh
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Search env variables
fenv() {
  local out
  out=$(env | fzf)
  echo $(echo $out | cut -d= -f2)
}

# Repeat history and run the cmd
rh() {
 eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
# TODO: add binding

# Git
# Git commit browser
fgs() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

fstash() {
    local out q k sha
    while out=$(
            git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
                fzf --ansi --no-sort --query="$q" --print-query \
                    --expect=ctrl-d,ctrl-b);
    do
        mapfile -t out <<< "$out"
        q="${out[0]}"
        k="${out[1]}"
        sha="${out[-1]}"
        sha="${sha%% *}"
        [[ -z "$sha" ]] && continue
        if [[ "$k" == 'ctrl-d' ]]; then
            git diff $sha
        elif [[ "$k" == 'ctrl-b' ]]; then
            git stash branch "stash-$sha" $sha
            break;
        else
            git stash show -p $sha
        fi
    done
}
