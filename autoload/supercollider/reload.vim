function! s:update()
  if &ft == "supercollider"
    update
  endif
endfunction

function! supercollider#reload#run()
  let curbuf = bufnr("%")
  let save_cursor = getcurpos()
  bufdo call s:update()
  try
    " enter main
    exe "buffer " . g:scvim_reload_mainfile
    1,$ call SClang_send()
  catch
    echoerr "File " . g:scvim_reload_mainfile . " is not loaded!"
  endtry
  " restore
  exe "buffer " . curbuf
  call setpos(".", save_cursor)
endfunction
