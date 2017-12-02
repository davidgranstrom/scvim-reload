" File: scvim-reload
" Author: David Granström
" Description: Reload (eval) SuperCollider projects
" License: GPLv3 (same as scvim)

if exists("b:did_scvim_reload")
  finish
endif
let b:did_scvim_reload = 1

if !exists("g:scvim_reload_mainfile")
  let g:scvim_reload_mainfile = "main.scd"
endif

let s:scvim_reload_isPlaying = 0

function! s:TogglePlay()
  call SClangHardstop()

  if !s:scvim_reload_isPlaying
    call supercollider#reload#run()
    let s:scvim_reload_isPlaying = 1
  else
    let s:scvim_reload_isPlaying = 0
  endif
endfunction

command -buffer SClangReload call supercollider#reload#run()
command -buffer SClangReloadToggle call <SID>TogglePlay()

noremap <buffer><silent> <Plug>(scvim-reload) :<c-u>call supercollider#reload#run()<cr>
noremap <buffer><silent> <Plug>(scvim-reload-toggle) :<c-u>call <SID>TogglePlay()<cr>
