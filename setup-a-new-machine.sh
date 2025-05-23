# copy paste this file in bit by bit.
# don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1


##############################################################################################################
###  backup old machine's key items

mkdir -p ~/migration/home/
mkdir -p ~/migration/Library/"Application Support"/
mkdir -p ~/migration/Library/Preferences/
mkdir -p ~/migration/Library/Application Support/
mkdir -p ~/migration/rootLibrary/Preferences/SystemConfiguration/

cd ~/migration

# what is worth reinstalling?
brew leaves              > brew-list.txt    # all top-level brew installs
npm list -g --depth=0    > npm-g-list.txt
yarn global list --depth=0 > yarn-g-list.txt

# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)

# backup some dotfiles likely not under source control
cp -Rp \
    ~/.bash_history \
    ~/.extra \
    ~/.gitconfig.local \
    ~/.ssh \
    ~/.z   \
        ~/migration/home

cp -Rp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/migration/rootLibrary/Preferences/SystemConfiguration/ # wifi

cp -Rp ~/Library/Services ~/migration/Library/ # automator stuff
cp -Rp ~/Library/Fonts ~/migration/Library/ # all those fonts you've installed

# also consider...
# random git branches you never pushed anywhere?
# git untracked files (or local gitignored stuff). stuff you never added, but probably want..

# usage logs you've been keeping.

# software licenses.

# maybe ~/Desktop and such
cp -Rp ~/Desktop ~/migration
cp -Rp ~/Downloads ~/migration

### end of old machine backup
##############################################################################################################



##############################################################################################################
### XCode Command Line Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

# !!! doesnt work, need to update this section..

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi
###
##############################################################################################################



##############################################################################################################
### homebrew!

# (if your machine has /usr/local locked down (like google's), you can do this to place everything in ~/homebrew
# mkdir $HOME/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/homebrew
# export PATH=$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH
# maybe you still need an LD_LIBRARY export thing
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# install all the things
./brew.sh
./brew-cask.sh

# promt dropbox login to start downloading.
open /Applications/Dropbox.app

### end of homebrew
##############################################################################################################




##############################################################################################################
### install of common things
###

# autocompletion for git branch names https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash


# type `git open` to open the GitHub page or website for a repository
npm install -g git-open

# npm alternative
npm install -g yarn

# better workflow than npm/yarn link for package authors
npm install -g yalc

# trash as the safe `rm` alternative
npm install -g trash-cli

# A simple server for static files.
npm install -g statikk

# consider reusing your current .z file if possible. it's painful to rebuild :)
# z is hooked up in .bash_profile


# iterm with more margin! http://hackr.it/articles/prettier-gutter-in-iterm-2/
#   (admittedly not as easy to maintain)

# install nvm (Node Version Nanager, https://github.com/nvm-sh/nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash


###
##############################################################################################################


##############################################################################################################
### remaining configuration
###

# go read mathias, paulmillr, gf3, alraa's dotfiles to see what's worth stealing.

# prezto and antigen communties also have great stuff
#   github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh

# set up macos defaults
#   maybe something else in here https://github.com/hjuutilainen/dotfiles/tree/master/bin
sh .macos

# setup and run Rescuetime!

###
##############################################################################################################



##############################################################################################################
### symlinks to link dotfiles into ~/
###

#   move git credentials into ~/.gitconfig.local      http://stackoverflow.com/a/13615531/89484
#   now .gitconfig can be shared across all machines and only the .local changes

# symlink it up!
./symlink-setup.sh

# set up Dropbox file symlinks
ln -sf ~/Library/CloudStorage/Dropbox/dotfiles/.extra ~/
ln -sf ~/Library/CloudStorage/Dropbox/dotfiles/.extrarc ~/
ln -sf ~/Library/CloudStorage/Dropbox/dotfiles/.gitconfig.local ~/
ln -sf ~/Library/CloudStorage/Dropbox/dotfiles/.ssh/ ~/

# add manual symlink for .ssh/config and probably .config/fish

###
##############################################################################################################
