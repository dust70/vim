" {{{ load files
if filereadable(g:vimfiles . "/after/ftplugin/git.vim")
    execute "source " . g:vimfiles . "/after/ftplugin/git.vim"
endif
"}}}

" {{{ spell
" When on spell checking will be done.
setlocal spell
"}}}

" {{{ splitbelow
" When on, splitting a window will put the new window below the current one.
set splitbelow
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
