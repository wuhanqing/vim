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
" 状态栏插件
Bundle 'https://github.com/bling/vim-airline.git'
Bundle 'https://github.com/vim-airline/vim-airline-themes.git'
" 侧边栏显示 git 文件修改
Bundle 'https://github.com/airblade/vim-gitgutter.git'
" 自动补全引号等
Bundle 'https://github.com/Raimondi/delimitMate.git'
" 添加注释的插件
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
" 代码缩进线
Bundle 'https://github.com/Yggdroot/indentLine.git'
" 代码对齐
Bundle 'https://github.com/godlygeek/tabular.git'
" 去掉多余空格的插件
Bundle 'https://github.com/bronson/vim-trailing-whitespace.git'
"jade 插件
Bundle 'https://github.com/digitaltoad/vim-jade.git'
" 闭合标签
Bundle 'https://github.com/docunext/closetag.vim.git'


call vundle#end()            " required

filetype plugin indent on    " required
