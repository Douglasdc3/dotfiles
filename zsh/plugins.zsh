source $DOTFILES/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Tell Antigen that you're done.
antigen apply

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle macos
antigen bundle jump
antigen bundle httpie
antigen bundle z
antigen bundle composer
antigen bundle tmux
antigen bundle tmuxinator 

# Syntax highlighting bundle.
antigen bundle jessarcher/zsh-artisan

# Load the theme.
antigen theme robbyrussell

