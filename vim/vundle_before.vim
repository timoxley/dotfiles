set nocompatible              " be iMproved, required
filetype off                  " required

if !isdirectory(expand("~/.vim/bundle/vundle/"))
  silent !echo "Installing Vundle..."
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

set rtp+=~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/
call vundle#rc()

Bundle "gmarik/vundle"
