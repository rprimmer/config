# ~/.bashrc

# Locals
HISTSIZE=1000              # number of commands to save in history file  
#HISTIGNORE="?:??:&:exit"  # & says ignore duplicate cmds, ?:?? ignore 1 or 2 letter cmds
#HISTIGNORE="l?:&:exit"    # ingore l?, & says ignore duplicate cmds
FIGNORE=".o:~"             # ignore these on cmd line completion
FCEDIT=vi                  # use vi for fc bash builtin
EDITOR=vi 

# Shell options 
set -m                     # enable job control
set -o ignoreeof           # CTRL-D will not kill terminal session
shopt -s cdspell           # correct minor spelling erros on cd command
shopt -s checkjobs         # don't exit bash on first exit if running jobs exist
shopt -s globstar          # enables **/* recursive dir access, akin to zsh(1)

# set dircolors 
eval $(gdircolors ~/.dircolors/dircolors.256dark)  

# hash specific commands outside normal search list
# Note: hashed commands are accessible via bash command completion by default
hash -p /usr/sbin/chown chown
hash -p /usr/sbin/init init
hash -p /sbin/shutdown shutdown

# Generic functions

# display the top 10 commands in history buffer 
top10() {
   history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

mkd() { mkdir -p "$@" && cd "$_" ; }       # create a new dir and enter it
lcd() { cd "$@" ; eza  -aFl ; }            # enter dir, list contents 
hex2dec() { printf "%d\n" "$@" ; }         # print hex (0xn) or octal (0n) as decimal
zipf() { zip -r -dc "$1".zip "$1" ; }      # create ZIP archive of a folder
# ff () { find . -name "$@" ; }             # unnecessary with fd(1)
dup() { cp "$1" "$1-COPY" ; }              # duplicate a file
tab2sp() { sed -i '' $'s/\t/    /g' $(find . -name "$1") ; }  #convert tabs to 4 spaces

# macOS-specific functions

t() { command mv -v "$@" ~/.Trash ; }          # Move file(s) to macOS trash
ql() { qlmanage -p "$*" >& /dev/null ; }       # Open file(s) in macOS Quicklook preview
sl() { mdfind -name "$@" 2> /dev/null; }       # Find files with macOS spotlight metadata search
view-plist() { plutil -p "$@" ; }              # View macOS .plist files 

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
    cd "$currFolderPath" || exit
}

# cd(1) to the needlessly complicated iCloud directory paths
ic () {
   if [ -z $1 ]  ;  then
        cd ~/ic || exit             # CloudDocs
   else
       case $1 in
            c)   cd ~/Documents/linux/config || exit  ;; 
            k)   cd ~/Libary/Mobile\ Documents/com~apple~Keynote/Documents || exit   ;; 
            l)   cd ~/Documents/linux || exit  ;;   
            n)   cd ~/Libary/Mobile\ Documents/com~apple~Numbers/Documents || exit   ;; 
            o)   cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian_Main || exit ;;
            p)   cd ~/Library/Mobile\ Documents/com~apple~Pages/Documents || exit    ;; 
            pr)  cd ~/Library/Mobile\ Documents/com~apple~Preview/Documents || exit  ;; 
            py)  cd ~/Documents/src/python || exit  ;; 
            s)   cd ~/Documents/src || exit  ;;   
            sw)  cd ~/Documents/src/Swift || exit ;;           
            ?)   echo "c - config; k - keynote; l - linux; n - numbers; o - obsidian; p - pages; pr - preview; py - python; s - src; sw - swift" ;;
            *)   echo "'$1' invalid option" ;;
       esac
    fi
}

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
