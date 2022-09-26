#!/bin/sh

echo "Symlink .dotfiles dot files into $HOME"
ln -F -s $PWD/zshrc $HOME/.zshrc
ln -F -s $PWD/ctags $HOME/.ctags
ln -F -s $PWD/gitignore_global $HOME/.gitignore_global
ln -F -s $PWD/phpactor.yml $HOME/.phpactor.yml
ln -F -s $PWD/tmux.conf $HOME/.tmux.conf
ln -F -s $PWD/tmux_darwin.conf $HOME/.tmux_darwin.conf
ln -F -s $PWD/tmux/ $HOME/.tmux
ln -F -s $PWD/nvim/ $HOME/.config/nvim

echo "Hush login screen when opening new terminal"
touch $HOME/.hushlogin

echo "Install brew tools"
# Development tools
brew install zsh-autosuggestions zsh-syntax-highlighting
brew install fzf
brew install nvim
brew install tmux tmuxinator urlview
brew install sqlite
brew install php
brew install node
brew install mysql
brew install httpie
brew install gh
brew install mailhog

# Other utilities
brew install youtube-dl
brew install tree
brew install pv
brew install prettyping
brew install nmap
brew install bat
brew install ripgrep
brew install gource

echo "Install applications (Casks)"
# Arduino
brew install --cask arduino fritzing 
# Rpi / img writer
brew install --cask balenaetcher

# Dev tools
brew install --cask iterm2 
brew install --cask wireshark
brew install --cask imageoptim
brew install --cask phpmon jetbrains-toolbox

# Virtual envs
brew install --cask docker vagrant virtualbox

# Editors 
brew install --cask processing scenebuilder stoplight-studio visual-studio-code visualvm

# DB Tools
brew install --cask robo-3t sequel-pro

# Utils
brew install --cask caffeine flux color-oracle gifox spectacle
brew install --cask alfred
brew install --cask drawio
brew install --cask homebrew/cask-fonts/font-dejavu-sans-mono-for-powerline
brew install --cask homebrew/cask-fonts/font-dejavu-sans-mono-nerd-font

# Browsers 
brew install --cask firefox google-chrome opera

# Social / Other
brew install --cask discord twitch
brew install --cask vlc spotify


echo "Install composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=bin --filename=composer
php -r "unlink('composer-setup.php');"

echo "Install global comoposer packages"
composer global require "laravel/valet:*"
composer global require "laravel/installer:*"
composer global require "botman/installer:*"
composer global require "phan/phan:*"
composer global require "vimeo/psalm:*"
composer global require "tightenco/takeout:*"
composer global require "squizlabs/php_codesniffer:*"
composer global require "phpmd/phpmd:*"
composer global require "friendsofphp/php-cs-fixer:*"
composer global require "infection/infection:*"
composer global require "beyondcode/expose"

echo "Do not forget to activate expose first"

echo "Setup valet (may require password)"
valet trust
valet install
valet proxy mailhog.test http://127.0.0.1:8025

