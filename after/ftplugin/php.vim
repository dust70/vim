" {{{ load files
if filereadable(g:vimfiles . "/after/ftplugin/programming.vim")
    execute "source " . g:vimfiles . "/after/ftplugin/programming.vim"
endif
"}}}

" {{{ dictionary
" List of file names, separated by commas, that are used to lookup words for
" keyword completion commands |i_CTRL-X_CTRL-K|. Each file should contain a
" list of words. This can be one word per line, or several words per line,
" separated by non-keyword characters (white space is preferred). Maximum line
" length is 510 bytes.
" When this option is empty, or an entry "spell" is present, spell checking is
" enabled the currently active spelling is used. |spell| To include a comma in
" a file name precede it with a backslash. Spaces after a comma are ignored,
" otherwise spaces are included in the file name. See |option-backslash| about
" using backslashes. This has nothing to do with the |Dictionary| variable
" type.
execute 'setlocal dictionary-=' . g:vimfiles . '/bundle/PHPDictionary/PHP.dict'
execute 'setlocal dictionary^=' . g:vimfiles . '/bundle/PHPDictionary/PHP.dict'
"}}}

" {{{ suffixesadd
" Comma separated list of suffixes, which are used when searching for a file for
" the "gf", "[I", etc. commands.
set suffixesadd+=.php
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
setlocal tags-=./tags tags^=./tags
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
