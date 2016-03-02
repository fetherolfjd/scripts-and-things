set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set showcmd
set ruler
set hlsearch
set nocompatible
set history=50
set incsearch
set ignorecase
set smartcase
set number
set showmatch
set nowrap
set noswapfile
set nobackup
set nowritebackup
set visualbell
set noerrorbells
set modeline
set ttyscroll=0
set ttyfast
set splitright
set splitbelow
set scrolloff=5
set magic
set history=1000
set undolevels=1000
set backspace=indent,eol,start
syntax on
colorscheme slate

" Always show status line
set laststatus=2

set statusline=             " Reset status line
set statusline+=%F          " Full path to the file
set statusline+=%r          " Read only flag
set statusline+=%m          " Modified flag
set statusline+=%=          " Switch to the right side
set statusline+=%04l        " Current line
set statusline+=\|          " Separator
set statusline+=%04c        " Current column

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
"
" " Let Vundle manage Vundle
" Bundle 'gmarik/vundle'
"
" " Vundle Bundles
" Bundle 'scrooloose/syntastic'
" Bundle 'scrooloose/nerdtree'
" Bundle 'kien/ctrlp.vim'

" Automatically set the current dir to this files location
" autocmd BufEnter * silent! lcd %:p:h

" For Python files, use 4 space indentations
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" Remove any trailing whitespace or empty lines with whitespace on save
autocmd BufWritePre <buffer> :call StripTrailingWhitespace()

" Turn on the bar above the command line when opening files
set wildmenu
set wildmode=full
set completeopt=menu,preview

nnoremap <silent> [ :tabprevious<CR>
nnoremap <silent> ] :tabnext<CR>

" Remap jj to exit insert mode
imap jj <Esc>

" Remap semicolon to enter commands
nmap ; :

" Autoindent entire block
nmap <Tab> =%

" Insert new line without enterin insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Set custom leader
let mapleader=","

" git mappings
" Bring up visual log display of file
" nmap <silent><leader>vt :!gitk <c-r>% &<CR><CR>

" NERDTree
" nmap <leader>n :NERDTreeToggle<CR>
" let NERDTreeHighlightCursorline=1
" let NERDTreeIgnore = ['tmp', 'pkg']

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
" let g:syntastic_php_checkers=["php"]

" ctrlp
" nnoremap <silent> <c-p> :CtrlP /Users/jfetherolf/repos/dcsdSoftware<cr>
" let g:ctrlp_working_path_mode=0
" let g:ctrlp_working_path_mode=''
" let g:ctrlp_by_filename=1
" let g:ctrlp_max_files=0
" let g:ctrlp_regexp=0
" let g:ctrlp_mruf_max=1000
" " let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
" set wildignore+=*.class


" Custom Functions

" strips trailing whitespace from file.
function! StripTrailingWhitespace()
  " save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " e suppresses any errors
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
