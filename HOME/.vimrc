"-------
" vundle
"-------
    " init
        filetype off
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
    
    " plugins
        " common
        Bundle 'git://github.com/altercation/vim-colors-solarized.git'
        Bundle 'git://github.com/ervandew/supertab.git'
        Bundle 'git://github.com/scrooloose/nerdtree.git'
        Bundle 'git://github.com/vim-scripts/Tagbar.git'
        Bundle 'git://github.com/mattn/zencoding-vim.git'
    
        " Python
        Bundle 'git://github.com/nvie/vim-flake8.git'
        "Bundle 'kevinw/pyflakes-vim'
        "Bundle 'python.vim'
        "Bundle 'python_match.vim'
        "Bundle 'pythoncomplete'
    
    
        Bundle 'nvie/vim-pep8'
    
        " markup
        Bundle 'git://github.com/othree/html5.vim.git'
        Bundle 'git://github.com/hail2u/vim-css3-syntax.git'
        Bundle 'git://github.com/skammer/vim-css-color.git'
    
        " client-side scripts
        Bundle 'git://github.com/pangloss/vim-javascript.git'
        Bundle 'git://github.com/itspriddle/vim-jquery.git'
        Bundle 'git://github.com/kchmck/vim-coffee-script.git'
     
    
    filetype plugin indent on           " required!

"---------------
" plugins config
"---------------
    " NERDTree
        nnoremap <F1> :NERDTree<CR>
        let NERDTreeIgnore = ['\.pyc$', '\.swp$']

    " tagbar
        let g:tagbar_ctags_bin = '/opt/local/bin/ctags'
        let g:tagbar_usearrows = 1
        let g:tagbar_left = 1
        let g:tagbar_width = 26
        let g:tagbar_compact = 1
        map <F5> :TagbarToggle<CR>

    " OmniComplete
        let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

        highlight Pmenu  ctermbg=7 ctermfg=8 cterm=bold term=bold

        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,longest
        let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


"---------
" text
"---------
    set textwidth=80
    set formatoptions-=o    " dont continue comments when pushing o/O
    set linebreak           " Перенос не разрывая слов

"---------
" color
"---------
    syntax on
    if &term=="xterm"
         set t_Co=8
         set t_Sb=[4%dm
         set t_Sf=[3%dm
    endif
    set t_Co=256            " Кол-во цветов

    let python_highlight_all = 1

    " cursor
        set so=999  " Keep cursor matches in the middle of the window.
        "set cursorline
        "hi CursorLine ctermbg=147 cterm=NONE

    " theme
    set background=dark
    color solarized                 " load a colorscheme
            let g:solarized_termtrans=1
            let g:solarized_termcolors=256
            let g:solarized_contrast="high"
            let g:solarized_visibility="high"
    syntax enable



"---------
" wildmenu
"---------
    set wildmode=list:longest,full  " Автодополнение на манер zsh
    set wildmenu                    " suggest on tab
    set wildignore+=.hg,.git,.svn
    set wildignore+=*.DS_Store
    set wildignore+=*.swp
    set wildignore+=*.pyc

"-----------------------
" sessions and tmp files 
"-----------------------
    " Backup и swp файлы
        set backupdir=~/.vimi/bac//,/tmp " Директория для backup файлов
        set directory=~/.vimi/swp//,/tmp " Директория для swp файлов
    
    " Загрузка предыдущей сессии
        set viminfo='10,\"100,:20,%,n~/.viminfo
        " Устанавливаем курсор в файле на место, где он был при закрытии этого файла
        au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"-----
" keys 
"-----
    map <C-Up> <C-W>k
    map <C-Down> <C-W>j
    map <C-Right> <C-W>l
    map <C-Left> <C-W>h
    
    nnoremap <Esc><Esc> qall


" new new
"------------------------------------------------------------------------------
set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ruler		" show the cursor position all the time

"===
"new
"===
"-------
" search 
"-------
    hi Search cterm=none ctermbg=3 ctermfg=8
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
    set nofoldenable 
    "set foldenable

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
    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2>
    set showmode

nmap [1;2D :tabprev<CR>
nmap [1;2C :tabnext<CR>

autocmd FileType sh set softtabstop=2 
autocmd FileType sh set shiftwidth=2
autocmd FileType sh set tabstop=2 
"---- 
" EOF
"----
