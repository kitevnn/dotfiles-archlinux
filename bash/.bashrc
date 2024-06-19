#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -la --color=auto'
alias b='cmake --build build --target run'
alias ec='emacsclient -nw'
alias lse='exa --icons'
alias lst='exa --icons --tree'
alias sbr='source ~/.bashrc'
alias sbp='source ~/.bash_profile'
alias ksex='tmux kill-session'
alias kmux='tmux kill-server'
alias ff='fastfetch --load-config ~/.config/fastfetch/ff.jsonc'
alias t='tmux source-file ~/.tmux.conf'
alias rm='rm -i'
alias r='rustc'
alias grep='grep --color=auto'
alias nvi='nvim'
alias caps='setxkbmap -option "ctrl:nocaps"'
alias ge='export EDITOR="nvim"'
. "$HOME/.cargo/env"
