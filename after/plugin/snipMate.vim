" This is put here in the 'after' directory in order for snipMate to override
" other plugin mappings (e.g., supertab).
inoremap <silent> <c-j> <c-r>=TriggerSnippet()<cr>:set nopaste<cr>
snoremap <silent> <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>:set nopaste<cr>
inoremap <silent> <c-k> <c-r>=BackwardsSnippet()<cr>:set nopaste<cr>
snoremap <silent> <c-k> <esc>i<right><c-r>=BackwardsSnippet()<cr>:set nopaste<cr>
inoremap <silent> <c-r><c-j> <c-r>=ShowAvailableSnips()<cr>:set nopaste<cr>

" vim:noet:sw=4:ts=4:ft=vim
