# Temp
,() {
  # echo "Enter m3u8 link:";read link;echo "Enter output filename:";read filename;ffmpeg -i "$link" -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 $filename.mp4

  # echo "Enter link:";
  # read link;
  link=$(pbpaste)
  # echo $link

  echo "Enter output filename:";
  read filename;
  yt-dlp -S ext "$link" -o "$filename.mp4";
  # git branch -m master main
  # git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main
  # go build
  # ./gitupdate
}

,,() {
  # git push origin --delete master
  # yt-dlp ""${1:-.}""
}

,,,() {
  # rm -rf .github
  # mv /Users/nikivi/src/lib/go/go/.github .
}

# search & replace
# R() {
#  rg $1 --files-with-matches | xargs sed -i '' 's/$2/bar/g'
# }

w() {
  if [ $# -eq 0 ]; then
    code-insiders .
  else
    code-insiders "${1:-.}"
  fi
}

# go to directory of file in clipboard
W() {
    # CMD+OPT+C is key bind to copy open file in VSCode
    osascript -e "tell application \"System Events\" to keystroke \"c\" using command down & option down"
    f=$(pbpaste)
    cd "$(dirname "$f")"
}

# watch & run python test file
Wp() {
    # CMD+OPT+C is key bind to copy open file in VSCode
    osascript -e "tell application \"System Events\" to keystroke \"c\" using command down & option down"
    f=$(pbpaste)
    cd "$(dirname "$f")"
    watchexec -w run.py python3 run.py
}

# watch & run js test file
Wj() {
    # CMD+OPT+C is key bind to copy open file in VSCode
    osascript -e "tell application \"System Events\" to keystroke \"c\" using command down & option down"
    f=$(pbpaste)
    cd "$(dirname "$f")"
    watchexec -w run.js node run.js
}

# Wg() {
#   if [ $# -eq 0 ]; then
#     subl .
#   else
#     subl "${1:-.}"
#   fi
# }


s() {
  if [ $# -eq 0 ]; then
    subl .
  else
    subl "${1:-.}"
  fi
}

e() {
  if [ $# -eq 0 ]; then
    nvim .
  else
    nvim "${1:-.}"
  fi
}

# Delete branches that have been squashed and merged into master (https://github.com/not-an-aardvark/git-delete-squashed)
# TODO: git-trim may replace this
gdelsquashed() {
  git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done
}

# bin <binary>. Move <binary> to /usr/local/bin (in my PATH).
bin(){
  mv "$@" /usr/local/bin
}

binp(){
  mv "$@" ~/.dotfiles/bin/private
}


findEmptyDirsAndFiles(){
  find . -type f -exec bash -c 'if [ `cat "{}" |wc -w` -eq 0 ]; then echo "file - {}";fi' \; -or -empty -exec bash -c "echo dir - {}" \;
}

convertAllMDFilesToTabs(){
 find . -name '*.md' ! -type d -exec bash -c 'expand -t 4 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

# Update nix-darwin configuration
un(){
  darwin-rebuild switch
  __ETC_ZSHENV_SOURCED= exec zsh
}

# Update Zsh plugins. TODO: move to magefile
uz(){
  antibody bundle <~/.dotfiles/zsh/plugins.txt >~/.zsh_plugins.sh
  antibody update
}

j(){
  if [ $# -eq 0 ]; then
    yarn
  else
    yarn "$@"
  fi
}

jj(){
  if [ $# -eq 0 ]; then
    yarn && yarn start
  else
    yarn "$@"
  fi
}


# Search aliases/functions
falias() {
    CMD=$(
        (
            (alias)
            (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
        ) | fzf | cut -d '=' -f1
    );

    eval $CMD
}

# Lowercase every file in current dir
lowercaseCurrentDir(){
  for i in *; do mv $i ${(L)i}; done
}

# Show $PATH
path(){
  echo -e ${PATH//:/\\n}
}

# cd to Finder
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"
    else
        echo 'No Finder window found' >&2
    fi
}

# Fetch pull request
fpr() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "error: fpr must be executed from within a git repository"
        return 1
    fi
    (
        cdgr
        if [ "$#" -eq 2 ]; then
            local repo="${PWD##*/}"
            local user="${1}"
            local branch="${2}"
        elif [ "$#" -eq 3 ]; then
            local repo="${1}"
            local user="${2}"
            local branch="${3}"
        else
            echo "Usage: fpr [repo] username branch"
            return 1
        fi

        git fetch "git@github.com:${user}/${repo}" "${branch}:${user}/${branch}"
    )
}

# md <folder-name> - Create folder and cd to it
md(){
  mkdir "$1"
  cd "$1"
}

# Get cheat sheet of command from cheat.sh. h <cmd>
h(){
  curl cheat.sh/${@:-cheat}
  # curl cheat.sh/$@
}

# cfile <file> - Copy content of file to clipboard
cfile(){
  cat $1 | pbcopy
}

# wr - Release Alfred workflow
# wr() {
#   # TODO: Check if current dir has go in it (if yes, cd to workflow and then run script)
#   package-workflow .
# }

# re <files> - Move files to trash.
re(){
  mv "$@" ~/.Trash
}

# zs - Search for most visited directories from z index and open them in finder.
zs() {
  z $1 && open .
}

# awe - Open path of current dir in Alfred.
# awe <file> - Open path of <file> in Alfred.
awe() {
    if [ $# -eq 0 ]; then   # If nothing is put as arguments open Alfred at the working directory so it list the content
        osascript -e "tell application \"Alfred 3\" to browse \"$(pwd)\""
    elif [ $# -eq 1 ]; then # If only one argument is set
        if [[ -d $1 ]] || [[ -f $1 ]]; then   # if it looks like a path or file, then make sure we send a full path to Alfred
            osascript -e "tell application \"Alfred 3\" to browse \"$(realpath -s "$1")\""
        else    # Any other words that are not a path would be sent to Alfred as is  (ex: alfs snip  ->  would open Alfred with "snip")
            osascript -e "tell application \"Alfred 3\" to search \"$*\""
        fi
    else   # If multiple arguments are set, then they are sent to Alfred as is. (ex: alfs define allo  ->  would pop Alfred with "define allo")
        osascript -e "tell application \"Alfred 3\" to search \"$*\""
    fi
}

# aw - Alfred file action search of current dir.
# aw <file> - Alfred file action search for file.
aw() {
    if [ $# -eq 0 ]; then    # If no arguments, pop Alfred Action Window in the working directory
        osascript -e "tell application \"Alfred 3\" to action \"$(pwd)\""
    else
        args=""
        argsAreAllPaths=true
        for arg in "$@" ; do
            filePath=$(realpath -s "$arg")
            if [[ -d $filePath ]] || [[ -f $filePath ]]; then    # if the arg is a file of folder, append the path to the args string to build a list for the osascript command
                args+="\"$filePath\","
            else
                argsAreAllPaths=false   # if one argument is not a folder or file path, then pop Alfred with the standard search and try to access Alfred Action Window. This also makes it clear there's a problem with one of the passed paths
                break
            fi
        done
        if [ "$argsAreAllPaths" = true ] ; then    # If all arguments are files or directories, open Alfred Action Window with the list
            args=${args%?} # remove the trailing comma
            osascript -e "tell application \"Alfred 3\" to action { $args }"
        else  # If not all arguments are files or directories, search as is and try to access the Alfred Action Window. The Action Window should pop if it's possible, or the standard Alfred Search would be shown (ex: alfa activity monitor  ->  Would open the file action window of the Activity Monitor)
            actionKey="keystroke (ASCII character 29)"  # (meaning: right arrow) Put your prefered action key (Alfred -> File Search -> Actions -> Show Actions) as applescript command for keystroke or key code (ex: "key code 98")
            delayBetweenEvents=0.1    # Play with the number if the action doesn't work correctly
            osascript -e "tell application \"Alfred 3\" to search \"$*\"" -e "delay $delayBetweenEvents" -e "tell application \"System Events\" to $actionKey"
        fi
    fi
}

# mdg <dir-name> - Create dir and .go file of <dir-name> name.
mdg() {
    md $1
    touch $1.go
}

# wl - Alfred link and build workflow.
wl() {
    alfred link
    alfred build
}

# iz <png-file> - Create geometric primitive of png-file.
iz () {
    primitive -i in.png -o output.png -n "$1"
}

# NOTE: Not sure if needed.
# fix - Fixes antigen problems.
fix() {
    rm -rf ~/.antigen/.zcompdump
    rm -rf ~/.antigen/.zcompdump.zwc
    exec zsh
}

# TODO: Find for anybar.
# anybar() {
#     echo -n "red" | nc -4u -w0 localhost 1738
# }

# dirfiles <dir> - Give number of files found inside given directory.
dirfiles() {
    find "$1" -type f | wc -l
}

# og <git-repo> - Go get the GitHub repo.
og() {
  go get -u "$@"
}

# rfg <file.go> - go run <file.go> on any Go file changes inside current dir.
rfg() {
  reflex -g '*.go' go run $1
}

# rft <file.py> - Rerun <file.py> on any Python file changes inside current dir.
rft() {
  reflex -g '*.py' python3 "$@"
}

# rfm <cmd-params> - Rerun main.go with <cmd-params> passed in on any Go files changes inside current dir.
rfm() {
    reflex -g '*.go' go run main.go $1
}

# wfj <file.js> - Rerun <file.js> on any JS file changes inside current dir.
wfj() {
    reflex -g '*.js' node $1
}

# af <cmd> - View definition of <cmd>.
af() {
  whence -f "$1"
}

# tc - Create and edit Cartfile.
tc() {
    touch Cartfile
    chmod +x Cartfile
    nvim Cartfile
}

# fl <text> - Find where <text> is contained within current dir.
fl() {
    grep -rnw . -e "$*"
}

# Print current active Finder dir.
finder() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# xo <xcode-proj> - Open Xcode project.
xo(){
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return
    else
      echo "Nothing found"
    fi
  fi
}

# down <url> - Download <url> and save to current dir.
down(){
curl -O "$1"
}

# cw - Copy working dir.
cw() { printf %s "$PWD" | pbcopy; }

# md <dir-name> - Create directory and cd into it.
md() {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# server - Create server of current dir on port 8000 and open it in browser.
server() {
	local port="${1:-8000}"
	sleep 1 && open "http://localhost:${port}/" &
	# set the default content-type to `text/plain` instead of `application/octet-stream`
	# and serve everything as utf-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# compress <file/dir> - Compress <file/dir>.
compress()
  {
    dirPriorToExe=`pwd`
    dirName=`dirname $1`
    baseName=`basename $1`

    if [ -f $1 ] ; then
      echo "It was a file change directory to $dirName"
      cd $dirName
      case $2 in
        tar.bz2)
          tar cjf $baseName.tar.bz2 $baseName
          ;;
        tar.gz)
          tar czf $baseName.tar.gz $baseName
          ;;
        gz)
          gzip $baseName
          ;;
        tar)
          tar -cvvf $baseName.tar $baseName
          ;;
        zip)
          zip -r $baseName.zip $baseName
          ;;
        *)
          echo "Method not passed compressing using tar.bz2"
          tar cjf $baseName.tar.bz2 $baseName
          ;;
      esac
      echo "Back to Directory $dirPriorToExe"
      cd $dirPriorToExe
    else
      if [ -d $1 ] ; then
        echo "It was a Directory change directory to $dirName"
        cd $dirName
        case $2 in
          tar.bz2)
            tar cjf $baseName.tar.bz2 $baseName
            ;;
          tar.gz)
            tar czf $baseName.tar.gz $baseName
            ;;
          gz)
            gzip -r $baseName
            ;;
          tar)
            tar -cvvf $baseName.tar $baseName
            ;;
          zip)
            zip -r $baseName.zip $baseName
            ;;
          *)
            echo "Method not passed compressing using tar.bz2"
            tar cjf $baseName.tar.bz2 $baseName
            ;;
        esac
        echo "Back to Directory $dirPriorToExe"
        cd $dirPriorToExe
      else
        echo "'$1' is not a valid file/folder"
      fi
    fi
    echo "Done"
    echo "###########################################"
  }

# TODO: Write a Go CLI that wraps extract and compress functions + more.
# extract <file.tar> - Extract <file.tar>.
extract() {
  local remove_archive
  local success
  local file_name
  local extract_dir

  if (( $# == 0 )); then
    echo "Usage: extract [-option] [file ...]"
    echo
    echo Options:
    echo "    -r, --remove    Remove archive."
  fi

  remove_archive=1
  if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
    remove_archive=0
    shift
  fi

  while (( $# > 0 )); do
    if [[ ! -f "$1" ]]; then
      echo "extract: '$1' is not a valid file" 1>&2
      shift
      continue
    fi

    success=0
    file_name="$( basename "$1" )"
    extract_dir="$( echo "$file_name" | sed "s/\.${1##*.}//g" )"
    case "$1" in
      (*.tar.gz|*.tgz) [ -z $commands[pigz] ] && tar zxvf "$1" || pigz -dc "$1" | tar xv ;;
      (*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" ;;
      (*.tar.xz|*.txz) tar --xz --help &> /dev/null \
        && tar --xz -xvf "$1" \
        || xzcat "$1" | tar xvf - ;;
    (*.tar.zma|*.tlz) tar --lzma --help &> /dev/null \
      && tar --lzma -xvf "$1" \
      || lzcat "$1" | tar xvf - ;;
  (*.tar) tar xvf "$1" ;;
  (*.gz) [ -z $commands[pigz] ] && gunzip "$1" || pigz -d "$1" ;;
  (*.bz2) bunzip2 "$1" ;;
  (*.xz) unxz "$1" ;;
  (*.lzma) unlzma "$1" ;;
  (*.Z) uncompress "$1" ;;
  (*.zip|*.war|*.jar|*.sublime-package) unzip "$1" -d $extract_dir ;;
  (*.rar) unrar x -ad "$1" ;;
  (*.7z) 7za x "$1" ;;
  (*.deb)
    mkdir -p "$extract_dir/control"
    mkdir -p "$extract_dir/data"
    cd "$extract_dir"; ar vx "../${1}" > /dev/null
    cd control; tar xzvf ../control.tar.gz
    cd ../data; tar xzvf ../data.tar.gz
    cd ..; rm *.tar.gz debian-binary
    cd ..
    ;;
  (*)
    echo "extract: '$1' cannot be extracted" 1>&2
    success=1
    ;;
esac

(( success = $success > 0 ? $success : $? ))
(( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
shift
  done
}

# List commit hashes
commits() {
  git log $1 --oneline --reverse | cut -d' ' -f 1 | tr '/n' ' '
}

# go get currently active Safari URL
ogg() {
  # Get url
  url=$(osascript -e 'tell application "Safari" to return URL of front document')
  # Remove https://
  url="${url#https://}"
  # Get the package/tool
  go get -u $url
}

# ram <process-name> - Find how much RAM a process is taking.
ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}


# when there's too many files in working changes for gitupdate, commit with '.' commit.
G() {
  git add .
  git commit -m "."
  git push
}

# activate python virtual env
penv () {
  [ ! -d "venv/" ] && python3 -m venv venv
  source venv/bin/activate
}

# move file/folder to code archive
mvarchivecode() {
  mv "${1:-.}" ~/archive/code
}
