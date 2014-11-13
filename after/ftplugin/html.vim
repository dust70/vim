" {{{ load files
if filereadable(vimfiles . "/after/ftplugin/programming.vim")
    execute "source " . vimfiles . "/after/ftplugin/programming.vim"
endif
"}}}

" {{{ matchpairs
" Characters that form pairs. The |%| command jumps from one to the other.
" Currently only single byte character pairs are allowed, and they must be
" different. The characters must be separated by a colon. The pairs must be
" separated by a comma.
setlocal matchpairs+=<:>
"}}}

" {{{ foldmethod
" The kind of folding used for the current window.
setlocal foldmethod=indent
" }}}

" {{{ replace german umlauts
imap ä &auml;
imap Ä &Auml;
imap ü &uuml;
imap Ü &Uuml;
imap ö &ouml;
imap Ö &Ouml;
imap ß &szlig;
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
