# Init ASDF
if [ -f $HOME/.asdf/asdf.sh ]; then
    source $HOME/.asdf/asdf.sh
fi

# Additional completions config
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Additional ASDF completions
if [ -d ${ASDF_DIR}/completions ]; then
    fpath=(${ASDF_DIR}/completions $fpath)
fi

autoload -Uz compinit && compinit

DIRSTACKSIZE=5

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

