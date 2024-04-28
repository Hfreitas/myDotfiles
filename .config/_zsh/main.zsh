if [ -e $HOME/.config/_zsh/omz.zsh ]; then
  source $HOME/.config/_zsh/omz.zsh
fi


# Additional completions config
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

autoload -Uz compinit && compinit

DIRSTACKSIZE=5

if [ -e $HOME/.config/_zsh/functions.zsh ]; then
  source $HOME/.config/_zsh/functions.zsh
fi

if [ -e $HOME/.config/_zsh/history.zsh ]; then
  source $HOME/.config/_zsh/history.zsh
fi

if [ -e $HOME/.config/_zsh/variables.zsh ]; then
  source $HOME/.config/_zsh/variables.zsh
fi

if [ -e $HOME/.config/_zsh/aliases.zsh ]; then
  source $HOME/.config/_zsh/aliases.zsh
fi


source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

eval "$(starship init zsh)"

