. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/plugins/java/set-java-home.zsh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit
_dotbare_completion_cmd
_dotbare_completion_git

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

if [ -e $HOME/.config/zsh/aliases.zsh ]; then
  source $HOME/.config/zsh/aliases.zsh
fi

if [ -e $HOME/.config/zsh/functions.zsh ]; then
  source $HOME/.config/zsh/functions.zsh
fi

if [ -e $HOME/.config/zsh/history.zsh ]; then
  source $HOME/.config/zsh/history.zsh
fi

if [ -e $HOME/.config/zsh/variables.zsh ]; then
  source $HOME/.config/zsh/variables.zsh
fi
