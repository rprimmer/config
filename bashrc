# ~/.bashrc

[[ $- != *i* ]] && return   # Guard against non-interactive use 

# Locals
HISTSIZE=20000
HISTFILESIZE=40000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s cmdhist          # multi-line commands as one entry
# Share history across multiple terminal sessions (lightweight)
case "$PROMPT_COMMAND" in
  *"history -a; history -n"*) ;;
  *) PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; $PROMPT_COMMAND}" ;;
esac

FIGNORE=".o:~"              # ignore these on cmd line completion
FCEDIT=vim                  # use vi for fc bash builtin
export EDITOR=vim           # exported so external tools (git, crontab -e, etc.) see it

# Shell options
set -m                      # enable job control
set -o ignoreeof            # CTRL-D will not kill terminal session
shopt -s cdspell            # correct minor spelling errors on cd command
shopt -s checkjobs          # don't exit bash on first exit if running jobs exist
shopt -s globstar           # enables **/* recursive dir access, akin to zsh(1)

# set dircolors
if command -v gdircolors >/dev/null 2>&1 && [[ -r "$HOME/.dircolors/dircolors.256dark" ]]; then
  eval "$(gdircolors "$HOME/.dircolors/dircolors.256dark")"
fi

# hash specific commands outside normal search list
[[ -x /usr/sbin/chown ]] && hash -p /usr/sbin/chown chown
[[ -x /usr/sbin/init ]] && hash -p /usr/sbin/init init
[[ -x /sbin/shutdown ]] && hash -p /sbin/shutdown shutdown

# Generic functions

# display the top 10 commands in history buffer
top10() {
   history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

mkd() { mkdir -p "$@" && cd "$_" ; }        # create a new dir and enter it
lcd() { cd "$1" && eza -aFl; }              # enter dir, list contents
hex2dec() { printf "%d\n" "$@" ; }          # print hex (0xn) or octal (0n) as decimal
zipf() { zip -r "$1".zip "$1" ; }           # create ZIP archive of a folder
# ff () { find . -name "$@" ; }             # unnecessary with fd(1)
dup() { cp "$1" "$1-COPY" ; }               # duplicate a file

# convert tabs to 4 spaces
tab2sp() {
  find . -type f -name "$1" -print0 |
    while IFS= read -r -d '' f; do
      sed -i '' $'s/\t/    /g' "$f"
    done
}

# macOS-specific functions

t() { command mv -v "$@" ~/.Trash ; }       # Move file(s) to macOS trash
ql() { qlmanage -p "$@" >& /dev/null ; }    # Open file(s) in macOS Quicklook preview   
sl() { mdfind -name "$@" 2> /dev/null; }    # Find files with macOS spotlight metadata search
view-plist() { plutil -p "$@" ; }           # View macOS .plist files

# cd to the dir in active macOS Finder tab
cdf () {
    currFolderPath=$( /usr/bin/osascript <<EOT
        tell application "Finder"
            try
        set currFolder to (folder of the front window as alias)
            on error
        set currFolder to (path to desktop folder as alias)
            end try
            POSIX path of currFolder
        end tell
EOT
    )
    echo "cd to \"$currFolderPath\""
    cd "$currFolderPath" || return 
}

# cd(1) to the needlessly complicated iCloud directory paths
# iCloud / Mobile Documents paths (define once)
ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ICLOUD_PAGES="$HOME/Library/Mobile Documents/com~apple~Pages/Documents"
ICLOUD_NUMBERS="$HOME/Library/Mobile Documents/com~apple~Numbers/Documents"
ICLOUD_KEYNOTE="$HOME/Library/Mobile Documents/com~apple~Keynote/Documents"
ICLOUD_PREVIEW="$HOME/Library/Mobile Documents/com~apple~Preview/Documents"
ICLOUD_OBSIDIAN="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian_Main"

ic () {
    case ${1:-} in
        "")  cd "$ICLOUD_DRIVE" || return ;;
        c)   cd ~/Documents/linux/config || return ;;
        k)   cd "$ICLOUD_KEYNOTE" || return ;;
        l)   cd ~/Documents/linux || return ;;
        n)   cd "$ICLOUD_NUMBERS" || return ;;
        o)   cd "$ICLOUD_OBSIDIAN" || return ;;
        p)   cd "$ICLOUD_PAGES" || return ;;
        pr)  cd "$ICLOUD_PREVIEW" || return ;;
        py)  cd ~/Documents/src/python || return ;;
        s)   cd ~/Documents/src || return ;;
        sw)  cd ~/Documents/src/Swift || return ;;
        ?)   echo "c config | k keynote | l linux | n numbers | o obsidian | p pages | pr preview | py python | s src | sw swift" ;;
        *)   echo "'$1' invalid option" ;;
    esac
}


if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
