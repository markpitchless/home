# vim: ft=sh

alias ll='ls -lFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias bye='exit'
alias ack='ack-grep'
alias j='jobs'
alias g='grep'

# ROS
alias lstopic="rostopic list"
alias lsnode="rosnode list"
