"[License: public domain]"
"[Author: Karlkorp]"
"[Plug-ins list]"
"+------------------+-------------------------------------------------+
"| CtrlP            | https://github.com/kien/ctrlp.vim               |
"| Undotree         | https://github.com/mbbill/undotree              |
"| Python-Mode      | https://github.com/klen/python-mode             |
"| Tagbar           | https://github.com/majutsushi/tagbar            |
"| Tabular          | https://github.com/godlygeek/tabular            |
"| Vim-Perl         | https://github.com/vim-perl/vim-perl            |
"| Surround         | https://github.com/tpope/vim-surround           |
"| Vim-Startify     | https://github.com/mhinz/vim-startify           |
"| NERDTree         | https://github.com/scrooloose/nerdtree          |
"| DelimitMate      | https://github.com/Raimondi/delimitMate         |
"| Vundle           | https://github.com/gmarik/Vundle.vim.git        |
"| SnipMate         | https://github.com/msanders/snipmate.vim        |
"| EasyMotion       | https://github.com/Lokaltog/vim-easymotion      |
"| AutoComplPop     | https://github.com/vim-scripts/AutoComplPop     |
"| Multiple-Cursors | https://github.com/terryma/vim-multiple-cursors |
"+------------------+-------------------------------------------------+
"[Colorschemes list]
"+------------------+-------------------------------------------------+
"| Molokai          | https://github.com/tomasr/molokai               |
"| Mirodark         | https://github.com/djjcast/mirodark             |
"+------------------+-------------------------------------------------+
"[To disable compatibility with Vi]"
set nocompatible
"[Use Plug-ins and Plug-in Manager(Vundle) only on UNIX or MAC OS]"
filetype off
if has("unix") || has("mac")
    if !isdirectory(expand("$HOME/.vim/bundle"))
        silent !mkdir -p $HOME/.vim/bundle
        silent cd $HOME/.vim/bundle
        silent !git clone https://github.com/gmarik/Vundle.vim.git
        silent cd $HOME
    endif
    set runtimepath+=$HOME/.vim/bundle/Vundle.vim

    "[Set viminfo manually]"
    if !isdirectory(expand("$HOME/.vim/files/info"))
        silent !mkdir -p $HOME/.vim/files/info
    endif
    set viminfo='100,n$HOME/.vim/files/info/viminfo
else
    if !isdirectory(expand("$HOME\vimfiles\bundle"))
        silent cd $HOME
        silent !mkdir vimfiles\bundle
        silent cd $HOME\vimfiles\bundle
        silent !git clone https://github.com/gmarik/Vundle.vim.git
        silent cd $HOME
    endif
    set runtimepath+=$HOME\vimfiles\bundle\Vundle.vim
endif

"[Download and install Vundle Plug-in Manager]"
try
    "[Run Plug-ins]"
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    map <F2> :VundleInstall<CR>
    map <F3> :VundleUpdate<CR>
    if has("python")
        Plugin 'klen/python-mode'
    endif
    "if has("perl")
    "	Plugin 'vim-perl/vim-perl'
    "endif
    "if has("ruby")
    "	Plugin 'terryma/vim-multiple-cursors'
    "endif
    Plugin 'majutsushi/tagbar'
    map <F4> :TagbarToggle<CR>
    Plugin 'mbbill/undotree'
    map <F5> :UndotreeToggle<CR>
    Plugin 'scrooloose/nerdtree'
    map <F6> :NERDTreeToggle<CR>
    Plugin 'AutoComplPop'
    Plugin 'kien/ctrlp.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'tpope/vim-surround'
    Plugin 'mhinz/vim-startify'
    Plugin 'Raimondi/delimitMate'
    Plugin 'msanders/snipmate.vim'
    Plugin 'Lokaltog/vim-easymotion'
    "[Vim colorschemes]"
    Plugin 'tomasr/molokai'
    Plugin 'djjcast/mirodark'
    call vundle#end()
catch
endtry

"[Recognize the type/syntax of the file]"
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
"[Enable built-in plug-ins/macros]"
runtime macros/matchit.vim
"[Enable syntax highlighting]"
syntax on
"[Read the changes after the save .vimrc]"
if has("autocmd")
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC
endif
"[Define the leader key]"
let mapleader=","
"[List of buffers]"
map <F7> :ls!<CR>:buffer<Space>
"[Reselect visual block after indent/outdent]"
vnoremap < <gv
vnoremap > >gv
"[Improve up/down movement on wrapped lines]"
nnoremap j gj
nnoremap k gk
"[Clear search highlights]"
nnoremap // :nohlsearch<CR>
"[Easy split navigation]"
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"[Locate the desired objects in the center of the screen]"
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
"[New line under/bellow current line without jump to insert-mode]"
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
"[Auto-complete parenthesis, brackets and braces, quotes]"
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
"[Easy jump into the normal-mode from the insert-mode]"
inoremap jj <Esc>
"[To move over parenthesis, brackets, quotes in insert-mode]"
inoremap kk <Right>
inoremap hh <Left>
"[Easy omni-completion with Ctrl-Space]"
inoremap <C-Space> <C-X><C-O>
"[To disable the arrow keys]"
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        execute prefix . "noremap " . key . " <Nop>"
    endfor
endfor
"[Threshold for reporting number of lines changed]"
set report=0
"[Show command in the last line of the screen]"
set showcmd
"[Show both the tag name and a tidied-up form of the search pattern]"
set showfulltag
"[Don't give the intro message when starting Vim]"
set shortmess=""
if has("unix") || has("mac")
    set shortmess+=I
endif
"[Always show StatusLine]"
set laststatus=2
"[Define StatusLine]"
set statusline=""
set statusline+=%F%m%r%h%w
set statusline+=%=%y
set statusline+=\ [%{&ff}]
set statusline+=\ Line:%l/%L[%p%%]
set statusline+=\ Column:[%v]
set statusline+=\ Buffer:[%n]
set statusline+=\ Mode:[%{ShowModeInStatusLine()}]
"[Splitting rules]"
set splitbelow
set splitright
set equalalways
"[Lisp coding settings]"
if (&filetype == "lisp")
    set lisp
endif
"[Use the mouse in terminal]"
set mouse=a
set mousemodel=extend
"[Hide mouse while printing the text]"
set mousehide
"[Visualisation settings]"
set background=dark
set ttyfast
set showmode
set tabline=""
set cmdheight=1
set showtabline=0
set colorcolumn=""
set nocursorcolumn
set cmdwinheight=10
set virtualedit=all
"[GUI/Color Scheme/Font settings]"
if has("gui_running")
    winsize 90 50
    silent cd $HOME
    set linespace=0
    set guioptions=""
    set guitablabel=""
    if has("autocmd")
        autocmd InsertEnter * set cursorline
        autocmd InsertLeave * set nocursorline
    endif
    if has("win32") || has("win64")
        try
            colorscheme desert
            set guifont=PT_Mono:h11
        catch
        endtry
    elseif has("unix")
        try
            colorscheme mirodark
            set guifont=PT\ Mono\ 11
        catch
        endtry
    elseif has("mac")
        try
            set antialias
            colorscheme molokai
            set guifont=Monaco:h11
        catch
        endtry
    endif
else
    if has("unix") || has("mac")
        try
            set t_Co=256
            colorscheme molokai
        catch
        endtry
    endif
endif
"[Backspace functions]"
set backspace=indent,eol,start
"[Scroll settings]"
set scrolloff=10
set scrolljump=10
set showmatch
set matchpairs=""
set matchpairs+=(:)
set matchpairs+={:}
set matchpairs+=[:]
set matchpairs+=<:>
"[Turn backup off and value of history]"
set nobackup
set noswapfile
set history=1000
set nowritebackup
set undolevels=5000
"[Indent & Tab/mode-line settings]"
set nopaste
set modeline
set smarttab
set tabstop=8
set expandtab
set autoindent
set copyindent
set smartindent
set cinwords=""
set modelines=1
set shiftwidth=4
set softtabstop=4
set cinwords+=except,finally,def,class,with,do
set cinwords+=if,elif,else,for,while,try,switch
"[TextWidth settings]"
set textwidth=80
"[Settings of line numbers]"
set number
set numberwidth=2
set relativenumber
"[Don't show current position]"
set noruler
"[For regular expressions turn magic on]"
set magic
"[Search settings]"
set hlsearch
set incsearch
set smartcase
set ignorecase
"[When on, the ":substitute" flag 'g' is default on]"
set nogdefault
"[Language settings]"
set iminsert=0
set imsearch=0
set helplang=en
set langmenu=en
language messages POSIX
"[Show DocName in title]"
set title
"[Hide/show the white-space and more invisible symbols]"
set list
set listchars=tab:\|-,trail:-
set nojoinspaces
"[Folding settings]"
set foldenable
set foldclose=""
set foldcolumn=1
set foldlevel=10
set foldlevelstart=10
set foldmethod=indent
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
"[Set to auto-read and to auto-write when
" a file is changed from the outside]"
set autoread
set autowrite
"[Vim will change the current working directory whenever you
" open a file, switch buffers, delete a buffer or open/close a window]"
set autochdir
"[Not be redrawn while executing macros,
" registers that have not been typed]"
set lazyredraw
"[Time-out settings]"
set timeout
set timeoutlen=3000
set ttimeoutlen=100
"[When off a buffer is unloaded when it is abandoned]"
set hidden
"[Switch between buffers. Settings]"
set switchbuf=useopen,usetab,newtab
"[Wrap settings]"
set wrap
set wrapscan
set whichwrap=<,>,[,]
set nolinebreak
"[Encoding/FileType settings]"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r
"[Use UNIX, DOS, MAC FileType]"
set fileformat=unix
set fileformats=unix,mac,dos
"[Better consistency between Windows and UNIX]"
set sessionoptions=""
set viewoptions=folds,options,cursor,unix,slash
set sessionoptions+=unix,slash,blank,buffers,curdir
set sessionoptions+=folds,help,options,tabpages,winsize
"[Completion settings]"
if has("autocmd")
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    if has("ruby")
        autocmd FileType ruby set omnifunc=rubycomplete#Complete
    endif
    if has("perl")
        autocmd FileType perl set omnifunc=perlcomplete#CompletePERL
    endif
    if has("python")
        autocmd FileType python set omnifunc=pythoncomplete#Complete
    endif
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
endif
"[Completion search settings]"
set complete=.,b,d,i,k,s,t,u,U,w
set completeopt=longest,menuone,preview,menu
"[For jump between Java import statement]"
set includeexpr=substitute(v:fname,'\\.','/','g')
"[Determines the maximum number of items
" to show in the popup menu for Insert mode completion]"
set pumheight=7
"[No annoying sound or errors]"
set noerrorbells
set novisualbell
"[Shared with OS clipboard]"
set clipboard=unnamed
"[Abbreviations]"
cnoreabbrev W w
cnoreabbrev Q q
"[Turn on the wild menu and wild-mode settings]"
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.pyc,*.pyo,*.swp,*.bak,*.exe,*.class
"[Use a GUI dialog when confirming]"
set noconfirm
"[Method used for encryption when the buffer is written to a file]"
if (version <= 702)
    set cryptmethod=zip
else
    set cryptmethod=blowfish
endif
"[Make the scripts executable]"
function! ChangeScriptMode()
    if getline(1) =~ "#!"
        if getline(1) =~ "bin/"
            silent !chmod +x <afile>
        endif
    endif
endfunction
if has("unix") || has("mac")
    if has("autocmd")
        autocmd BufWritePost * call ChangeScriptMode()
    endif
endif
"[Python/Perl scripts templates]"
function! InitScriptFile(type)
    if (a:type == "python")
        execute setline(1, "#!/usr/bin/env python")
        execute setline(2, "# -*- coding: utf-8 -*-")
    elseif (a:type == "perl")
        execute setline(1, "#!/usr/bin/env perl")
        execute setline(2, "")
        execute setline(3, "use warnings;")
        execute setline(4, "use strict;")
    endif
    normal Go
endfunction
if has("autocmd")
    autocmd BufNewFile *.pl,*.pm call InitScriptFile("perl")
    autocmd BufNewFile *.py,*.pyw call InitScriptFile("python")
endif
"[Remove tabs and spaces at the end of lines]"
"[Auto indent file]"
function! DeleteTWAutoIndent()
    normal mb
    silent %s/[ \t]*$//g
    silent %s/\s\+$//ge
    silent normal gg=G
    normal 'b
endfunction
if has("autocmd")
    autocmd BufWritePre *.py,*.pyw retab
    autocmd BufWritePre * call DeleteTWAutoIndent()
endif
"[Show current mode in StatusLine]"
function! ShowModeInStatusLine()
    let g:currentMode = mode()
    let g:showMode = ""
    if (g:currentMode ==# "i")
        let g:showMode = "Insert"
    elseif (g:currentMode ==# "R")
        let g:showMode = "Replace"
    elseif (g:currentMode ==# "n")
        let g:showMode = "Normal"
    else
        let g:showMode = "Visual"
    endif
    return g:showMode
endfunction
