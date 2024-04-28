alias bat='batcat'
alias cat='bat'
alias mkdir="mkdir -pv"
alias mv="mv -i"
alias cp="cp -i"
alias ls="lsd -alF"
alias lt="lsd --tree"
alias clr="clear"
alias nzsh="sudo nano ~/.zshrc"
alias szsh="source ~/.zshrc"
alias projects='cd $PROJECTS_FOLDER'
alias fd="fdfind"

#Docker aliases

alias dstart='sudo systemctl start docker && sudo systemctl start containerd'
alias dstop='sudo systemctl stop docker && sudo systemctl stop containerd'
alias dstatus='sudo systemctl status docker'
alias dcompose='docker compose'
alias dcomposeup='docker compose up --build'
alias dcomposedown='docker compose down'
