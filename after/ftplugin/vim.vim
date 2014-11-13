" {{{ load files
if filereadable(vimfiles . "/after/ftplugin/programming.vim")
    execute "source " . vimfiles . "/after/ftplugin/programming.vim"
endif
"}}}

" {{{ foldmethod
" Folding via syntax is used for this filetype.
setlocal foldmethod=marker
"}}}

" {{{ foldcolumn
" VIM's command window ('q:') and the :options window also set filetype=vim.
" We do not want folding in these enabled by default, though, because some
" malformed :if, :function, ... commands would fold away everything from the
" malformed command until the last command.
if bufname('') =~# '^\%(' . (v:version < 702 ? 'command-line' : '\[Command Line\]') . '\|option-window\)$'
    " With this, folding can still be enabled easily via any zm, zc, zi, ...
    " command.
    setlocal nofoldenable
else
    " Fold settings for ordinary windows.
    setlocal foldcolumn=4
endif
"}}}

" {{{ vim plugin
" Some folding is now supported with syntax/vim.vim
let g:vimsyn_folding='afmpqrt'
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
