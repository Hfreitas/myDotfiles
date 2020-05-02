<<<<<<< HEAD
=======
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

>>>>>>> Nova instalação Linux, alterei tema para PowerLevel10K e ainda vou particionar o .zshrc
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/hfreitas/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
<<<<<<< HEAD
ZSH_THEME="spaceship"

#SPACESHIP CONFIG
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  package       # Package version
  venv          # virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL="\uf0e7"
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_USER_SHOW="always"
SPACESHIP_HOST_SHOW="true"
=======
ZSH_THEME="powerlevel10k/powerlevel10k"
>>>>>>> Nova instalação Linux, alterei tema para PowerLevel10K e ainda vou particionar o .zshrc

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Aliases

<<<<<<< HEAD
source /home/hfreitas/.aliases

#Functions

source /home/hfreitas/.functions

#Development Tools paths

source /home/hfreitas/.exports



# Color scheme of Dracula Theme
eval `dircolors /home/hfreitas/.dir_colors/dircolors`


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte-2.91.sh
fi

autoload bashcompinit && bashcompinit
=======
#System Aliases

alias mv="mv -i"
alias cp="cp -i"
alias install="sudo apt-fast install"
alias lt="ls -alF"
alias clr="clear"
alias tlp="sudo tlp start"
alias logo="neofetch"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias nzsh="sudo nano ~/.zshrc"

#Files associations

alias -s txt=code
alias -s md=code
alias -s html=code
alias -s js=code
alias -s py=code

#NPM Aliases

alias ns='npm start'
alias nr='npm run'
alias ni='npm install'
alias niD='npm install -D'
alias niS='npm instal --save'
alias airbnb='exec 3<&1;bash <&3 <(curl https://raw.githubusercontent.com/paulolramos/eslint-prettier-airbnb-react/master/eslint-prettier-config.sh 2> /dev/null)'

#mySQL aliases

alias mystart='systemctl start mysql'
alias mystop='systemctl stop mysql'
alias myacess='mysql - u root -p'

#Docker aliases

alias dstart='sudo systemctl start docker'
alias dstop='sudo systemctl stop docker'

# Dotfiles manangement alias

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#Functions

gcM() {
  git commit -m $1 -m $2
}

auccV() {
  aucc -V $1 $2 -b1
}

auccH() {
  aucc -H $1 $2 -b1
}

mkcd() {
  case "$1" in /*) : ;; *) set -- "./$1" ;; esac
  mkdir -p "$1" && cd "$1"
}

#Development Tools paths

#NVM Variables
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#Pyenv Variables
export PATH="/home/hfreitas/.pyenv/bin:$PATH"

#Autocompletetion variables
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(register-python-argcomplete pipx)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
>>>>>>> Nova instalação Linux, alterei tema para PowerLevel10K e ainda vou particionar o .zshrc
