#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install the-unarchiver
brew cask install scroll-reverser
brew cask install spectacle
brew cask install dropbox
brew cask install spotify
brew cask install alfred
brew cask install slack

# dev
brew cask install sublime-text
brew cask install sourcetree
brew cask install imagealpha
brew cask install imageoptim
brew cask install sequel-pro
brew cask install virtualbox
brew cask install cyberduck
brew cask install vagrant
brew cask install iterm2
brew cask install sketch

# browsers
brew cask install google-chrome
brew cask install firefox

# fun
brew cask install disk-inventory-x
brew cask install transmission
brew cask install gyazo
brew cask install vlc

# Not on cask but I want regardless.
# miro-video-converter
# clipmenu
# Mullvad
