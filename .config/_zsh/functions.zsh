mkcd() {
  case "$1" in /*) : ;; *) set -- "./$1" ;; esac
  mkdir "$1" && cd "$1"
}

git-update-repo() {
  git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}
