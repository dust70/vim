" The kind of folding used for the current window.
setlocal foldmethod=marker

" Maximum width of text that is being inserted. A longer line will be broken
" after white space to get this width. A zero value disables this. 'textwidth'
" is set to 0 when the 'paste' option is set. When 'textwidth' is zero,
" 'wrapmargin' may be used. See also 'formatoptions' and |ins-textwidth|.
" When 'formatexpr' is set it will be used to break the line.
" NOTE: This option is set to 0 when 'compatible' is set.
setlocal textwidth=80
