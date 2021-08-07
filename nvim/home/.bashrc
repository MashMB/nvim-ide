# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

source /usr/share/doc/fzf/examples/completion.bash
source /usr/share/doc/fzf/examples/key-bindings.bash

export FZF_DEFAULT_OPTS="--reverse --no-height"

alias cl="clear"
alias ls="ls -al --color"
alias du="du -h"
alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias gs="git status"
alias gb="git branch -a"
alias gp="git push origin"
alias gps="git push --set-upstream origin"
alias gc="git checkout"
alias gcb="git checkout -b"
