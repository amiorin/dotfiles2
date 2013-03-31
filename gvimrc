macmenu File.Print          key=<Nop>
macmenu File.Open\.\.\.     key=<Nop>
macmenu Tools.List\ Errors  key=<Nop>

" cwd {{{1
augroup cwd
  au!
  au CursorMoved,WinEnter * call settabvar(tabpagenr(),'cwd', substitute(getcwd(), $HOME . '/Code/', '', ''))
augroup END
set guitablabel=%{gettabvar(v:lnum,'cwd')}
set showtabline=2

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
auto BufEnter * let &titlestring = getcwd()
set title

