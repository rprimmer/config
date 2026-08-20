# ~/.bash_aliases

# misc aliases 
alias b=bat
alias batc="bat --color never"   
alias c=cat    
alias df="duf --hide-mp '*time*'"
alias env-clean="env | grep -v LS_COLORS"
alias h='history | tail -n 30'
alias getCalEventsToday='icalBuddy -f -eep location,url,notes eventsToday'
alias getCalEventsYesterday='icalBuddy -f -eep location,url,notes eventsFrom:"yesterday" to:"yesterday"'
alias numFiles='echo $(eza -1 | wc -l)'  # count of non-hidden files in current dir
alias make1mb='mkfile -v 1m ./1MB.dat'   # creates a file of 1mb size (all zeros)
alias make='gmake'
alias memHogs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias path='echo -e ${PATH//:/\\n}'      # display all executable paths
alias pip='pip3'
alias pp="popd"
alias pss='ps aux | less'
alias python='python3'
alias rp='realpath .' 
alias top="btop"
alias vi="vim"
alias wh='who -uTH'

# Converted from alias to function: only worked previously because the
# placeholder was the last token in the alias string (relying on bash
# appending trailing typed text after alias expansion), and didn't quote
# properly, so an argument containing spaces would break apart.
pu() { pushd "$1"; }
tarball() { tar cjvf "$1" "$2"; }
untarball() { tar xjvf "$1"; }
xcf() { find "$HOME/Library" -name "$1"; } # xcode find - find console app by name

# eza aliases
# Converted from alias-with-trailing-$@ to functions: same reasoning as above
l.() { eza -d --classify=auto .* "$@"; }
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
alias lsocktcp='sudo /usr/sbin/lsof -nP | grep TCP'   # display only TCP sockets
alias ipinfoen0='ipconfig getpacket en0'              # info on connections to en0
alias myip="curl -s http://ipecho.net/plain ; echo"
alias myWirelessAddress='echo -n "Wireless address: " ; ipconfig getifaddr en1'
alias myEthernetAddress='echo -n "Ethernet address: " ; ipconfig getifaddr en0 ; echo'
alias netSpeed="networkQuality -v"
alias openports='sudo lsof -i | grep LISTEN'

# macOS specific 
alias clipboard-to-stdout="/usr/bin/pbpaste | textutil -convert txt -stdin -stdout -encoding UTF-8 ; echo"
alias eject-disk="drutil tray eject"                    # Eject CD
alias finder='open -a Finder ./'                        # Open current dir in macOS Finder
alias listnet="networksetup -listallhardwareports"      # List all network hardware
alias macos-packages="softwareupdate --list-full-installers"
alias marktext="/Applications/MarkText.app/Contents/MacOS/MarkText"
# Fixed: $2 previously sat inside the awk script (not at the end of the alias
# string), so it got swallowed at alias-definition time and awk always printed
# an empty field. Escaping it as \$2 lets awk see it instead of bash.
alias network-name="networksetup -getairportnetwork en2 | awk -F: '{print \$2}'"

metadata-info() { mdimport -td2 "$1"; }
allow-program-to-run() { xattr -rc "$@"; }
