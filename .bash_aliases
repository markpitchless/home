# vim: ft=sh

alias ll='ls -lFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias bye='exit'
if [ -f /usr/bin/ack-grep ]; then
    alias ack='ack-grep'
fi
alias j='jobs'
alias g='grep'

# Git
alias commit='git commit'
alias checkout='git checkout'
alias pull='git pull'
alias push='git push'
alias lsv='git status'

alias ansible-vagrant='ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -u vagrant --private-key ~/.vagrant.d/insecure_private_key'
