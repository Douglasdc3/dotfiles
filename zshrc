export DOTFILES=$HOME/.dotfiles
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# source all .zsh files inside of the zsh/ directory
for config ($DOTFILES/zsh/**/*.zsh) source $config

# Export PATH variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="vendor/bin:$PATH"
export PATH="node_modules/.bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

