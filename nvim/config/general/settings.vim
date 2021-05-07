" General settings for Neovim out of the box.
"
" @author Maciej Bedra

" Set leader key
let g:mapleader = "\<Space>"

" Enable syntax highlighting
syntax enable

" Keep multiple buffers open
set hidden

" Long lines not wrapped
set nowrap

" Default encoding
set encoding=utf-8
set fileencoding=utf-8

" Smaller pop up menu
set pumheight=10

" Show cursor position all the time
set ruler

" More space for messages
set cmdheight=2

" Treat dash separated words as a word text object
set iskeyword+=-

" Enable mouse
set mouse=a

" Horizontal splits on bottom
set splitbelow

" Vertical splits on right
set splitright

" 256 colors support
set t_Co=256

" More visible '`' character
set conceallevel=0

" 2 Spaces for TAB
set tabstop=2

" 2 Spaces for indention
set shiftwidth=2

" Smart TAB's
set smarttab

" Convert TAB's to Spaces
set expandtab

" Smart indents
set smartindent

" Support auto indent
set autoindent

" Status line
set laststatus=0

" Line numbers
set number relativenumber

" Highlight current line
set cursorline

" Smooth scroll
set so=999

" Max line length
set colorcolumn=120

" Background color
set background=dark

" Transparent background
autocmd VimEnter * hi Normal ctermbg=none

" Show TAB's
set showtabline=2

" Do not display mode
set noshowmode

" Disable backup
set nobackup
set nowritebackup

" Faster completion
set updatetime=300

" Short timeout
set timeoutlen=500

" Stop new line comment continuation
set formatoptions-=cro 

" Shared clipboard
set clipboard=unnamedplus

" Spell check
set spell spelllang=en_us,pl

" Auto source while writing to init.vim
au! BufWritePost $MYVIMRC source %      
cmap w!! w !sudo tee %
