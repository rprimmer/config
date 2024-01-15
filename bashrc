# ~/.bashrc

HISTSIZE=300               # number of commands to save in history file  
HISTIGNORE="?:??:&:exit"   # & says ignore duplicate cmds, ?:?? ignore 1 or 2 letter cmds
FIGNORE=".o:~"             # ignore these on cmd line completion
FCEDIT=vi                  # use vi for fc bash builtin
EDITOR=vi 
MANPAGER="sh -c 'col -bx | bat -l man -p'"  # Use colors with MAN pages. 

# Set shell options 
set -m                     # enable job control
set -o ignoreeof           # CTRL-D will not kill terminal session
shopt -s cdspell           # correct minor spelling erros on cd command
shopt -s checkjobs         # don't exit bash on first exit if running jobs exist

alias b=bat
alias df="duf --hide-mp '*time*'"
alias h='history | tail -n 30'
alias numFiles='echo $(gls -1 | wc -l)'  # count of non-hidden files in current dir
alias make1mb='mkfile -v 1m ./1MB.dat'   # creates a file of 1mb size (all zeros)
alias memHogs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias path='echo -e ${PATH//:/\\n}'      # display all executabe paths
alias pp="popd"
alias pu="pushd $1"
alias pss='ps aux | less'
alias rp='realpath .' 
alias tarball='tar cjvf $1 $2'
alias top="btop"
alias untarball='tar xjvf $1'
alias vi="vim"
alias wh='who -uTH'
alias xcf='find $HOME/Library -name $1' # xcode find - find console app by name

# gls / eza aliases 
eval $(gdircolors ~/.dircolors/dircolors.256dark)  # set dircolors 
alias ls="eza"
alias l.="eza -dF .*"
alias ll="eza -lF $@"
alias lll="gls -lAhF $@"
alias lsg="eza --long --header --git"
alias lst="eza --tree -L 2 $@"
alias lsm="eza --sort=modified --reverse -lF"
alias ls-by-size="eza --sort=size -l --reverse"
alias fl='gls -lA | egrep "^l" || echo "No soft links"'
alias fdc="eza --only-dirs"

# Network aliases 
alias myip="curl -s http://ipecho.net/plain ; echo"
alias myWirelessAddress='echo -n "Wireless address: " ; ipconfig getifaddr en1'
alias myEthernetAddress='echo -n "Ethernet address: " ; ipconfig getifaddr en0 ; echo'
alias lsock='sudo /usr/sbin/lsof -i -P'               # list open sockets
alias lsockudp='sudo /usr/sbin/lsof -nP | grep UDP'   # display only UDP sockets
alias lsocktcp='sudo /usr/sbin/lsof -nP | grep TCP'   # display only TCP sockets
alias ipinfoen0='ipconfig getpacket en0'              # info on connections to en0
alias openports='sudo lsof -i | grep LISTEN'
alias netSpeed="networkQuality -v"

# hash specific commands outside normal search list
hash -p /usr/sbin/chown chown
hash -p /usr/sbin/init init
hash -p /sbin/shutdown shutdown
hash -p /Applications/Doxygen.app/Contents/Resources/doxygen doxygen

# Functions

# display the top 10 commands in history buffer 
top10 () {
   history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

mkd () { mkdir -p "$@" && cd "$_" ; }       # create a new dir and enter it
lcd () { cd "$@" ; eza  -aFl ; }            # enter dir, list contents 
hex2dec () { printf "%d\n" "$@" ; }         # print hex (0xn) or octal (0n) as decimal
zipf () { zip -r -dc "$1".zip "$1" ; }      # create ZIP archive of a folder
# ff () { find . -name "$@" ; }             # unnecessary with fd(1)
dup () { cp "$1" "$1-COPY" ; }              # duplicate a file
tab2sp () { sed -i '' $'s/\t/    /g' $(find . -name "$1") ; }  #convert tabs to 4 spaces

# macOS specific 
alias clipboard-to-stdout="/usr/bin/pbpaste | textutil -convert txt -stdin -stdout -encoding UTF-8 ; echo"
alias finder='open -a Finder ./'            # Open currect dir in macOS Finder
alias listnet="networksetup -listallhardwareports" # List all network hardware
alias marktext="/Applications/MarkText.app/Contents/MacOS/MarkText"
alias eject-disk="drutil tray eject"        # Eject CD
alias metadata-info="mdimport -td2 $1"
alias network-name="networksetup -getairportnetwork en2 | awk -F: '{print $2}'"

t () { command mv "$@" ~/.Trash ; }         # Move file(s) to macOS trash
ql () { qlmanage -p "$*" >& /dev/null ; }   # Open file(s) in macOS Quicklook preview
spotlight() { mdfind -name "$@" ; }         # Find files with macOS spotlight metadata search
view-plist () { plutil -p "$@" ; }          # View macOS .plist files 

# cd(1) to the dir in active macOS Finder 
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
    cd "$currFolderPath"
}

# ic:  cd(1) to the needlessly complicated iCloud directory paths
ic () {
   if [ -z $1 ]  ;  then
            cd ~/ic             # iCloud
   else
       case $1 in
            c)   cd ~/ic/linux/config  ;; # config
            k)   cd ~/Libary/Mobile\ Documents/com~apple~Keynote/Documents   ;;   # Keynote
            l)   cd ~/ic/linux  ;;   
            m)   cd ~/ic/Markdown  ;; 
            n)   cd ~/Libary/Mobile\ Documents/com~apple~Numbers/Documents   ;;   # Numbers            
            p)   cd ~/Library/Mobile\ Documents/com~apple~Pages/Documents    ;;   # Pages
            pr)  cd ~/Library/Mobile\ Documents/com~apple~Preview/Documents  ;;   # Preview
            s)   cd ~/Documents/src  ;;   # sources 
            sw)  cd ~/ic/Swift ;;           
            ?)   echo "c - config; k - keynote; l - linux; m - markdown; n - numbers; p - pages; pr - preview; s - src" ;;
            *)   echo "'$1' invalid option" ;;
       esac
    fi
}
