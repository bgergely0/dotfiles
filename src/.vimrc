set nocompatible	 " be iMproved
filetype off

set noerrorbells
set number " relativenumber " Show line numbers
set cursorline " aim help
set cursorcolumn
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
set laststatus=2
set statusline+=%{wordcount().words}\ words
set signcolumn=yes " so the error column is always there

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
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-scripts/AutoComplPop' " automatically calls built-in autocomp (instead of Ctrl + p)
Plug 'sheerun/vim-polyglot' " syntax & indent support
Plug 'honza/vim-snippets' " snippet definitions
Plug 'SirVer/ultisnips' " snippet engine
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'mbbill/undotree'
Plug 'preservim/tagbar'
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:rustfmt_autosave = 1
let g:tagbar_width = 50

autocmd BufWritePost *.py !black %

syntax on
colorscheme monokai
set t_Co=256
"let g:airline_theme='minimalist'

" autocmd VimEnter * Goyo

let mapleader=" " " space leader for remapping commands

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> : vertical resize 30<CR>
nnoremap <leader>v ::Vex <CR>

" commands for exiting from Goyo (or exiting 2 pages at once)
map <leader>q :q<cr>:q<cr>
map <leader>wq :wq<cr>:q<cr>
map <leader>w :w<cr>

" make make comfier
" write file, then call make
map <leader>m :w<cr>:!make<cr>

" Tagbar
map <leader>t :TagbarToggle<cr>

nnoremap <leader>u :UndotreeToggle<CR>

map <leader>gd :call LanguageClient_textDocument_definition({'gotoCmd': 'vs'})<cr>
map <leader>i :call LanguageClient_textDocument_hover()<cr>
map <leader>r :call LanguageClient_textDocument_references()<cr>

let g:LanguageClient_serverCommands = {
  \ 'rust': ['rust-analyzer'],
  \ 'cpp': ['clangd'],
  \ 'c': ['clangd'],
  \ 'python' : ['pylsp'],
  \ }

  " \ 'tex' : ['~/.cargo/bin/texlab'],
  " \ 'systemverilog' : ['~/.cargo/bin/svls']
