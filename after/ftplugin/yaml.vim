" {{{ load files
if filereadable(g:vimfiles . "/after/ftplugin/programming.vim")
    execute "source " . g:vimfiles . "/after/ftplugin/programming.vim"
endif
"}}}

" {{{ softtabstop
" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>. It "feels" like <Tab>s are
" being inserted, while in fact a mix of spaces and <Tab>s is used. This is
" useful to keep the "ts" setting at its standard value of 8, while being able
" to edit like it is set to "sts". However, commands like "x" still work on
" the actual characters.
set softtabstop=2
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
