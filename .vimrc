set nocompatible " 非兼容模式
filetype on " 自动识别文件格式
filetype indent on " 依据文本类型进行缩进
filetype plugin on
filetype plugin indent on

let mapleader=" "
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" this vim, the base editor! Directer
noremap K 5kzz
noremap J 5jzz
noremap <C-D> 5<C-E>
noremap <C-U> 5<C-Y>
noremap n nzz "zz可以让当前行居中
noremap N Nzz
noremap * *zz
noremap # #zz
" Ctrl + c 替换"
noremap <C-c> yiw:%s/<C-r>0//g<Left><Left>
noremap <C-\> ^xx<Down> " Ctrl+\进行去注释
noremap \ I# <ESC><Down> " \对改行加注释
map <C-f> #* "让Ctrl+f变成查找当前单词
noremap <ESC> :nohlsearch<CR><ESC> " 按ESC清除高亮的搜索结果
noremap <esc>^[ <esc>^[
noremap W :inoremap ( ()<><Left>Left<CR>:inoremap [ []<><Left>Left<CR>:inoremap { {}<><Left>Left<CR>:inoremap ' ''<><Left>Left<CR>:inoremap " ""<><Left>Left<CR>:inoremap < <><><Left>Left<CR>:set relativenumber<CR>:set number<CR>:set autoindent<CR>:set smartindent<CR> " Ctrl+W启动输入成对括号
noremap E :inoremap ( (<CR>:inoremap [ [<CR>:inoremap { {<CR>:inoremap ' '<CR>:inoremap " "<CR>:inoremap < <<CR>:set norelativenumber<CR>:set nonumber<CR>:set noautoindent<CR>:set nosmartindent<CR> " Ctrl+E关闭成对括号
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap < <><Left>

map s :w<CR>
map Q :q<CR>
map S :wq<CR>
map <leader>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s
inoremap <C-a> <Esc>A
inoremap <C-i> <Esc>I

syntax on " 语法高亮
colorscheme desert " 设置主题颜色
set encoding=utf-8
"set list
set number " 显示行号
set relativenumber " 显示相对行号
" set cursorline " 当前行显示下划线
set wrap " 当这一行太长的时候，就自动换行显示
set wildmenu " 命令栏输入指令的时候，按tab键出来候选项
set ignorecase " 搜索的时候忽略大小写
set smartcase " 全为小写的时候忽略大小写，有大写的时候还是要求大小写的
set showcmd
set hlsearch " 高亮搜索词
set incsearch " 在输入的时候就高亮搜索结果了
set autoindent " 自动缩进，和上一行保持一致
set smartindent " 会依据文件语法只能缩进
set showmatch " 显示括号匹配
set fdm=syntax " 依据语法自动折叠
set expandtab " 将tab键用空格代替
set tabstop=4 " 让tab等于4个空格
set softtabstop=4
set shiftwidth=4 " 让缩进变为4个空格
set backspace=2
set scrolloff=5
" 安装插件
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-cursorword'
call plug#end()

" airline"
" tu打开新的tab
map tu :tabe<CR>:e 
" tn下一个tab
map tn :+tabnext<CR>
" tp上一个tab
map tp :-tabnext<CR>
set laststatus=2  "永远显示状态栏
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
if has("autocmd")
    " 当进入Vim时，将光标位置设置为先前关闭文件时的位置。
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
