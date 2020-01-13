" Settings {{{
" Switch syntax highlighting on, when the terminal has colors
syntax on

"开启相关插件"
"侦测文件类型"
filetype on

"载入文件类型插件"
filetype plugin on

"带有如下符号的单词不要被换行分割"
set iskeyword+=_,$,@,%,#,-

"为特定文件类型载入相关缩进文件"
filetype indent on

" 保存全局变量
set viminfo+=!

"设置颜色主题
colorscheme gruvbox
set background=dark

"当文件在外部被修改时，自动更新该文件"
set autoread
" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=1000

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers
set number

" Highlight tailing whitespace
" See issue: https://github.com/Integralist/ProVim/issues/4
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
"set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l/%L,%v][%p%%]\%{strftime(\"%Y/%m/%d\ -\ %H:%M\")}

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

"显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

" 总是显示状态行
set cmdheight=2
" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
"autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
"set colorcolumn=80
" }}}

"Plugins{{{{{{
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mileszs/ack.vim'
call plug#end()

"Nerdtree
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '∨'

"Ack
"?    a quick summary of these keys, repeat to close
"o    to open (same as Enter)
"O    to open and close the quickfix window
"go   to preview file, open but maintain focus on ack.vim results
"t    to open in new tab
"T    to open in new tab without moving to it
"h    to open in horizontal split
"H    to open in horizontal split, keeping focus on the results
"v    to open in vertical split
"gv   to open in vertical split, keeping focus on the results
"q    to close the quickfix window
"}}}}}}

"Mappings{{{
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>r :source $MYVIMRC<cr>
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>pi :PlugInstall<cr>
map <leader><cr> :set nohlsearch<cr>
"}}}

"Commands{{{
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.go exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func! SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    elseif &filetype == 'GO'
        call setline(1,"//Author:zimingzpp")
        call setline(2,"//Github:https://guthub.com/zimingzpp")
        call setline(3,"//CreateTime:".strftime("%F %T"))
        call setline(4,"//FileName:".expand("%"))
        call setline(5,"//Description:")
        call setline(6,"//Encoding: utf-8")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+1, "#include<cstring>")
        call append(line(".")+2, "#include<algorithm>")
        call append(line(".")+3, "#include<cmath>")
        call append(line(".")+4, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal Go
"按<F5>编译运行
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if $filetype == 'Go'
        exec "!go  build %<"
        exec "!time go run %"
    endif
endfunc
"}}}}}}
