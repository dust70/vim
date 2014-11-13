" {{{ load files
if filereadable(vimfiles . "/after/ftplugin/programming.vim")
    execute "source " . vimfiles . "/after/ftplugin/programming.vim"
endif
"}}}

" {{{ suffixesadd
" Comma separated list of suffixes, which are used when searching for a file for
" the "gf", "[I", etc. commands.
set suffixesadd+=.py
"}}}

" {{{ tags
" Filenames for the tag command, separated by spaces or commas. To include a
" space or comma in a file name, precede it with a backslash (see
" |option-backslash| about including spaces and backslashes). When a file name
" starts with "./", the '.' is replaced with the path of the current file. But
" only when the 'd' flag is not included in 'cpoptions'. Environment variables
" are expanded |:set_env|. Also see |tags-option|.
" "*", "**" and other wildcards can be used to search for tags files in a
" directory tree. See |file-searching|. E.g., "/lib/**/tags" will find all
" files named "tags" below "/lib". The filename itself cannot contain
" wildcards, it is used as-is. E.g., "/lib/**/tags?" will find files called
" "tags?".
setlocal tags-='./tags' tags^='.tags'
"}}}

" {{{ abbreviations
iabbrev true True
iabbrev fale False
iabbrev none None
" }}}

" vim: filetype=vim textwidth=80 foldmethod=marker
