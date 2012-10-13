" Folding via syntax is used for this filetype.
setlocal foldmethod=marker

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

" Some folding is now supported with syntax/vim.vim
"    g:vimsyn_folding == 0 or doesn't exist: no syntax-based folding
"    g:vimsyn_folding =~ 'a' : augroups
"    g:vimsyn_folding =~ 'f' : fold functions
"    g:vimsyn_folding =~ 'm' : fold mzscheme script
"    g:vimsyn_folding =~ 'p' : fold perl     script
"    g:vimsyn_folding =~ 'P' : fold python   script
"    g:vimsyn_folding =~ 'r' : fold ruby     script
"    g:vimsyn_folding =~ 't' : fold tcl      script
let g:vimsyn_folding='afmpqrt'
