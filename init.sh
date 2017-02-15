# config bash
cp bashrc ~/.bashrc

# config vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc ~/.vimrc

# config git
git config --global --edit
git config --global user.name "dlashyang"
git config --global user.email "dlashyang@gmail.com"
git config --global core.editor vim
git config --global core.autocrlf true
git config --global core.autocrlf input
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.st status
git config --global push.default simple

source ~/.bashrc
