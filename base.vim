" 字体 && 字号
set guifont=Menlo:h13

" history存储容量
set history=500

" Allow buffer switching without saving
set hidden

" insert 模式下 backspace 可以删除
set backspace=indent,eol,start

" Height of the command bar
set cmdheight=1

" au InsertLeave * hi Cursor guibg=red
" au InsertEnter * hi Cursor guibg=green

" 设置 vim 加载到文件底部时，多显示 5 行
set scrolloff=5

" Allow for cursor beyond last character
" set virtualedit=onemore

" 禁用鼠标
" set mouse-=a
set mouse=n
" 文件修改之后自动载入
set autoread

" 关闭交换文件
set noswapfile

" 关闭 search highlight
" set nohlsearch
set hlsearch


" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

set lbr
set textwidth=80
let &colorcolumn="80"

set linespace=5

" 语言设置
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 禁止生成备份文件
set nobackup

" 搜索忽略大小写
set ignorecase

" 高亮search命中的文本。
" set hlsearch

" 搜索逐字符高亮
set incsearch

" 行内替换
set gdefault

" 始终显示行号
set nu

" 显示光标的坐标
set ruler

" 显示光标所在列
set cursorcolumn

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 高亮光标所在行
set cursorline

" 设置Tab键的宽度
set shiftwidth=2

" 文件中显示 tab whitespace
set listchars=tab:>…,trail:-

" 将Tab键更改为两个空格
set tabstop=2

set expandtab

" 与系统共享剪贴板(亲测MacOS)
set clipboard+=unnamed


" let g:rehash256 = 1
set background=dark
" set t_Co=256
" 设置配色方案
" let g:molokai_original = 1
" colorscheme molokai

colorscheme Tomorrow-Night-Eighties
" colorscheme monokai

" let g:solarized_termtrans=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" syntax enable
" set background=dark
" colorscheme solarized


" 禁用自动缩进
set noautoindent


" 去掉输入错误的提示声音
set novisualbell         " don't beep
set noerrorbells         " don't beep
set visualbell t_vb=

" vimrc文件修改之后自动加载。 linux。
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost .vimrc source ~/.vim/*.vim


" 允许折行
set wrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on


noremap H ^
noremap L $

set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
" setlocal foldlevel=1 " 设置折叠层数为
" 默认代码不折叠
set foldlevelstart=99
" set foldclose=all " 设置为自动关闭折叠
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction


highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/



" 关闭所有不在窗口里的 buffer
" http://stackoverflow.com/questions/1534835/how-do-i-close-all-buffers-that-arent-shown-in-a-window-in-vim
command! CloseOtherBuffer call <SID>Wipeout()
function! <SID>Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

command! NumToggle call <SID>NumberToggle()
function! <SID>NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc


" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>


map Y y$



" remap U to <C-r> for easier redo
nnoremap U <C-r>


" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc
