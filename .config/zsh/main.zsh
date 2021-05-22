. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/plugins/java/set-java-home.zsh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

setopt correctall
setopt autocd
setopt  autopushd
setopt  pushdminus
setopt  pushdsilent
setopt  pushdtohome
setopt  cdablevars

setopt extendedglob

DIRSTACKSIZE=5

