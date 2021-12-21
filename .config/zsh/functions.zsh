mkcd() {
  case "$1" in /*) : ;; *) set -- "./$1" ;; esac
  mkdir -pv "$1" && cd "$1"
}
