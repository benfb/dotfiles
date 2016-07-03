#!/bin/bash

# Install command-line tools using Homebrew.
command -v brew > /dev/null 2>&1 || { echo >&2 "I require brew but it's not installed.  Aborting."; exit 1; }

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install Bash 4
brew install bash

# Install Stow to sync dotfiles
brew install stow

# Install other useful binaries
brew install cloc
brew install ccat
# brew install cmus
brew install elixir
brew install git
brew install gnupg
brew install jq
brew install leiningen
brew install pv
# brew install rename
brew install sqlite
brew install tree
brew install vim --with-override-system-vi
brew install wget --with-iri
# brew install youtube-dl

# Remove outdated versions from the cellar
brew cleanup

# Install native apps
# brew tap caskroom/cask

function installcask() {
	brew cask install "${@}" 2> /dev/null
}

declare -a apps=(
  1password
  atom
  audacity
  colloquy
  daisydisk
  dropbox
  electrum
  emacs
  firefox
  flux
  google-chrome
  gpgtools
  iterm2
  mac-linux-usb-loader
  netlogo
  node
  openemu
  osxfuse
  postgres
  qlmarkdown
  skim
  soleol
  soulseek
  spotify
  superduper
  steam
  thunderbird
  torbrowser
  transmission
  vlc
  xquartz
  zotero
)

# for app in "${apps[@]}" do
#     installcask "$app"
# done
