" {{{ complete
" This option specifies how keyword completion |ins-completion| works when
" CTRL-P or CTRL-N are used. It is also used for whole-line completion
" |i_CTRL-X_CTRL-L|. It indicates the type of completion and the places to
" scan.
setlocal complete-=k complete+=k
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
setlocal dictionary-=${HOME}/.vim/bundle/PHPDictionary/PHP.dict
            \ dictionary+=${HOME}/.vim/bundle/PHPDictionary/PHP.dict
" }}}

" {{{ diffopt
" Option settings for diff mode. It can consist of the following items. All
" are optional. Items must be separated by a comma.
setlocal diffopt+=iwhite
"}}}

" {{{ endofline
" When writing a file and this option is off and the 'binary' option is on, no
" <EOL> will be written for the last line in the file. This option is
" automatically set when starting to edit a new file, unless the file does not
" have an <EOL> for the last line in the file, in which case it is reset.
" Normally you don't have to set or reset this option. When 'binary' is off the
" value is not used when writing the file. When 'binary' is on it is used to
" remember the presence of a <EOL> for the last line in the file, so that when
" you write the file the situation from the original file can be kept. But you
" can change it if you want to.
setlocal endofline
"}}}

" {{{ foldlevelstart
" Sets 'foldlevel' when starting to edit another buffer in a window. Useful to
" always start editing with all folds closed (value zero), some folds closed
" (one) or no folds closed (99).
setlocal foldlevelstart=1
"}}}

" {{{ foldmethod
" The kind of folding used for the current window.
setlocal foldmethod=syntax
" }}}

" {{{ formatoptions
" This is a sequence of letters which describes how automatic formatting is to
" be done. See |fo-table|. When the 'paste' option is on, no formatting is
" done (like 'formatoptions' is empty). Commas can be inserted for
" readability. To avoid problems with flags that are added in the future, use
" the "+=" and "-=" feature of ":set" |add-option-flags|.
setlocal formatoptions=cronb1j
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
setlocal tags-=vimfiles.'/persistent-tags/php/*'
            \ tags+=vimfiles.'/persistent-tags/php/*'
"}}}

" {{{ textwidth
" Maximum width of text that is being inserted. A longer line will be broken
" after white space to get this width. A zero value disables this. 'textwidth'
" is set to 0 when the 'paste' option is set. When 'textwidth' is zero,
" 'wrapmargin' may be used. See also 'formatoptions' and |ins-textwidth|. When
" 'formatexpr' is set it will be used to break the line.
setlocal textwidth=80
" }}}

" vim: filetype=vim textwidth=80 foldmethod=marker
