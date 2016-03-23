set nocompatible              " be iMproved, required
filetype off                  " required

" 此处规定Vundle的路径 set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 配置插件
Bundle 'https://github.com/scrooloose/nerdtree.git'
" 文件目录插件
Bundle 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
" 侧边栏显示 git 文件修改
Bundle 'https://github.com/airblade/vim-gitgutter.git'
