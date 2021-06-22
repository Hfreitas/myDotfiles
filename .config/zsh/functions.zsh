mkcd() {
  case "$1" in /*) : ;; *) set -- "./$1" ;; esac
  mkdir -pv "$1" && cd "$1"
}

uninstall() {
  sudo pacman -Rsu $1
}

yay-uninstall() {
  yay -Rsu $1
}

fcd() {
  cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}')
}

