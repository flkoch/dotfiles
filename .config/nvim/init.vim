" Plugins
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp,
" for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'neomake/neomake'
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Git integration
Plug 'motemen/git-vim'
" Tab list panel
Plug 'kien/tabman.vim'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
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
set tabstop=2
set softtabstop=2
set shiftwidth=2

" always show status bar
set ls=2

" syntax highlighting
syntax on

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

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=5
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest 

" better backup, swap and undos storage
set directory=~/nvim/dirs/tmp    	" directory to place swap files in
set backup				" make backup files
set backupdir=~/nvim/dirs/backups	" where to put backup files
set undofile				" persistent undos - undo after you re-open the file
set undodir=~/nvim/dirs/undos
silent! set viminfo+=~/nvim/ndirs/viminfo

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

" CtrlP ------------------------------ 
" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
"  commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
	execute ':CtrlP' . a:ctrlp_command_end
	call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
	\ 'file': '\.pyc$\|\.pyo$',
	\ }

" NeoComplCache
"  ------------------------------ 
" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1 
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan ------------------------------ 
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus = 'tf'

" Autoclose
"  ------------------------------ 
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------ 
" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate() 

" Signify ------------------------------ 

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd		cterm=bold ctermbg=none	ctermfg=119
highlight DiffDelete		cterm=bold ctermbg=none	ctermfg=167
highlight DiffChange		cterm=bold ctermbg=none	ctermfg=227
highlight SignifySignAdd	cterm=bold ctermbg=237	ctermfg=119
highlight SignifySignDelete	cterm=bold ctermbg=237	ctermfg=167
highlight SignifySignChange	cterm=bold ctermbg=237	ctermfg=227
" Window Chooser ------------------------------ 

" mapping
nmap  - <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1 
"  Airline ------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0 

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
