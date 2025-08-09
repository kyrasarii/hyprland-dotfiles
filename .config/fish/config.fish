if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting ""

alias ll 'ls -l'
alias la 'ls -a'
alias lll 'ls -la'
alias lh 'ls -lh'
alias lha 'ls -lha'
alias lr 'ls -R'
alias lt 'ls -lt'
alias ls-s 'ls -lhS'
alias gs 'git status'
alias ga 'git add .'
alias gc 'git commit -m'
alias gp 'git push'
alias gpm 'git push origin main'
alias gpl 'git pull'
alias gcl 'git clone'
alias gl 'git log --oneline --decorate --all'
alias gla 'git log --all --oneline --graph'
alias gco 'git checkout -b'
alias gcw 'git checkout'
alias gst 'git stash'
alias gsta 'git stash apply'
alias gru 'git restore --staged'
alias gd 'git diff'
alias gdc 'git diff --cached'
alias ins="sudo pacman -S"
alias rmv="sudo pacman -Rns"
alias src="pacman -Ss"
alias cln="sudo pacman -Scc"
alias lst="pacman -Q"
alias lste="pacman -Qe"
alias upd="sudo pacman -Syu"
alias inf="pacman -Qi"
alias fil="pacman -Ql"
alias owp="pacman -Qo"
alias dep="pactree -r"
alias aut="pacman -Qdt"
alias fix="sudo pacman -S --overwrite '*'"
alias hdp="pacman -Qd"
alias mir="sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias aud="sudo pacman -Syyu --overwrite '*'"
alias vi="nvim"
alias vim="nvim"
alias edit="nvim"
alias file="yazi"
alias yz="yazi"
alias please="sudo"
alias clock="tty-clock"
pfetch
