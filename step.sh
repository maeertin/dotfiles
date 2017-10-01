##############################################################################################################
### symlinks to link dotfiles into ~/
###

#   move git credentials into ~/.gitconfig.local    	http://stackoverflow.com/a/13615531/89484
#   now .gitconfig can be shared across all machines and only the .local changes

# symlink it up!
./symlink-setup.sh

# setting up the sublime packages symlink
#rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
#ln -sf ~/Dropbox/Shared/Sublime\ Text\ 3/Packages ~/Library/Application\ Support/Sublime\ Text\ 3/

# setting up the .extra symlink
ln -sf ~/Dropbox/Shared/.extra ~/

# setting up the ssh key symlink
ln -sf ~/Dropbox/Shared/.ssh/ ~/

# add manual symlink for .ssh/config and probably .config/fish

###
##############################################################################################################
