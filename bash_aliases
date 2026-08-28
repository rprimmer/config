# ~/.bash_aliases

# misc aliases 
alias b=bat                             # display file contents with color
alias batc="bat --color never"          # display file contents without color
alias c=cat              
alias df="duf --hide-mp '*time*'"       # display disk usage in a nice way
alias du="du -h -d 1"                   # display disk usage of current dir
alias env-clean="env | grep -v LS_COLORS"
alias h='history | tail -n 30'
alias getCalEventsToday='icalBuddy -f -eep location,url,notes eventsToday'
alias getCalEventsYesterday='icalBuddy -f -eep location,url,notes eventsFrom:"yesterday" to:"yesterday"'
alias numFiles='echo $(eza -1 | wc -l)' # count of non-hidden files in current dir
alias make1mb='mkfile -v 1m ./1MB.dat'  # creates a file of 1mb size (all zeros)
alias make='gmake'
alias memHogs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias path='echo -e ${PATH//:/\\n}'     # display all executable paths
alias pip='pip3'                        # use pip3 instead of pip2
alias pp="popd"
alias pss='ps aux | less'               # display all processes in a scrollable list
alias python='python3'                  # use python3 instead of python2
alias rp='realpath .'                   # display the absolute path of the current directory
alias top="btop"                        # display system resource usage in a nice way
alias vi="vim"
alias wh='who -uTH'                     # display who is logged in and what they are doing

pu() { pushd "$1"; }
tarball() { tar cjvf "$1" "$2"; }       # create a tarball 
untarball() { tar xjvf "$1"; }          # extract a tarball to the current directory
xcf() { find "$HOME/Library" -name "$1"; } # xcode find - find console app by name

# eza funcs
l.() { eza -d --classify=auto .* "$@"; }
ll.() { eza -l --classify=auto --no-quotes -d .* "$@"; }
ls() { eza --no-quotes -x "$@"; }
lsd() { eza --only-dirs --no-quotes -x "$@"; }
lsg() { eza --long --header --no-quotes --git "$@"; }
ll() { eza -l --classify=auto --no-quotes "$@"; }
lll() { eza -lAh --classify=auto --no-quotes "$@"; }
lsm() { eza --sort=modified --reverse --no-quotes -l --classify=auto "$@"; }
lst() { eza --tree -L 2 --no-quotes "$@"; }
ls-by-size() { eza --sort=size -l --reverse --no-quotes "$@"; }
alias fl='eza -lA | egrep "^l" || echo "No soft links"'

# Network aliases 
alias lsock='sudo /usr/sbin/lsof -i -P'               # list open sockets
alias lsockudp='sudo /usr/sbin/lsof -nP | grep UDP'   # display only UDP sockets
alias lsocktcp='sudo /usr/sbin/lsof -nP | grep TCP'  # display only TCP sockets
alias ipinfoen0='ipconfig getpacket en0'             # info on connections to en0
alias myip="curl -s http://ipecho.net/plain ; echo" # display public IP address
alias myWirelessAddress='echo -n "Wireless address: " ; ipconfig getifaddr en1'
alias myEthernetAddress='echo -n "Ethernet address: " ; ipconfig getifaddr en0 ; echo' 
alias netSpeed="networkQuality -v"                  # measure network speed and quality
alias openports='sudo lsof -i | grep LISTEN' # list open ports

# macOS specific 
alias clipboard-to-stdout="/usr/bin/pbpaste | textutil -convert txt -stdin -stdout -encoding UTF-8 ; echo"
alias eject-disk="drutil tray eject"                    # Eject CD
alias finder='open -a Finder ./'                        # Open current dir in macOS Finder
alias listnet="networksetup -listallhardwareports"      # List all network hardware
alias macos-packages="softwareupdate --list-full-installers" # List all macOS installers available for download
alias marktext="/Applications/MarkText.app/Contents/MacOS/MarkText" # Open MarkText app
alias network-name="networksetup -getairportnetwork en2 | awk -F: '{print \$2}'" # Get current network name

metadata-info() { mdimport -td2 "$1"; } # display metadata info for a file
allow-program-to-run() { xattr -rc "$@"; } # allow a program to run that is blocked by macOS Gatekeeper