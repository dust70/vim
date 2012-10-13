" When off, all folds are open. This option can be used to quickly switch
" between showing all text unfolded and viewing the text with folds (including
" manually opened or closed folds). It can be toggled with the |zi| command.
" The 'foldcolumn' will remain blank when 'foldenable' is off.
" This option is set by commands that create a new fold or close a fold.
setlocal nofoldenable

" Make a backup before overwriting a file. Leave it around after the file has
" been successfully written. If you do not want to keep the backup file, but you
" do want a backup while the file is being written, reset this option and set
" the 'writebackup' option (this is the default). If you do not want a backup
" file at all reset both options (use this if your file system is almost full).
" See the |backup-table| for more explanations.
" When the 'backupskip' pattern matches, a backup is not made anyway. When
" 'patchmode' is set, the backup may be renamed to become the oldest version of
" a file.
setlocal nobackup

" Use a swapfile for the buffer. This option can be reset when a swapfile is not
" wanted for a specific buffer. For example, with confidential information that
" even root must not be able to access. Careful: All text will be in memory:
"   - Don't use this for big files.
"   - Recovery will be impossible!
" A swapfile will only be present when |'updatecount'| is non-zero and
" 'swapfile' is set.
" When 'swapfile' is reset, the swap file for the current buffer is immediately
" deleted. When 'swapfile' is set, and 'updatecount' is non-zero, a swap file is
" immediately created. Also see |swap-file| and |'swapsync'|.
" This option is used together with 'bufhidden' and 'buftype' to specify special
" kinds of buffers. See |special-buffers|.
setlocal noswapfile

" Copy indent from current line when starting a new line (typing <CR> in Insert
" mode or when using the "o" or "O" command). If you do not type anything on the
" new line except <BS> or CTRL-D and then type <Esc>, CTRL-O or <CR>, the indent
" is deleted again. Moving the cursor to another line has the same effect,
" unless the 'I' flag is included in 'cpoptions'.
" When autoindent is on, formatting (with the "gq" command or when you reach
" 'textwidth' in Insert mode) uses the indentation of the first line.
" When 'smartindent' or 'cindent' is on the indent is changed in a different
" way.
" The 'autoindent' option is reset when the 'paste' option is set. {small
" difference from Vi: After the indent is deleted when typing <Esc> or <CR>, the
" cursor position when moving up or down is after the deleted indent; Vi puts
" the cursor somewhere in the deleted indent}.
setlocal noautoindent

" Enables automatic C program indenting See 'cinkeys' to set the keys that
" trigger reindenting in insert mode and 'cinoptions' to set your preferred
" indent style.
" If 'indentexpr' is not empty, it overrules 'cindent'. If 'lisp' is not on and
" both 'indentexpr' and 'equalprg' are empty, the "=" operator indents using
" this algorithm rather than calling an external program.
" See |C-indenting|.
" When you don't like the way 'cindent' works, try the 'smartindent' option or
" 'indentexpr'.
" This option is not used when 'paste' is set.
setlocal nocindent

" Number of spaces to use for each step of (auto)indent. Used for |'cindent'|,
" |>>|, |<<|, etc.
setlocal shiftwidth=2

" Spellcheking will be done
setlocal spell

imap ä ä
imap Ä Ä
imap ü ü
imap Ü Ü
imap ö ö
imap Ö Ö
imap ß ß

iabbrev <buffer> Rene René
iabbrev <buffer> MfG MfG<CR>  René
iabbrev <buffer> mfg Mit freundlichen Grüßen<CR>  René Six
iabbrev <buffer> gruß Gruß<CR>  René
iabbrev <buffer> gruss Gruß<CR>  René
iabbrev <buffer> grüße Grüße<CR>  René
iabbrev <buffer> gruesse Grüße<CR>  René
iabbrev <buffer> lg Liebe Grüße<CR>  René

Calendar
setlocal nospell
wincmd l
0/^$
