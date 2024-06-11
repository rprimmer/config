# I don't use /bin/sh interactively, but it is used in batch by some programs.
# Therefore, need to add homebrew path here too, not just bash_profile

# Homebrew is located in /usr/local on Intel macs and /opt/homebrew on ARM macs.
# By default, /usr/local/bin is in /etc/paths on macOS, so no need to adjust PATH there.
# But it does need to explicitly be added on ARM macs. 

if [ -d "/opt/homebrew" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi
