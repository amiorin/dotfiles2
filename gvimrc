macmenu File.Print          key=<Nop>
macmenu File.Open\.\.\.     key=<Nop>
macmenu Tools.List\ Errors  key=<Nop>

" cwd {{{1
augroup cwd
  au!
  au CursorMoved,WinEnter * call settabvar(tabpagenr(),'cwd', substitute(getcwd(), $HOME, '~', ''))
augroup END
set guitablabel=%{gettabvar(v:lnum,'cwd')}
set showtabline=1
