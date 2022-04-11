# ~/.bashrc

HISTSIZE=300               # number of commands to save in history file  
HISTIGNORE="?:??:&:exit"   # & says ignore duplicate cmds, ?:?? ignore 1 or 2 letter cmds
FIGNORE=".o:~"             # ignore these on cmd line completion
FCEDIT=vi                  # use vi for fc bash builtin

# Set shell options 
set -m                     # enable job control
set -o ignoreeof           # CTRL-D will not kill terminal session
shopt -s cdspell           # correct minor spelling erros on cd command
shopt -s checkjobs         # don't exit bash on first exit if running jobs exist
umask 077                  # set default permissions for regular files

alias vi="nvim"
alias pu="pushd $1"
alias pp="popd"
alias h='history | tail -n 30'
alias pss='ps aux | less'
alias wh='who -uTH'
alias path='echo -e ${PATH//:/\\n}'      # display all executabe paths
alias numFiles='echo $(ls -1 | wc -l)'   # count of non-hidden files in current dir
alias make1mb='mkfile -v 1m ./1MB.dat'   # creates a file of 1mb size (all zeros)
alias memHogs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias tarball='tar cjvf $1 $2'
alias untarball='tar xjvf $1'

eval $(gdircolors ~/.dircolors/dircolors.256dark)  # set dircolors 
alias ls='gls --color=auto -F'  # use GNU gls(1) with gdircolors
alias l.="ls -dF .*"
alias ll="ls -lF $*"
alias lll="ls -lAhF $*"
alias ls-by-size="ls -hklsS $*"
alias fd='ls -lA | egrep "^d" || echo "No sub-directories"'
alias fl='ls -lA | egrep "^l" || echo "No soft links"'
alias fdc='ls -AF | fgrep / | column || echo "No sub-directoris"'
alias dt="echo `date | cut -c1-11` `date | cut -c12-19`"      # current date and time
alias clean-tex="rm -rf *.dvi *.log *.aux *.bak *.out auto/"  # clean up after latex build
alias rp='realpath .' 
alias b=bat

# Full recursive directory listing
alias lr='/bin/ls -RA | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\''  '

# Network aliases 
alias myip='echo -n "External IP address: " ; dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com'
alias external-ip="curl -s http://ipecho.net/plain ; echo"
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

# Functions

# display the top 10 commands in history buffer 
function top10 {
   history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

mkd () { mkdir -p "$1" && cd "$1" ; }       # create a new dir and enter it
lcd () { cd $1 ; ls  -AFl ; }               # enter dir, list contents 
mans () { man $1 | grep -iC2 --color=always $2 ; } # Example:  mans ls term 
hex2dec () { printf "%d\n" $1 ; }           # print hex input as decimal
zipf () { zip -r -dc "$1".zip "$1" ; }      # create ZIP archive of a folder
ff () { find . -name "$@" ; }               # find file(s) under the current directory
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
spotlight() { mdfind -name "$@" ; }         # find files with macOS spotlight metadata search

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
            c)   cd ~/icc  ;;   # linux/config
            k)   cd ~/ick  ;;   # Keynote
            l)   cd ~/icl  ;;   # linux
            n)   cd ~/icn  ;;   # Numbers            
            p)   cd ~/icp  ;;   # Pages
            pr)  cd ~/icpr ;;   # Preview
            ?)   echo "c - config; k - keynote; l - linux; n - numbers; p - pages; pr - preview" ;;
            *)   echo "'$1' invalid option" ;;
       esac
    fi
}
