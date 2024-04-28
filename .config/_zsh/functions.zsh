mkcd() {
  case "$1" in /*) : ;; *) set -- "./$1" ;; esac
  mkdir "$1" && cd "$1"
}

