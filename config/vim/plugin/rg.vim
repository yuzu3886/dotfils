if exists('g:loaded_rg')
  finish
endif
let g:loaded_rg = 1

function! s:rg(word) abort
  let l:list = split(system(printf('rg --vimgrep --hidden --ignore-case --smart-case --glob !.git %s', a:word)), '\n')
  call setqflist([], 'r', #{ efm: '%f:%l:%c:%m', lines: l:list })
  cwindow
endfunction

command! -nargs=1 Rg call <SID>rg(<q-args>)
