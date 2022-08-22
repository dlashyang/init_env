#! /bin/sh

set -u

# uncomment pkg install cmd
#packageInstallCmd="sudo apt install"
$packageInstallCmd -y vim screen curl wget

echo "Essential package installed."

# config bash
cp bashrc ~/.bashrc
cp screenrc ~/.screenrc
source ~/.bashrc
echo "Basic bashrc and screenrc copied and applied"

# config vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp vimrc ~/.vimrc
echo "vimrc is copied and applied"

# config git
cp gitconfig ~/.gitconfig
echo "gitconfig is copied, please edit the username in ~/.gitconfig"
