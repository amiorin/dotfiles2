macmenu File.Print          key=<Nop>
macmenu File.Open\.\.\.     key=<Nop>
macmenu Tools.List\ Errors  key=<Nop>
nmap <D-p> <Plug>yankstack_substitute_older_paste
nmap <D-P> <Plug>yankstack_substitute_newer_paste

" cwd {{{1
augroup cwd
  au!
  au CursorMoved,WinEnter * call settabvar(tabpagenr(),'cwd', substitute(getcwd(), $HOME, '~', ''))
augroup END
set guitablabel=%{gettabvar(v:lnum,'cwd')}
set showtabline=1
