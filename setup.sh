#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
#curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
#source $HOME/.nvm/nvm.sh
#nvm install v0.10.12
#nvm use v0.10.12

#load npm
sudo apt-get install -y npm

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
sudo npm install -g jshint

#Fix for yo bug on ubuntu
#You need to manually create a symlink /usr/bin/node
sudo ln -s /usr/bin/nodejs /usr/bin/node

#Install yo and express generator
sudo npm install -g yo
sudo npm install -g generator-express

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

#Custom Actions -dkeresteci

#Add gitignore file
cp /home/ubuntu/setup/.gitignore_global /home/ubuntu/.gitignore_global
cp /home/ubuntu/setup/.gitconfig /home/ubuntu/.gitconfig
git config --global user.name dkeresteci
git config --global user.email dkeresteci@gmail.com

#Install Parse

#curl -s https://www.parse.com/downloads/cloud_code/installer.sh | sudo /bin/bash
