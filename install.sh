#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR YELLOW NC
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
# if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Create symlinks
echo -e "${YELLOW}Create symlinks${NC}"
ln -sfv "$DOTFILES_DIR/.atom" ~
ln -sfv "$DOTFILES_DIR/.hyper.js" ~
ln -sfv "$DOTFILES_DIR/omf" ~/.config
