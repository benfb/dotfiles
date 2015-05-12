# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade -all

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`
brew install moreutils
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
brew install lynx
brew install rename
brew install tree
brew install cmus
brew install gitsh
brew install gnupg
brew tap homebrew/science
brew install r

# Remove outdated versions from the cellar
brew cleanup

# Install native apps
brew install caskroom/cask/brew-cask

function installcask() {
	brew cask install "${@}" 2> /dev/null
}

installcask firefox
installcask 1password
installcask dropbox
installcask transmission
installcask spotify
installcask zotero
installcask torbrowser
installcask soulseek
installcask iterm2
installcask daisydisk
installcask emacs
installcask thunderbird
installcask gpgtools
installcask osxfuse
installcask vlc
installcask private-internet-access
installcask lastfm
installcask superduper
installcask skim
installcask origin
installcask netlogo
installcask the-unarchiver
installcask flux
installcask google-chrome
installcask node
installcask electric-sheep
installcask soleol
installcask xquartz
installcask rstudio

brew tap caskroom/fonts
installcask font-inconsolata
