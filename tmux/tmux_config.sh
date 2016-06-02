#!/bin/sh 

echo "install tmux"
sudo apt-get install tmux -y 

echo "configure tmux" 

cd ~
rm -rf .tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "alias tmux='TERM=screen-256color tmux -2'" >> ~/.bashrc 

