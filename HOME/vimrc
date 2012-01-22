set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set viminfo='20,\"50	" read/write a .viminfo file, don't store more  than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif
"===
"new
"===
"------
" Поиск
"-----
set hlsearch   " Highlight search matches
set incsearch  " Highlight search matches as you type them
set ignorecase " Case-insensitive searching
set smartcase  " If the search pattern contains upper case chars, override 'ignorecase' option
set wrapscan   " Set the search scan to wrap around the file
set gdefault   " By default add 'g' flag to search/replace. Add 'g' to toggle                                   
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
"----------
" Кодировка
"----------
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
"----------
" Табы(окна) в vim
"----------
nmap <S-Left>   :tabprev<CR>
nmap <S-Right>  :tabnext<CR>
nmap <F3>       :tabm<CR>
nmap <F4>       :tabnew<CR>
"----------
" Folding
"----------
set foldmethod=indent
set foldenable
"----------------------
" Настройки табуляторов
"----------------------
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smarttab
"----------
" Вставка из буфера
"----------
""set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
"-------
" Python
"-------
"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1

"-------
" vundle
"-------
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" python syntax check
Bundle 'kevinw/pyflakes-vim'
" python syntax check
Bundle 'nvie/vim-pep8'
" Most Recently Used
"Bundle 'vim-scripts/mru.vim.git'
"NERDtree
Bundle 'scrooloose/nerdtree.git'
nnoremap <F1> :NERDTree<CR>
filetype plugin indent on           " required!
"------
" remap
"------
"-- EOF -- "
