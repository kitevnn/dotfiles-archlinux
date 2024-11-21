#
# ~/.bashrc
#
# PS1='[\u@\h \W]\$ '
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -la --color=auto'
alias grep='grep --color=auto'
alias rm='rm -i'
alias ec='emacsclient -nw'
alias lse='exa --icons'
alias lst='exa --icons --tree'
alias ff='fastfetch --load-config ~/.config/fastfetch/ff.jsonc'
alias grep='grep --color=auto'
alias caps='setxkbmap -option "ctrl:nocaps"'
source ~/.bash_profile
