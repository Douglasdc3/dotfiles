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
elif [ -f /usr/local/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then 
    source /usr/local/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/local/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ];then
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
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

bindkey -e
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word



# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/kenandries/Library/Application Support/Herd/config/php/84/"


# Herd injected NVM configuration
export NVM_DIR="/Users/kenandries/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP binary.
export PATH="/Users/kenandries/Library/Application Support/Herd/bin/":$PATH

