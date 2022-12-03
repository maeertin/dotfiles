	#!/bin/bash

# Install command-line tools using Homebrew

# (Optionally) Turn off brew's analytics https://docs.brew.sh/Analytics
# brew analytics off


# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`
brew install gnu-sed


# Updated shells
# Note: don’t forget to add `/usr/local/bin/<EACHSHELL>` to `/etc/shells` before running `chsh`.
brew install fish

brew install bash-completion


# Install wget
brew install wget

# Install more recent versions of some OS X tools
brew install vim
brew install nano
brew install grep

# z hopping around folders
brew install z

# git utils
brew install gh
brew install git-friendly/git-friendly/git-friendly

# Install other useful binaries
brew install node # This installs `npm` too using the recommended installation method
brew install tree # present the content of a given directory
brew install neovim
brew install ripgrep
brew install ffmpeg
