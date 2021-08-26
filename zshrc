export DOTFILES=$HOME/.dotfiles
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  osx
  jump
  httpie
  vim
  docker
  z
  laravel5
  composer
  tmux
  tmuxinator
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# source all .zsh files inside of the zsh/ directory
for config ($DOTFILES/zsh/**/*.zsh) source $config

# Export PATH variables
export PATH="vendor/bin:$PATH"
export PATH="node_modules/.bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

