" File: scvim-reload
" Author: David Granström
" Description: Reload (eval) SuperCollider projects
" Last Modified: November 27, 2017
" License: GPLv3 (same as scvim)

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

if !exists("g:scvim_reload_mainfile")
  let g:scvim_reload_mainfile = "main.scd"
endif

command -buffer SClangReload call supercollider#reload#run()
noremap <buffer><silent> <Plug>(scvim-reload) :<c-u>call supercollider#reload#run()<cr>
