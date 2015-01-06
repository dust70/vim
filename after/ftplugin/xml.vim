" {{{ load files
if filereadable(g:vimfiles . "/after/ftplugin/programming.vim")
    execute "source " . g:vimfiles . "/after/ftplugin/programming.vim"
endif
"}}}

" {{{ equalprg
" External program to use for "=" command. When this option is empty the
" internal formatting functions are used; either 'lisp', 'cindent' or
" 'indentexpr'. When Vim was compiled without internal formatting, the "indent"
" program is used.
setlocal equalprg=xmllint\ --format\ -
"}}}

" {{{ foldmethod
" The kind of folding used for the current window.
setlocal foldmethod=indent
"}}}

" {{{ matchpairs
" Characters that form pairs. The |%| command jumps from one to the other.
" Currently only single byte character pairs are allowed, and they must be
" different. The characters must be separated by a colon. The pairs must be
" separated by a comma.
setlocal matchpairs+=<:>
"}}}

" {{{ omnifunc
" This option specifies a function to be used for Insert mode omni completion
" with CTRL-X CTRL-O. |i_CTRL-X_CTRL-O| See |complete-functions| for an
" explanation of how the function is invoked and what it should return.
setlocal omnifunc=xmlcomplete#CompleteTags
"}}}

" {{{ textwidth
" Maximum width of text that is being inserted. A longer line will be broken
" after whitespace to get this width. A zero value disables this. 'textwidth'
" is set to 0 when the 'paste' option is set. When 'textwidth' is zero,
" 'wrapmargin' may be used. See also 'formatoptions' and |ins-textwidth|. When
" 'formatexpr' is set it will be used to break the line.
setlocal textwidth=80
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
