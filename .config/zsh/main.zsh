. ${HOME}/.asdf/asdf.sh

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

# tabtab source for packages
# uninstall by removing these lines
if [ -e $HOME/.config/zsh/__tabtab.zsh ]; then
  source $HOME/.config/zsh/__tabtab.zsh
fi
