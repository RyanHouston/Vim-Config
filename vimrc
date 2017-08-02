set nocompatible

call pathogen#infect()
call pathogen#helptags()

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"
" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

let mapleader = ","
syntax on
filetype plugin indent on
set autoread
set autowrite   " Automatically save before commands like :next and :make
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set colorcolumn=80,120 " Mark column widths
set cursorline
set encoding=utf8
set exrc " enable per-directory .vimrc files
set guifont=Ubuntu\ Mono\ 9
set hidden
set laststatus=2 " Status bar
set mouse=a " Enable mouse usage (all modes)
set nowrap
set pastetoggle=<F2>
set scrolloff=3
set secure " disable unsafe commands in local .vimrc files
set showcmd " Show (partial) command in status line.
set showmode
set spell
set title
set omnifunc=syntaxcomplete#Complete

" Searching
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set hlsearch   " Highlight matching search terms
set showmatch   " Show matching brackets.
nmap <silent> ,/ :nohlsearch<CR>

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set copyindent
autocmd FileType make set noexpandtab " Makefile uses real tabs

" Extra filetype options
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.hamlc,*.hamlc.erb set ft=haml
autocmd FileType markdown setlocal spell textwidth=80
autocmd FileType liquid setlocal spell textwidth=80
autocmd FileType vimwiki setlocal spell textwidth=80
autocmd Filetype cucumber setlocal spell
autocmd Filetype gitcommit setlocal spell textwidth=72

" Line numbers
set ruler
set number
set numberwidth=4
nmap <Leader>n :set number! :set number?<CR>
nmap <Leader>rn :set relativenumber<CR>
nmap <Leader>nr :set norelativenumber<CR>

" Fold settings
set foldmethod=indent
set nofoldenable

" Colorscheme
set t_Co=16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
hi Search cterm=NONE ctermfg=black

" Visualize tabs and trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=purple
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
set list
set listchars=tab:>-,trail:-

" Window scrolling
nmap <Right> z<Right>
nmap <Left> z<Left>
nmap <Up> <C-y>
nmap <Down> <C-e>

" Tag navigation
nmap <Leader>j :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <C-\> :pop<CR>

" Jump to last line when the file was last loaded
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Switch between last buffer
nnoremap <leader><leader> <c-^>

" netrw settings
let g:netrw_liststyle=3
"let g:netrw_browse_split=4
let g:netrw_preview=1
let g:netrw_winsize=25
nnoremap <leader>f :Vexplore<CR>

" Gist Options
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Start CtrlP like Command-T
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](cache|tmp|node_modules|coverage)$',
  \}
let g:ctrlp_extensions = ['tag']
nmap <Leader>b :CtrlPBuffer<CR>

" tagbar settings
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" vimwiki settings
let main_wiki = {
  \ 'path':   '~/sync/Documents/notes/wiki/',
  \ 'syntax': 'markdown',
  \ 'ext':    '.md' }

let culturalist_wiki = {
  \ 'path':   '~/sync/Documents/notes/culturalist_wiki/',
  \ 'syntax': 'markdown',
  \ 'ext':    '.md' }

let contactually_wiki = {
  \ 'path':   '~/sync/Documents/notes/contactually_wiki/',
  \ 'syntax': 'markdown',
  \ 'ext':    '.md' }

let g:vimwiki_list = [main_wiki, culturalist_wiki, contactually_wiki]
let g:vimwiki_ext2syntax = {}
let g:vimwiki_global_ext = 0


" Ack.vim
let g:ackhighlight = 1

" Syntastic
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

