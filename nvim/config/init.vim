" Neovim initialization file.
"
" @author Maciej Bedra

" Configuration for Neovim out of the box
source /root/.config/nvim/general/settings.vim
source /root/.config/nvim/general/keys.vim

" Neovim extensions
call plug#begin('/root/.config/nvim/plugins')
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

" Extensions configuration
source /root/.config/nvim/gruvbox/gruvbox.vim
source /root/.config/nvim/airline/airline.vim
source /root/.config/nvim/nerdtree/nerdtree.vim
source /root/.config/nvim/nerdtree/nerdtree-git.vim
source /root/.config/nvim/startify/startify.vim
source /root/.config/nvim/fzf/fzf.vim
source /root/.config/nvim/git/fugitive.vim
source /root/.config/nvim/git/fzf-checkout.vim
source /root/.config/nvim/colorizer/colorizer.vim
