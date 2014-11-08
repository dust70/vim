" {{{ complete
" This option specifies how keyword completion |ins-completion| works when
" CTRL-P or CTRL-N are used. It is also used for whole-line completion
" |i_CTRL-X_CTRL-L|. It indicates the type of completion and the places to
" scan.
setlocal complete-=tikd complete+=tikd
"}}}

" {{{ foldlevelstart
" Sets 'foldlevel' when starting to edit another buffer in a window. Useful to
" always start editing with all folds closed (value zero), some folds closed
" (one) or no folds closed (99).
setlocal foldlevelstart=1
"}}}

" {{{ foldmethod
" The kind of folding used for the current window.
setlocal foldmethod=indent
" }}}

" {{{ formatoptions
" This is a sequence of letters which describes how automatic formatting is to
" be done. See |fo-table|. When the 'paste' option is on, no formatting is
" done (like 'formatoptions' is empty). Commas can be inserted for
" readability. To avoid problems with flags that are added in the future, use
" the "+=" and "-=" feature of ":set" |add-option-flags|.
setlocal formatoptions=cronb1j
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
