macmenu File.Print          key=<Nop>
macmenu File.Open\.\.\.     key=<Nop>
macmenu Tools.List\ Errors  key=<Nop>

" project {{{1
function! TabTitle()
  let title = substitute(getcwd(), $HOME . '/Code/', '', '') . "/" . expand("%:p:t")
  let title = substitute(title, "\/$", '', '')
  let t:title = exists("b:title") ? b:title : title
endfunction
augroup project
  au!
  au BufEnter,BufRead,WinEnter * call TabTitle()
  au BufEnter,BufRead,WinEnter * let &titlestring = getcwd() . " " . rvm#statusline()
augroup END
set guitablabel=%N-%{gettabvar(v:lnum,'title')}
set showtabline=2
set title

" tabs {{{1
let s:windowmapnr = 0
let s:wins='1234567890!@#$%^&*()'
while (s:windowmapnr < strlen(s:wins))
    exe 'noremap <silent>  <D-' . s:wins[s:windowmapnr] . '> ' . (s:windowmapnr + 1) . 'gt'
    exe 'inoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-O>' . (s:windowmapnr + 1) . 'gt'
    exe 'cnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
    exe 'vnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
    let s:windowmapnr += 1
endwhile
unlet s:windowmapnr s:wins
