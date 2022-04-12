#!/bin/bash
#let g:DIR_VIMPLUG = "~/.vim/autoload/plug.vim"
#let g:DIR_PLUGINS = "~/.vim/plugged"
#let g:URL_VIMPLUG = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
#let g:CMD_INSTALL_VIMPLUG = "!curl -sfLo ". DIR_VIMPLUG ." --create-dirs " . URL_VIMPLUG
#let g:CMD_INSTALL_NODEJS = "!curl -sL install-node.vercel.app/lts | bash /dev/stdin -f >> /dev/null"

DIR_VIMPLUG="$HOME/.vim/autoload/plug.vim"
URL_VIMPLUG="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

if [ -f "$DIR_VIMPLUG" ]; then
  echo "Vim-Plug is installed."
else
  echo $(curl -sfLo $DIR_VIMPLUG --create-dirs $URL_VIMPLUG)
  echo "Vim-Plug is installed."
fi

v=$(`which node` -v)
#v_str=$((${#v}-1))
version=${v:1:$((${#v}-1))}
NODE=$(echo $version | awk '{if($0 < 16) print "1"; else print "0"}')

if [ "$NODE" == 0 ]; then
  echo "Node 16 is installed."
else
  echo $(curl -sL install-node.vercel.app/lts | bash /dev/null -f >> /dev/null)
  echo "Node 16 is installed."
fi

CURL=$(which curl)


