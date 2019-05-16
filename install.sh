#!/bin/bash

CURRENT_TIME=`date '+%Y-%m-%d-%H-%M-%S'`
# backup files: .vimrc && .vim
if [ -e ~/.vimrc ]; then
    echo "backup your .vimrc"
    echo -e "this is backup by dingrui on $CURRENT_TIME\n`cat ~/.vimrc`" >~/.vimrc
    mv ~/.vimrc{,.$CURRENT_TIME}
    #rm ~/.vimrc
fi
if [ -d ~/.vim ]; then
    echo "backup your .vim"
    echo "this is backup by dingrui on $CURRENT_TIME">>~/.vim/README
    mv ~/.vim{,.$CURRENT_TIME}
fi

# git clone vundle
git clone https://github.com/gmarik/residualspiritqqlin/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/residualspiritqqlin/vim.git ~/.vim/vimrc
git clone https://github.com/residualspiritqqlin/vim-colors-solarized.git ~/.vim/vim-colors-solarized

# promote the autoload priority of vundle
mkdir -p ~/.vim/autoload
ln -s ~/.vim/bundle/Vundle.vim/autoload/vundle.vim ~/.vim/autoload/vundle.vim
mkdir -p ~/.vim/autoload/vundle
ln -s ~/.vim/bundle/Vundle.vim/autoload/vundle/config.vim ~/.vim/autoload/vundle/config.vim

# establing soft link of .vimrc
ln -s ~/.vim/vimrc/.vimrc ~/.vimrc
# installing vim plugins
vim +BundleInstall +qa

# establing soft link of colorscheme
mkdir -p ~/.vim/colors
ln -s ~/.vim/bundle/molokai/colors/molokai.vim ~/.vim/colors/
ln -s ~/.vim/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
