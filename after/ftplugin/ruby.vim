" {{{ load files
if filereadable(vimfiles . "/after/ftplugin/programming.vim")
    execute "source " . vimfiles . "/after/ftplugin/programming.vim"
endif
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
