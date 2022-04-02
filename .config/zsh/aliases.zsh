#System Aliases

alias mkdir="mkdir -pv"
alias mv="mv -i"
alias cp="cp -i"
alias ls="lsd -alF"
alias lt="lsd --tree"
alias clr="clear"
alias logo="neofetch"
alias upgrade="yay -Syyu --devel --timeupdate"
alias autoclean="sudo pacman -Scc"
alias yay-clean="yay -Yc"
alias autoremove="sudo pacman -Qtdq | sudo pacman -Rns -"
alias nzsh="sudo nano ~/.zshrc"
alias szsh="source ~/.zshrc"
alias grep='grep --color=auto'
alias projects='cd $PROJECTS_FOLDER'
alias personal='cd $PROJECTS_FOLDER/personal'
alias work='cd $PROJECTS_FOLDER/work'
alias cat='bat'

#Docker aliases

alias dstart='sudo systemctl start docker && sudo systemctl start containerd'
alias dstop='sudo systemctl stop docker && sudo systemctl stop containerd'
alias dstatus='sudo systemctl status docker'
alias dcompose='docker-compose'
alias dcomposeup='docker-compose up --build'
alias dcomposedown='docker-compose down'
