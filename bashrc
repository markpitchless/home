# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set PATH so it includes nfa
if [ -d ~/.nfa/bin ] ; then
    PATH=~/.nfa/bin:"${PATH}"
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # Uses a shortened PWD
    if [ "$TERM" == "screen" ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]$(shortPWD)\[\033[00m\] $(vcs_get_branch)$ '
    else
        #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(shortPWD)\[\033[00m\] $(vcs_get_branch)$ '
        # Command on own line
        #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(vcs_get_branch)\n\[\033[01;32m\]> \[\033[00m\]'
        # command on own line and short pwd
        #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]$(date +"%d%b_%H:%M")\[\033[00m\] \[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;33m\]$(shortPWD -c -m30)\[\033[00m\] \[\033[01;32m\]$(vcs_get_branch)\n\[\033[01;32m\]> \[\033[00m\]'
        source /usr/local/etc/bash_completion.d/git-prompt.sh
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]$(date +"%d%b_%H:%M")\[\033[00m\] \[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;33m\]$(shortPWD -c -m30)\[\033[00m\] \[\033[01;32m\]$(__git_ps1)\n\[\033[01;32m\]> \[\033[00m\]'
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Setup a symlink for the .screenrc to use for the agent. Allows re-connect of
# the agent after screen session disconects.
# Don't link if auth sock *is* the symlink, which happens inside the screen.
# http://superuser.com/questions/180148/how-do-you-get-screen-to-automatically-connect-to-the-current-ssh-agent-when-re-a
if test "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != ~/.ssh/ssh_auth_sock; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    elif which brew 1>/dev/null && [ -f $(brew --prefix)/etc/bash_completion ]; then
        # MacOS
        . "$(brew --prefix)/etc/bash_completion"
    fi
fi

# Run any other rc we might have
if [ -d ~/.nfa/bashrc.d ]; then
  for i in ~/.nfa/bashrc.d/*.{sh,bash}; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# Run any host specific rc we might have
hostrc_dir="$HOME/.nfa/hostrc.d/$(hostname)"
if [ -d "$hostrc_dir" ]; then
  for i in "$hostrc_dir"/*.{sh,bash}; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# Run local rc. File ignored by git.
localrc_file="$HOME/.bashrc.local"
if [ -r "$localrc_file" ]; then
    . $localrc_file
fi

# Enable color support of ls and also add handy aliases
# Test ls to see if supports --color (gnu ls basically).
# Doing this after all the local config files in case they mod the PATH
if ls --color 1>/dev/null 2>&1; then
    alias ls='ls --color=auto'
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
else
    alias ls='ls -G'
fi
# http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
#case "$OSTYPE" in
#    linux*)
#        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#        alias ls='ls --color=auto'
#        #alias dir='dir --color=auto'
#        #alias vdir='vdir --color=auto'
#        ;;
#    darwin*)
#        alias ls='ls -G'
#esac
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.nfa/bash_aliases ]; then
    . ~/.nfa/bash_aliases
fi

#source ~/.aws.env
