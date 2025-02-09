#!/bin/zsh

set -e

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Ensure .config directory exists
mkdir -p $HOME/.config

echo "Symlink .dotfiles dot files into $HOME"
ln -F -s $PWD/zshrc $HOME/.zshrc
ln -F -s $PWD/ctags $HOME/.ctags
ln -F -s $PWD/gitignore_global $HOME/.gitignore_global
ln -F -s $PWD/phpactor $HOME/.config/phpactor
ln -F -s $PWD/kitty $HOME/.config/kitty
ln -F -s $PWD/tmux.conf $HOME/.tmux.conf
ln -F -s $PWD/tmux_darwin.conf $HOME/.tmux_darwin.conf
ln -F -s $PWD/tmux/ $HOME/.tmux
ln -F -s $PWD/nvim/ $HOME/.config/nvim

echo "Creating local scripts directory"
mkdir -p $HOME/.local/bin
ln -F -s $PWD/scripts/t $HOME/.local/bin/t
ln -F -s $PWD/scripts/deliver $HOME/.local/bin/deliver

echo "Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Hush login screen when opening new terminal"
touch $HOME/.hushlogin

echo "Install brew tools"
# Development tools
brew install zsh-autosuggestions zsh-syntax-highlighting
brew install fzf
brew install nvim
brew install kitty
brew install tmux tmuxinator urlview
brew install httpie
brew install gh

# Other utilities
brew install yt-dlp
brew install cmake
brew install tree
brew install pv
brew install prettyping
brew install nmap
brew install bat
brew install ncdu
brew install gource
brew install livegrep fd # Required to run nvim
echo "Install applications (Casks)"
# Arduino
brew install --cask arduino-ide
# Rpi / img writer
brew install --cask balenaetcher

# Dev tools
brew install --cask imageoptim
brew install --cask jetbrains-toolbox
brew install --cask herd

# Virtual envs
brew install --cask docker virtualbox

# Utils
brew install --cask caffeine color-oracle
brew install --cask alfred
brew install --cask drawio
brew install --cask font-dejavu-sans-mono-for-powerline
brew install --cask font-dejavu-sans-mono-nerd-font
brew install --cask font-fira-code-nerd-font
brew install --cask font-jetbrains-mono-nerd-font

# Browsers 
brew install --cask firefox google-chrome

# Social / Other
brew install --cask discord slack
brew install --cask vlc
brew install --cask steam

# Install php dependencies
#echo "Install global composer packages"
#composer global require "tightenco/takeout:*"

echo "Set mac defaults"
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the ~/Users folder
chflags nohidden /Users
# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

