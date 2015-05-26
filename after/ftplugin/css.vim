" {{{ load files
if filereadable(g:vimfiles . "/after/ftplugin/programming.vim")
    execute "source " . g:vimfiles . "/after/ftplugin/programming.vim"
endif
"}}}

" {{{ shiftwidth
" Number of spaces to use for each step of (auto)indent. Used for |'cindent'|,
" |>>|, |<<|, etc.
set shiftwidth=4
"}}}

" {{{ suffixesadd
" Comma separated list of suffixes, which are used when searching for a file for
" the "gf", "[I", etc. commands.
set suffixesadd+=.css
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
