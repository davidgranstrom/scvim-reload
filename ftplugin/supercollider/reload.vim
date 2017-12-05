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

command -buffer SClangReload call supercollider#reload#run()
command -buffer SClangReloadToggle call supercollider#reload#toggle()

noremap <buffer><silent> <Plug>(scvim-reload) :<c-u>call supercollider#reload#run()<cr>
noremap <buffer><silent> <Plug>(scvim-reload-toggle) :<c-u>call supercollider#reload#toggle()<cr>
