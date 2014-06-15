" {{{ autoindent
" Copy indent from current line when starting a new line (typing <CR> in
" Insert mode or when using the "o" or "O" command). If you do not type
" anything on the new line except <BS> or CTRL-D and then type <Esc>, CTRL-O
" or <CR>, the indent is deleted again. Moving the cursor to another line has
" the same effect, unless the 'I' flag is included in 'cpoptions'.
setlocal autoindent
" }}}

" {{{ expandtab
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>. Spaces
" are used in indents with the '>' and '<' commands and when 'autoindent' is on.
" To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>. See also
" |:retab| and |ins-expandtab|.
setlocal expandtab
"}}}

" {{{ shiftwidth
" Number of spaces to use for each step of (auto)indent. Used for |'cindent'|,
" |>>|, |<<|, etc.
" When zero the 'ts' value will be used. Use the |shiftwidth()| function to get
" the effective shiftwidth value.
setlocal shiftwidth=4
"}}}

" {{{ softtabstop
" Number of spaces that a <Tab> counts for while performing editing operations,
" like inserting a <Tab> or using <BS>.  It "feels" like <Tab>s are being
" inserted, while in fact a mix of spaces and <Tab>s is used.  This is useful to
" keep the 'ts' setting at its standard value of 8, while being able to edit
" like it is set to 'sts'.  However, commands like "x" still work on the actual
" characters.
setlocal softtabstop=4
"}}}

" {{{ tabstop
" Number of spaces that a <Tab> in the file counts for.
setlocal tabstop=4
"}}}

" {{{ textwidth
" Maximum width of text that is being inserted. A longer line will be broken
" after white space to get this width. A zero value disables this. 'textwidth'
" is set to 0 when the 'paste' option is set. When 'textwidth' is zero,
" 'wrapmargin' may be used. See also 'formatoptions' and |ins-textwidth|.
setlocal textwidth=80
"}}}

" {{{ abbreviations
iabbrev true True
iabbrev fale False
iabbrev none None
" }}}

" vim: filetype=vim textwidth=80 foldmethod=marker
