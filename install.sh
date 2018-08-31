#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR YELLOW NC
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Create symlinks
echo -e "${YELLOW}Create symlinks${NC}"
ln -sfv "$DOTFILES_DIR/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/.atom" ~
ln -sfv "$DOTFILES_DIR/.hyper.js" ~
ln -sfv "$DOTFILES_DIR/omf" ~/.config

# execute flag on bin
chmod u+x "$DOTFILES_DIR/bin/*"

xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# TODO: https://github.com/mas-cli/mas ?

brew install fish git rbenv node npm yarn heroku php postgresql redis trash

curl -L https://get.oh-my.fish | fish
omf install
omf update

npm i -g git-open http-server internal-ip-cli public-ip-cli wifi-password-cli

brew cask install google-chrome firefox atom spotify slack sketch hyper insomnia dashlane authy divvy transmission vlc

# Setup Atom
apm install --packages-file ~/.atom/package.list


bash "$DOTFILES_DIR/macos.sh"
bash "$DOTFILES_DIR/dock.sh"
