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
alias ec='emacs -nw'
alias ff='fastfetch --load-config ~/.config/fastfetch/ff.jsonc'
alias caps='setxkbmap -option "ctrl:nocaps"'
alias sye='bash /home/une/桌面/back/archlinux/check/zprac-some/sh/sync-emacs.sh'
alias gwe='bash /home/une/.config/emacs/archive/weather-wttr.sh'
source ~/.bash_profile
