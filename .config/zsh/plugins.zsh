plugins=( \
  "/usr/share/fzf/completion.zsh" \
  "/usr/share/fzf/key-bindings.zsh" \
  )

for plugin in "${plugins[@]}"; do
  if [[ -f $plugin ]]; then
    source $plugin
  fi
done

#fzf configs
export FZF_BASE='/usr/bin/fzf'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --ansi'
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
