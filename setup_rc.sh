#!/bin/env bash
FILES="zshrc vimrc tmux.conf"
HERE=`pwd`

echo -e "Install oh-my-zsh\r\n"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "Install zsh-syntax-highlighting\r\n"
cd ~/.oh-my-zsh/custom/plugins
git clone --depth=1 git://github.com/zsh-users/zsh-syntax-highlighting.git
cd $HERE

echo -e "Install alias-tips"
cd ~/.oh-my-zsh/custom/plugins
git clone --depth=1 https://github.com/djui/alias-tips.git
cd $HERE

echo "Installing VIM Neobudle\r\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh)"
cd $HERE

echo "Install .emacs.d\r\n"
cd ~
git clone --deph=1 https://github.com/mathieupoussin/emacs-rc.git .emacs.d
cd $HERE

echo -e "Installing custom RC\r\n"
for new_file in $FILES; do
  backup_file=~/bkp_$new_file
  echo -e "Processing $new_file"
  mv ~/.$new_file $backup_file &> /dev/null # Old files may not exist
  bzip2 --best $backup_file &> /dev/null # Old files may not exist
  cp -r $new_file ~/.$new_file
done
cd $HERE
