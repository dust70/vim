" Make a backup before overwriting a file. Leave it around after the file has
" been successfully written. If you do not want to keep the backup file, but
" you do want a backup while the file is being written, reset this option and
" set the 'writebackup' option (this is the default). If you do not want a
" backup file at all reset both options (use this if your file system is
" almost full). See the |backup-table| for more explanations.
" When the 'backupskip' pattern matches, a backup is not made anyway. When
" 'patchmode' is set, the backup may be renamed to become the oldest version
" of a file.
" NOTE: This option is reset when 'compatible' is set.
set nobackup

" Use a swapfile for the buffer. This option can be reset when a swapfile is
" not wanted for a specific buffer. For example, with confidential information
" that even root must not be able to access. Careful: All text will be in
" memory:
"   - Don't use this for big files.
"   - Recovery will be impossible!
" A swapfile will only be present when |'updatecount'| is non-zero and
" 'swapfile' is set.
" When 'swapfile' is reset, the swap file for the current buffer is
" immediately deleted. When 'swapfile' is set, and 'updatecount' is non-zero,
" a swap file is immediately created. Also see |swap-file| and |'swapsync'|.
"
" This option is used together with 'bufhidden' and 'buftype' to specify
" special kinds of buffers. See |special-buffers|.
set noswapfile

" Print the line number in front of each line. When the 'n' option is excluded
" from 'cpoptions' a wrapped line will not use the column of line numbers
" (this is the default when 'compatible' isn't set). The 'numberwidth' option
" can be used to set the room used for the line number.
" When a long, wrapped line doesn't start with the first character, '-'
" characters are put before the number. See |hl-LineNr| for the highlighting
" used for the number.
" When setting this option, 'relativenumber' is reset.
set nonumber
