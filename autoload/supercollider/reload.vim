function! supercollider#reload#run()
  let curbuf = bufnr("%")
  let save_cursor = getcurpos()

  function! s:update()
    if &ft == "supercollider"
      update
    endif
  endfunction

  bufdo call s:update()

  let path = g:scvim_reload_mainfile
  let path = fnamemodify(path, ":p")

  if filereadable(path)
    let cmd = '"' . path . '".load;'
    call SendToSC(cmd)
  else
    echoerr "Could not find " . path
  endif

  " restore
  exe "buffer " . curbuf
  call setpos(".", save_cursor)
endfunction
