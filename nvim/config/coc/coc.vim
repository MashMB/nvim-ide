" Conquer of completion configuration.
"
" @author Maciej Bedra

" Do not pass messages to ins-completion-menu
set shortmess+=c

" Do not shift text with sign column
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Code completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Key binding used to trigger completion
inoremap <silent><expr> <C-Space> coc#refresh()

" Confirm completion
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

" Key binding for programming documentation
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Key bindings used to scroll pop ups content
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Highlight symbol and references on cursor hold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Key binding used to format code
nmap <leader>cf <Plug>(coc-format)

" Key binding for code action (optimize imports, generate code, etc.)
nmap <leader>ca <Plug>(coc-codeaction)

" Key binding used for symbol rename
nmap <F2> <Plug>(coc-rename)

" Key binding used to go to definition
nmap <leader>cd <Plug>(coc-definition)

" Key binding used to go to type definition
nmap <leader>ct <Plug>(coc-type-definition)

" Key binding used to to to implementation
nmap <leader>ci <Plug>(coc-implementation)

" Key binding used to go to declaration
nmap <leader>cr <Plug>(coc-declaration)

" Key binding used to find usages
nmap <leader>cu <Plug>(coc-references)

" Key binding for quick fix
nmap <leader>cq <Plug>(coc-fix-current)

" Key binding used to show code errors, warnings, etc.
nmap <leader>ce :CocList diagnostics<CR>

" Key binding for code outline
nmap <M-7> :CocList outline<CR>

" Key binding used to find symbol
nmap <leader>cs :CocList -I symbols<CR>
