" Configuration for Git with Neovim integration.
"
" @author Maciej Bedra

" Key binding for Git status
nmap <leader>gs :Git<CR>

" Key binding for Git commit
nmap <leader>gc :Git commit<CR>

" Key binding for Git push
nmap <leader>gp :Git push<CR>

" Key binding for Git log
nmap <leader>gl :Gclog<CR>

" Key binding to get left chunk in merge conflict
nmap <leader>dh :diffget //2<CR>

" Key binding to get right chunk in merge conflict
nmap <leader>dl :diffget //3<CR>
