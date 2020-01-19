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
set t_Co=256
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_termcolors=256
" let g:airline_theme="gruvbox"

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

" 设置中文帮助
set helplang=cn

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
"set list listchars=tab:\ \ ,trail:

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set t_Co=256
let g:Powerline_symbols='fancy'

" 显示状态行当前设置

" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"}
" 显示文件编码
" " %{&ff} 显示文件类型
" set statusline=%F%m%r%h%w%=\ [ft=%Y]\
" %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\
" &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\
" [pos=%04l,%04v][%p%%]\ [len=%L]
"
 " 设置 laststatus = 0 ，不显式状态行
 " 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
 " 设置 laststatus = 2 ，总是显式状态行
" set laststatus=2
" Set the status line to something useful
"set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l/%L,%v][%p%%]\%{strftime(\"%Y/%m/%d\ -\ %H:%M\")}


" Hide the toolbar
"set guioptions-=T

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
set cmdheight=1

"高亮go函数名操作符等
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
"autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
"set colorcolumn=80
" }}}

"Plugins{{{{{{
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'Valloric/YouCompleteMe'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'mileszs/ack.vim'
Plug 'powerline/powerline'
call plug#end()

"======================================================================================
"Nerdtree{{{
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '∨'
"}}}
"======================================================================================
"vim-instant-markdown{{{
"manually control launching the preview window when you open a markdown file.
let g:instant_markdown_autostart = 0

"By default, scripts are blocked. To allow scripts to run, edit your .vimrc and add
"let g:instant_markdown_allow_unsafe_content = 1

"For troubleshooting, server startup and curl communication from Vim to the server can be logged into a file.
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'

"Choose a custom port instead of the default 8090.
"let g:instant_markdown_port = 8888
"
"preview via the command :InstantMarkdownPreview and stop it via :InstantMarkdownStop.
"}}}
"======================================================================================
"Ack{{{
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
"}}}
"======================================================================================
"vim-go{{{
"Enable code completion with 'omnifunc'. By default it is enabled.
"let g:go_code_completion_enabled = 1
"  let g:go_version_warning = 1
"  let g:go_code_completion_enabled = 1
"  let g:go_test_show_name = 0
"  let g:go_test_timeout= '10s'
"  let g:go_play_browser_command = 'firefox-developer %URL% &'
"  let g:go_play_browser_command = ''
"  let g:go_play_open_browser = 1
"  let g:go_auto_type_info = 0
"  let g:go_info_mode = 'gopls'
"  let g:go_auto_sameids = 0
"  let g:go_updatetime = 800
"  let g:go_jump_to_error = 1
"  let g:go_fmt_autosave = 1
"  let g:go_fmt_command = "gofmt"
"  let g:go_fmt_options = ''
"  let g:go_fmt_options = {}
"  let g:go_fmt_options = {
"  let g:go_fmt_fail_silently = 0
"  let g:go_fmt_experimental = 0
"  let g:go_mod_fmt_autosave = 1
"  let g:go_doc_keywordprg_enabled = 1
"  let g:go_doc_max_height = 20
"  let g:go_doc_url = 'https://godoc.org'
"  let g:go_doc_popup_window = 0
"  let g:go_def_mode = 'gopls'
"  let g:go_referrers_mode = 'gopls'
"  let g:go_def_mapping_enabled = 1
"  let g:go_def_reuse_buffer = 0
"  let g:go_bin_path = ""
"  let g:go_search_bin_path_first = 1
"  let g:go_snippet_engine = "automatic"
"  let g:go_get_update = 1
"  let g:go_guru_scope = []
"  let g:go_build_tags = ''
"  let g:go_autodetect_gopath = 0
"  let g:go_textobj_enabled = 1
"  let g:go_textobj_include_function_doc = 1
"  let g:go_textobj_include_variable = 1
"  let g:go_metalinter_autosave = 0
"  let g:go_metalinter_autosave_enabled = ['vet', 'golint']
"  let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"  let g:go_metalinter_command = "golangci-lint"
"  let g:go_metalinter_deadline = "5s"
"  let g:go_list_height = 0
"  let g:go_list_type = ""
"  let g:go_list_type_commands = {}
"  let g:go_list_type = "locationlist"
"  let g:go_list_type_commands = {"GoBuild": "quickfix"}
"  let g:go_list_autoclose = 1
"  let g:go_asmfmt_autosave = 0
"  let g:go_term_mode = "vsplit"
"  let g:go_term_height = 30
"  let g:go_term_width = 30
"  let g:go_term_enabled = 0
"  let g:go_term_close_on_exit = 1
"  let g:go_alternate_mode = "edit"
"  let g:go_rename_command = 'gorename'
"  let g:go_gorename_prefill = 'expand("<cword>") =~# "^[A-Z]"' .
"  let g:go_gocode_propose_builtins = 1
"  let g:go_gocode_propose_source = 0
"  let g:go_gocode_unimported_packages = 0
"  let g:go_gocode_socket_type = 'unix'
"  let g:go_gopls_enabled = 1
"  let g:go_gopls_complete_unimported = 0
"  let g:go_gopls_deep_completion = 1
"  let g:go_gopls_fuzzy_matching = 1
"  let g:go_gopls_staticcheck = 0
"  let g:go_gopls_use_placeholders = 0
"  let g:go_diagnostics_enabled = 0
  let g:go_template_autocreate = 0
"  let g:go_template_file = "hello_world.go"
"  let g:go_template_test_file = "hello_world_test.go"
"  let g:go_template_use_pkg = 0
"  let g:go_decls_includes = 'func,type'
"  let g:go_decls_mode = ''
"  let g:go_echo_command_info = 1
"  let g:go_echo_go_info = 1
"  let g:go_statusline_duration = 60000
"  let g:go_addtags_transform = 'snakecase'
"  let g:go_debug = []
"  let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
"  let g:go_fold_enable = ['import']
"  let g:go_fold_enable = []
"  let g:go_highlight_array_whitespace_error = 0
"  let g:go_highlight_chan_whitespace_error = 0
"  let g:go_highlight_extra_types = 0
"  let g:go_highlight_space_tab_error = 0
"  let g:go_highlight_trailing_whitespace_error = 0
"  let g:go_highlight_operators = 0
"  let g:go_highlight_functions = 0
"  let g:go_highlight_function_parameters = 0
"  let g:go_highlight_function_calls = 0
"  let g:go_highlight_types = 0
"  let g:go_highlight_fields = 0
"  let g:go_highlight_build_constraints = 0
"  let g:go_highlight_generate_tags = 0
"  let g:go_highlight_string_spellcheck = 1
"  let g:go_highlight_format_strings = 1
"  let g:go_highlight_variable_declarations = 0
"  let g:go_highlight_variable_assignments = 0
"  let g:go_highlight_diagnostic_errors = 1
"  let g:go_highlight_diagnostic_warnings = 1


"}}}
"======================================================================================
"air_line{{{
let g:airline_theme="dark" 

"这个是安装字体后 必须设置此项" 
"let g:airline_powerline_fonts = 1   
 
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.space = "\ua0"
    let g:airline_exclude_filename = []
    let g:Powerline_symbols='fancy'
    let g:airline_powerline_fonts=0
    let Powerline_symbols='fancy'
    let g:bufferline_echo=0
    set laststatus=2
    set t_Co=256
    "set fillchars+=stl:\ ,stlnc:\

"}}}
"======================================================================================
"}}}}}}

"Mappings{{{
nmap <Space> za
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>r :source $MYVIMRC<cr>
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>pi :PlugInstall<cr>
map <leader><cr> :set nohlsearch<cr>
map <F5> :GoRun<cr>
imap <F8> <C-x><C-o>
map <F2> :vnew $MYVIMRC<cr>
"}}}

"Commands{{{
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

let g:ycm_use_clangd = 0
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Go to previous (last accessed) window.
autocmd vimenter * wincmd w
"autocmd VimEnter * <C-w>w

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
        call append(0,"//*************************************")
        call append(1,"//")
        call append(2,"//作者:zimingzpp")
        call append(3,"//Github:https://guthub.com/zimingzpp")
        call append(4,"//创建时间:".strftime("%F %T"))
        call append(5,"//文件名:".expand("%"))
        call append(6,"//文件描述:")
        call append(7,"//文件编码: utf-8")
        call append(8,"//*************************************")
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
"}}}
