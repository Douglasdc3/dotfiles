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

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/local/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    source /usr/local/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Enable command auto-completion
autoload -Uz compinit
compinit

# Enable parameter suggestions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' format '%B%d%b'

# source all .zsh files inside of the zsh/ directory
for config ($DOTFILES/zsh/**/*.zsh) source $config

# Export PATH variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="vendor/bin:$PATH"
export PATH="node_modules/.bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

bindkey -e
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

