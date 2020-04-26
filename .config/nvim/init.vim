" Plugins
call plug#begin()
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-airline/vim-airline'
    Plug 'joshdick/onedark.vim' "My theme
call plug#end()

" Set linenumbers
set number relativenumber
" Make search more helpful
set incsearch
set hlsearch
" Show cursor position
set ruler
" Set terminal's title
set title
" Default encoding
set encoding=utf-8

" Tabs and spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" always show status bar
set ls=2

" syntax highlighting
syntax on
colorscheme onedark
let g:airline_theme='onedark'
filetype plugin indent on

" tab navigation  
map tn :tabn<CR> 
map tp :tabp<CR> 
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR> 
map <C-S-Right> :tabn<CR> 
imap <C-S-Right> <ESC>:tabn<CR> 
map <C-S-Left> :tabp<CR> 
imap <C-S-Left> <ESC>:tabp<CR>

" Allow simple resizing of panes
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" when scrolling, keep cursor 5 lines away from screen border
set scrolloff=3
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest 

" better backup, swap and undos storage
set directory=~/.config/nvim/dirs/tmp    	" directory to place swap files in
set backup				" make backup files
set backupdir=~/.config/nvim/dirs/backups	" where to put backup files
set undofile				" persistent undos - undo after you re-open the file
set undodir=~/.config/nvim/dirs/undos
silent! set viminfo+=~/.config/nvim/ndirs/viminfo

" create needed directories if they don't exist
if !isdirectory(&backupdir)
	call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
	call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
	call mkdir(&undodir, "p")
endif

" ============================================================================
" Plugins settings and mappings
