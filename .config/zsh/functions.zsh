auccV() {
  # https://stackoverflow.com/questions/57099551/how-to-use-asdf-as-root-user
  sudo -E `asdf which aucc` -V $1 $2 -b1
}

auccH() {
  sudo -E `asdf which aucc` -H $1 $2 -b1
}

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

gdiff() {
  # Verifica se o diretório é um repositório git
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not inside a git repository."
  else
    if ! command -v fzf &>/dev/null; then
      echo "Error: FZF not installed."
    else
      if ! command -v bat &>/dev/null; then
        preview="git diff $@ --color=always -- {-1}"
      else
        preview="git diff $@ --name-only --diff-filter=d | xargs bat --diff"
      fi

      if ! [ -d .git ]; then
        root=$(git rev-parse --git-dir | sed 's/.git//')
        pushd $root >/dev/null
        git diff $@ --name-only | fzf -m --ansi --preview $preview
        popd >/dev/null
      else
        git diff $@ --name-only | fzf -m --ansi --preview $preview
      fi
    fi
  fi
}
