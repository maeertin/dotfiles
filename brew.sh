	#!/bin/bash

# Install command-line tools using Homebrew

# (Optionally) Turn off brew's analytics https://docs.brew.sh/Analytics
# brew analytics off

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`
brew install gnu-sed


# Updated shells
# Note: don’t forget to add `/usr/local/bin/<EACHSHELL>` to `/etc/shells` before running `chsh`.
brew install bash
brew install zsh

brew install bash-completion@2


# Install more recent versions of some OS X tools
brew install vim
brew install nano
brew install grep
brew install openssh

# z hopping around folders
brew install z

# github util
brew install gh
# nicer git diffs
brew install git-delta
brew install git-friendly/git-friendly/git-friendly
brew install git

# better `top`
brew install glances

# Install other useful binaries
brew install node # This installs `npm` too using the recommended installation method
brew install ncdu # find where your diskspace went
brew install tree # present the content of a given directory

# Remove outdated versions from the cellar
brew cleanup
