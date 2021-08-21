" Configuration for fuzzy finder.
"
" @author Maciej Bedra

" Search result on top
let $FZF_DEFAULT_OPTS = '--reverse'

" Fuzzy finder as pop up
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }

" Key binding used to launch fuzzy finder (file search)
" nmap <C-_> :FZF<CR>

" Key binding used to launch fuzzy finder (text occurrence)
" nmap <C-_><C-_> :Rg<CR>
