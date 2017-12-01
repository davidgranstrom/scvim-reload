scvim-reload
============

Reload (re-evaluate) SuperCollider code split across many files. This plugin is based on my own work flow so it may or may not be a useful for you.

This plugin provides one command which will iterate over all loaded buffers and `:update` the ones with a `supercollider` filetype. It then evaluates (in sc) the file called "main.scd" and returns to the buffer from which the command was called.

Installation
------------

If you are using vim-plug add the following to your vimrc

    Plug 'davidgranstrom/scvim-reload'

Usage
-----

### Mappings

This plugin doesn't provide any default mappings but you can use the mapping below to define your own.

    <Plug>(scvim-reload)

Example (put this in your vimrc)

    nmap <buffer> <Enter> <Plug>(scvim-reload)

### Commands

Update (save) all modified buffers and evalutate main file.

    :SClangReload

### Variables

Change the name of the main file (defaults to "main.scd")

    let g:scvim_reload_mainfile = "my-file.scd"


Motivation
----------

I structure my SuperCollider code in separate files and use the concept of a "main" file (like `main.c` or `index.js`) which will be the entry point to the program. The main file loads the other files (dependencies) using `String:load`. The dependency in question needs to be written to disk whenever something in there changes which is somewhat of a bottle neck to this workflow which is why this plugin exists.

Here is an example layout of a project:

    my-project/
    ├── main.scd
    ├── patterns.scd
    └── synthdefs.scd

## Notes

This plugin relies on functionality from [scvim](https://github.com/supercollider/scvim)

The plugin expects the file `main.scd` to be loaded in vim.
