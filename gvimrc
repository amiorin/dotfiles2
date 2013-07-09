if hostname() =~ 'local'
  macmenu File.Print                          key=<Nop>
  macmenu File.Open\.\.\.                     key=<Nop>
  macmenu Tools.List\ Errors                  key=<Nop>
  macmenu File.Close                          key=<Nop>
  macmenu Edit.Find.Use\ Selection\ for\ Find key=<Nop>
  macmenu File.New\ Tab                       key=<Nop>


  " tabclose like chrome {{{1
  noremap <silent> <D-w> :if tabpagenr() != tabpagenr('$') && winnr('$') == 1<CR>:tabclose<CR>:if tabpagenr() > 1<CR>:tabprev<CR>:endif<CR>:else<CR>:SmartClose<CR>:endif<CR>
  inoremap <silent> <D-w> <Esc>:if tabpagenr() != tabpagenr('$') && winnr('$') == 1<CR>:tabclose<CR>:if tabpagenr() > 1<CR>:tabprev<CR>:endif<CR>:else<CR>:SmartClose<CR>:endif<CR>
  cnoremap <D-w> <C-c>

  " tabopen with Welcome {{{1
  noremap <silent> <D-t> :tabnew<CR>:Welcome<CR>
  inoremap <silent> <D-t> <Esc>:tabnew<CR>:Welcome<CR>

  " split like iTerm2 {{{1
  nnoremap <D-d> :vsp<cr>
  nnoremap <D-D> :sp<cr>

  " tabs {{{1
  let s:windowmapnr = 0
  let s:wins='1234567890!@#$%^&*()'
  while (s:windowmapnr < strlen(s:wins))
      exe 'noremap <silent>  <D-' . s:wins[s:windowmapnr] . '> ' . (s:windowmapnr + 1) . 'gt'
      exe 'inoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <Esc>' . (s:windowmapnr + 1) . 'gt'
      exe 'cnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
      exe 'vnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
      let s:windowmapnr += 1
  endwhile
  unlet s:windowmapnr s:wins

  " page up and down {{{1
  nnoremap <D-j> <C-f>
  nnoremap <D-k> <C-b>
endif

" vim-project {{{1
set showtabline=2

