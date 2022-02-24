set nocompatible	 " be iMproved
filetype off

set noerrorbells
set number " relativenumber " Show line numbers
set encoding=utf-8 " Encoding
set ruler " Show file stats
autocmd BufWritePre * %s/\s\+$//e " Delete trailing whitespaces on save
set tabstop=4 softtabstop=4 " number of spaces that <Tab> in file uses
set shiftwidth=4
set expandtab " tab -> spaces (4 tabwidth doesnt work w/o this)
set smartindent
" set nowrap " dont wrap over to next line
set ignorecase  " ignore case in search patterns
set incsearch  " highlight match while typing search pattern
set smartcase  " no ignore case when pattern has uppercase


command! Reload execute "source ~/.vimrc"

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'sickill/vim-monokai'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'vim-scripts/AutoComplPop' " automatically calls built-in autocomp (instead of Ctrl + p)
" Plug 'sheerun/vim-polyglot' " syntax & indent support
" Plug 'honza/vim-snippets' " snippet definitions
" Plug 'SirVer/ultisnips' " snippet engine
" Plug 'junegunn/fzf' " fuzzy find
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

syntax on
colorscheme monokai
set t_Co=256

" autocmd VimEnter * Goyo

let mapleader=" " " space leader for remapping commands

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> : vertical resize 30<CR>


" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" commands for exiting from Goyo
map <leader>q :q<cr>:q<cr>
map <leader>wq :wq<cr>:q<cr>
map <leader>w :w<cr>

" make make comfier
" write file, then call make
map <leader>m :w<cr>:!make<cr>


" fuzzyfind commands:
" Ctrl-X to open file in horizontal split
" Ctrl-V to open file in vertical split
"
" - Popup window (center of the current window)
" - only works in neovim
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
