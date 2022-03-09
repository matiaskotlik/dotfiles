function! myspacevim#before() abort
  let g:mapleader = ','
  set timeoutlen=300

  " Preview effects of command incrementally (e.g. :substitute). Neovim only.
  if has('nvim')
    set inccommand=nosplit
  endif

  " no caps = case insenitive, any caps = case sensitive
  set ignorecase
  set smartcase

  " ; = :
  noremap ; :

  " make j and k move by wrapped line unless there is a count
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

  " ctrl space to autocomplete
  inoremap <silent><expr> <c-space> coc#refresh()

  " use system clipboard
  set clipboard+=unnamed
endfunction


function! myspacevim#after() abort

endfunction
