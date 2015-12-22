#!/bin/bash

brew_install() {
  declare -r CMD="$1"
  declare -r FORMULA="$2"
  execute "brew $CMD install $FORMULA"
}

brew_tap() {
  declare -r REPOSITORY="$1"

  brew tap "$REPOSITORY" &> /dev/null
}

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade -all

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install wget
brew install wget

# Install more recent versions of some OS X tools
brew install vim --override-system-vi

# Install other useful binaries
brew install ack
brew install pv
brew install git
brew install rename
brew install tree
brew install cmus
brew install gitsh
brew install gnupg

# Remove outdated versions from the cellar
brew cleanup

# Install native apps
brew install caskroom/cask/brew-cask

function installcask() {
	brew cask install "${@}" 2> /dev/null
}

installcask 1password
installcask atom
installcask audacity
installcask colloquy
installcask daisydisk
installcask dropbox
installcask electrum
installcask emacs
installcask firefox
installcask flux
installcask google-chrome
installcask gpgtools
installcask iterm2
installcask lighttable
installcask mac-linux-usb-loader
installcask netlogo
installcask node
installcask openemu
installcask osxfuse
installcask postgres
installcask qlmarkdown
installcask skim
installcask soleol
installcask soulseek
installcask spotify
installcask superduper
installcask steam
installcask the-unarchiver
installcask thunderbird
installcask torbrowser
installcask transmission
installcask virtualbox
installcask vlc
installcask xquartz
installcask zotero
