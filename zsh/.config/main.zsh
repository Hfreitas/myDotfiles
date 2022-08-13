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

if [ -e $HOME/.dotfiles/zsh/.config/functions.zsh ]; then
  source $HOME/.dotfiles/zsh/.config/functions.zsh
fi

if [ -e $HOME/.dotfiles/zsh/.config/history.zsh ]; then
  source $HOME/.dotfiles/zsh/.config/history.zsh
fi

if [ -e $HOME/.dotfiles/zsh/.config/variables.zsh ]; then
  source $HOME/.dotfiles/zsh/.config/variables.zsh
fi

# tabtab source for packages
# uninstall by removing these lines
if [ -e $HOME/.dotfiles/zsh/.config/__tabtab.zsh ]; then
  source $HOME/.dotfiles/zsh/.config/__tabtab.zsh
fi
