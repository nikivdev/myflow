G() {
  if [ $# -eq 0 ]; then
    # Commit/push all with file names changed as commit msg
    gitupdate .
  else
    git "${1:-.}"
  fi
}

# Update README
gz(){
  git add README.md
  git commit -m "readme"
  git push
}

# cd to root dir of git project
droot() {
  cd $(git rev-parse --show-toplevel)
}

# search local branches -> checkout to branch & delete branch you were on
gbb() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  # delete previous branch I was on
  git branch -D @{-1}
}

# search local branches -> delete local branch. gbd <branch> = delete local branch
gbd() {
  if [ $# -eq 0 ]; then
    local branches branch
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git branch -D $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  else
    git branch -D "$@"
  fi
}

# git checkout branch (searches local branches). ge <branch> = checkout branch
ge() {
  if [ $# -eq 0 ]; then
    local branches branch
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  else
    git checkout "$@"
  fi
}

# git commit browser (searches commits)
gC()
{
  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"  | \
   fzf --ansi --no-sort --reverse --tiebreak=index --preview \
   'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
   --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF" --preview-window=right:60%
}

# Pull from current branch
gpo(){
  git pull origin $(git symbolic-ref --short -q HEAD)
}

# Make PR
pr() {
  # TODO: test it
  git push -u origin "$1"
  hub pull-request -h "$1" -F -
}

# Pull changes from upstream (fork) to master
gfu(){
  git fetch upstream
  git pull upstream master
}

# Ignore files and remove them if they were tracked
gri(){
  git rm "$*"
  git rm --cached "$*"
}

# Update contributing file commit
gzo(){
  git add CONTRIBUTING.md
  git commit -m "contributing"
  git push
}

# Create new branch. geb <branch-name>
geb(){
  git checkout -b "$1"
}

# Commit all changes with <commit-msg>. gw <commit-msg>
gw() {
    git add .
    git commit -m "${(j: :)@}"
    # TODO: check if there is configured push destination. If not, don't push.
    # TODO: change other functions there to do the same
    git push
}

# Commit all changes with `add <commit-msg>`. gwa <commit-msg>
gwa(){
  git add .
  git commit -m "add $*"
  git push
}

# Commit all changes with `<fix commit-msg>`. gwf <commit-msg>
gwf(){
  git add .
  git commit -m "fix $*"
  git push
}

# Commit all changes with `<remove commit-msg>`. gwr <commit-msg>
gwr(){
  git add .
  git commit -m "remove $*"
  git push
}

# Commit all changes with `improve <msg>`. gwi <msg>
gwi() {
    git add .
    git commit -m "improve $*"
    git push
}

# Commit all changes with `update <msg>`. gwe <msg>
gwu() {
    git add .
    git commit -m "update $*"
    git push
}

# Commit all changes with `refactor`
gwe() {
    git add .
    git commit -m 'refactor'
    git push
}

# Commit all changes with `update`
# ggs() {
#     git add .
#     git commit -m 'update'
#     git push
# }

# Write quick commit message. gc <commit-msg>
gc() {
    git commit -m "$*"
    #set -x; git commit -m "$*"; set +x;
}

# cd to root of .git project
g.() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

# Create MIT license file for Nikita Voloboev
mit() {
  license-up mit Nikita Voloboev nikitavoloboev.xyz
  git add LICENSE
}

# Create MIT license file for Learn Anything
mitla () {
  license-up mit Learn Anything, learn-anything.xyz
  git add LICENSE
}

# TODO: not sure
# Pull changes made from PR to head. gp <link>
gp() {
    git pull origin pull/"$1"/head
}

# Create dir, go to it and initialise it with git. mg <dir-name>
mg() {
    mkdir "$1"
    cd "$1"
    git init
}

# git push to origin master of currently open Safari tab
ggu() {
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push -u origin master
}

# git add origin from currently open Safari tab and push to master there
ggo() {
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push $(osascript -e 'tell application "Safari" to return URL of front document') master
    git push --set-upstream origin master
}

# git add origin from currently open Safari tab and push to master there
ggg() {
    git init
    git add .
    git commit -m "init"
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push $(osascript -e 'tell application "Safari" to return URL of front document') master
}

# git initialise Learn Anything repository and make first commit
ggla() {
    git init
    license-up mit Learn Anything, learn-anything.xyz
    git add .
    git commit -m "Init"
}

# Initialise repository and add MIT license
ggi() {
    git init
    license-up mit Nikita Voloboev nikitavoloboev.xyz
    git add .
    git commit -m "Init"
}

# git remote add origin of link found in clipboard
gao() {
    git remote add origin "$(pbpaste)"
}

# git clone and cd instantly to cloned repo. gcd <git-url>
gcd() {
   git clone "$(pbpaste)" && cd "${1##*/}"
}

# git clone link in clipboard
gll(){
    git clone "$(pbpaste)"
    # TODO: cd into cloned project (need to extract name with regex)
}

# TODO: ?
igit() {
  git rev-parse HEAD > /dev/null 2>&1
}

# See contents of .git from current dir recusively as a tree
gte() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}
