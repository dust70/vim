if filereadable("$VIM/vimfiles/plugin/closetag.vim")
    source $VIM/vimfiles/plugin/closetag.vim
endif

" replace german umlauts
imap ä &auml;
imap Ä &Auml;
imap ü &uuml;
imap Ü &Uuml;
imap ö &ouml;
imap Ö &Ouml;
imap ß &szlig;

" Number of spaces that a <Tab> counts for while performing editing operations,
" like inserting a <Tab> or using <BS>. It "feels" like <Tab>s are being
" inserted, while in fact a mix of spaces and <Tab>s is used. This is useful to
" keep the 'ts' setting at its standard value of 8, while being able to edit
" like it is set to 'sts'. However, commands like "x" still work on the actual
" characters.
" When 'sts' is zero, this feature is off.
" 'softtabstop' is set to 0 when the 'paste' option is set.
" See also ins-expandtab. When 'expandtab' is not set, the number of spaces is
" minimized by using <Tab>s.
" The 'L' flag in 'cpoptions' changes how tabs are used when 'list' is set.
setlocal softtabstop=4

" Number of spaces to use for each step of (auto)indent. Used for |'cindent'|,
" |>>|, |<<|, etc.
setlocal shiftwidth=4

" Maximum width of text that is being inserted. A longer line will be broken
" after white space to get this width. A zero value disables this. 'textwidth'
" is set to 0 when the 'paste' option is set. When 'textwidth' is zero,
" 'wrapmargin' may be used. See also 'formatoptions' and |ins-textwidth|. When
" 'formatexpr' is set it will be used to break the line.
" NOTE: This option is set to 0 when 'compatible' is set.
setlocal textwidth=115

" Characters that form pairs. The |%| command jumps from one to the other.
" Currently only single byte character pairs are allowed, and they must be
" different. The characters must be separated by a colon. The pairs must be
" separated by a comma.
setlocal matchpairs+=<:>

command! Tidy :call Tidy()
function! Tidy()
  let filename=expand("%:p") " escapes for bash
  let filename=substitute(filename, " ", "\\\\ ", "g")
  let filename=substitute(filename, "(", "\\\\(", "g")
  let filename=substitute(filename, ")", "\\\\)", "g")
  let filename=substitute(filename, "[", "\\\\[", "g")
  let filename=substitute(filename, "]", "\\\\]", "g")
  let filename=substitute(filename, "&", "\\\\&", "g")
  let filename=substitute(filename, "!", "\\\\!", "g")
  let filename=substitute(filename, ",", "\\\\,", "g")
  let filename=substitute(filename, "'", "?", "g")
  let filename2=substitute(filename, ".*", "&.tidy.htm", "")
  let filename3=substitute(filename, ".*", "&.errors.tidy.txt", "")
  execute "!tidy "."-f ".filename3." ".filename." > ".filename2.""
endfunction