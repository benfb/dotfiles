#!/bin/bash

# Install command-line tools using Homebrew.

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
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install other useful binaries
brew install ack
brew install cloc
brew install cmus
brew install elixir
brew install git
brew install gitsh
brew install gnupg
brew install jq
brew install leiningen
brew install pv
brew install rename
brew install sqlite
brew install tree
brew install vim --override-system-vi
brew install wget --with-iri
brew install youtube-dl

# Remove outdated versions from the cellar
brew cleanup

# Install native opps
brew tap caskroom/cask

function installcask() {
	brew cask install "${@}" 2> /dev/null
}

declare -a apps=(
  1password
  atom
  audacity
  colloquy
  daisydisk
  dockertoolbox
  dropbox
  electrum
  emacs
  firefox
  flux
  google-chrome
  gpgtools
  iterm2
  lighttable
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
  the-unarchiver
  thunderbird
  torbrowser
  transmission
  virtualbox
  vlc
  xquartz
  zotero
)

for app in "${apps[@]}" do
    installcask "$app"
done
