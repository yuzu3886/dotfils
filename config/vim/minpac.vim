set packpath=${HOME}/.local/share/vim

function! PackInit(options) abort
  packadd minpac

  call minpac#init(a:options)
  call minpac#add('k-takata/minpac', { 'type': 'opt' })

  call minpac#add('itchyny/lightline.vim')
  call minpac#add('lifepillar/vim-gruvbox8')
  call minpac#add('machakann/vim-sandwich')
  call minpac#add('machakann/vim-swap')
  call minpac#add('mattn/vim-gomod')
  call minpac#add('mattn/vim-molder')
  call minpac#add('mattn/vim-molder-operations')
  call minpac#add('pocke/rbs.vim')
  call minpac#add('thinca/vim-ambicmd')
  call minpac#add('thinca/vim-qfreplace')
endfunction

command! PackUpdate call PackInit({}) | call minpac#update()
command! PackClean  call PackInit({}) | call minpac#clean()

" vim -Nu "${HOME}/.vim/minpac.vim" -c "call PackInit({ 'progress_open': 'none' }) | call minpac#update('', { 'do': 'quit' })"
