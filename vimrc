" {{{ PathOGen
" Needed on some linux distributions
let g:pathToPathOGen = split(&runtimepath, ",")[0] . "/bundle/PathOGen/autoload/pathogen.vim"
if filereadable(pathToPathOGen)
    filetype off
    syntax off
    execute "source " . pathToPathOGen
    call pathogen#infect()
    call pathogen#helptags()
endif
unlet pathToPathOGen
"}}}

" {{{ syntax
" Syntax highlighting enables Vim to show parts of the text in another font or
" color. Those parts can be specific keywords or text matching a pattern. Vim
" doesn't parse the whole file (to keep it fast), so the highlighting has its
" limitations. Lexical highlighting might be a better name, but since everybody
" calls it syntax highlighting we'll stick with that. Vim supports syntax
" highlighting on all terminals. But since most ordinary terminals have very
" limited highlighting possibilities, it works best in the GUI version, gvim.
syntax enable
"}}}

" {{{ highlight
if has("autocmd")
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    match ExtraWhitespace /\s\+$\| \+\ze\t/
endif
"}}}

" {{{ colorscheme
" Output the name of the currently active color scheme.
" This is basically the same as
"	:echo g:colors_name
" In case g:colors_name has not been defined :colo will output "default". When
" compiled without the |+eval| feature it will output "unknown".
if has("gui_running") && ! empty(globpath(&runtimepath, 'colors/vydark.vim'))
    colorscheme vydark
elseif ! empty(globpath(&runtimepath, 'colors/detailed.vim'))
    colorscheme detailed
else
    colorscheme evening
endif
"}}}

" {{{ filetype
" Vim can detect the type of file that is edited. This is done by checking the
" file name and sometimes by inspecting the contents of the file for specific
" text.
"	command				detection	plugin		indent
"	filetype on			on		unchanged	unchanged
"	filetype off			off		unchanged	unchanged
"	filetype plugin on		on		on		unchanged
"	filetype plugin off		unchanged	off		unchanged
"	filetype indent on		on		unchanged	on
"	filetype indent off		unchanged	unchanged	off
"	filetype plugin indent on	on		on		on
"	filetype plugin indent off	unchanged	off		off
if has("autocmd")
    filetype plugin indent on
endif
"}}}

" {{{ global options
" {{{ autoindent
" Copy indent from current line when starting a new line (typing <CR> in
" Insert mode or when using the "o" or "O" command). If you do not type
" anything on the new line except <BS> or CTRL-D and then type <Esc>, CTRL-O
" or <CR>, the indent is deleted again. Moving the cursor to another line has
" the same effect, unless the 'I' flag is included in 'cpoptions'.
" When autoindent is on, formatting (with the "gq" command or when you reach
" 'textwidth' in Insert mode) uses the indentation of the first line.
" When 'smartindent' or 'cindent' is on the indent is changed in a different
" way.
" The 'autoindent' option is reset when the 'paste' option is set. {small
" difference from Vi: After the indent is deleted when typing <Esc> or <CR>,
" the cursor position when moving up or down is after the deleted indent; Vi
" puts the cursor somewhere in the deleted indent}.
set autoindent
"}}}

" {{{ autoread
" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again. When the file
" has been deleted this is not done.
set autoread
"}}}

" {{{ background
" When set to "dark", Vim will try to use colors that look good on a dark
" background. When set to "light", Vim will try to use colors that look good
" on a light background. Any other value is illegal.
" Vim tries to set the default value according to the terminal used. This will
" not always be correct.
if &t_Co > 2 || has("gui_running")
    set background=dark
endif
"}}}

" {{{ backspace
" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
" This is a list of items, separated by commas. Each item allows a way to
" backspace over something:
"	value	effect
"	indent	allow backspacing over autoindent
"	eol	allow backspacing over line breaks (join lines)
"	start	allow backspacing over the start of insert; CTRL-W and CTRL-U
"		stop once at the start of insert.
set backspace=indent,eol,start
"}}}

" {{{ backup
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
"}}}

" {{{ browsedir
" Which directory to use for the file browser:
"	last	Use same directory as with last file browser, where a file was
"		opened or saved.
"	buffer	Use the directory of the related buffer.
"	current	Use the current directory.
"	{path}	Use the specified directory
if has("gui_running")
    set browsedir=current
endif
"}}}

" {{{ cindent
" Enables automatic C program indenting. See 'cinkeys' to set the keys that
" trigger reindenting in insert mode and 'cinoptions' to set your preferred
" indent style.
" If 'indentexpr' is not empty, it overrules 'cindent'.
" If 'lisp' is not on and both 'indentexpr' and 'equalprg' are empty, the "="
" operator indents using this algorithm rather than calling an external
" program.
set cindent
"}}}

" {{{ cmdwinheight
" Number of screen lines to use for the command-line window.
set cmdwinheight=5
"}}}

" {{{ colorcolumn
" 'colorcolumn' is a comma separated list of screen columns that are
" highlighted with ColorColumn |hl-ColorColumn|. Useful to align text. Will
" make screen redrawing slower. The screen column can be an absolute number,
" or a number preceded with '+' or '-', which is added to or subtracted from
" 'textwidth'.
"	:set cc=+1		" highlight column after 'textwidth'
"	:set cc=+1,+2,+3	" highlight three columns after 'textwidth'
"	:hi ColorColumn ctermbg=lightgrey guibg=lightgrey
" When 'textwidth' is zero then the items with '-' and '+' are not used. A
" maximum of 256 columns are highlighted.
if v:version >= 703
    set colorcolumn=+1
endif
"}}}

" {{{ columns
" Number of columns of the screen. Normally this is set by the terminal
" initialization and does not have to be set by hand. Also see
" |posix-screen-size|.
" When Vim is running in the GUI or in a resizable window, setting this option
" will cause the window size to be changed. When you only want to use the size
" for the GUI, put the command in your |gvimrc| file. When you set this option
" and Vim is unable to change the physical number of columns of the display,
" the display may be messed up. For the GUI it is always possible and Vim
" limits the number of columns to what fits on the screen. You can use this
" command to get the widest window possible:
"	:set columns=9999
" Minimum value is 12, maximum value is 10000.
if has("gui_running")
    set columns=165
endif
"}}}

" {{{ complete
" This option specifies how keyword completion |ins-completion| works when
" CTRL-P or CTRL-N are used. It is also used for whole-line completion
" |i_CTRL-X_CTRL-L|. It indicates the type of completion and the places to
" scan. It is a comma separated list of flags:
"	.	scan the current buffer ('wrapscan' is ignored)
"	w	scan buffers from other windows
"	b	scan other loaded buffers that are in the buffer list
"	u	scan the unloaded buffers that are in the buffer list
"	U	scan the buffers that are not in the buffer list
"	k	scan the files given with the 'dictionary' option
"	kspell	use the currently active spell checking |spell|
"	k{dict}	scan the file {dict}. Several "k" flags can be given, patterns
"		are valid too. For example:
"			:set cpt=k/usr/dict/*,k~/spanish
"	s	scan the files given with the 'thesaurus' option
"	s{tsr}	scan the file {tsr}. Several "s" flags can be given, patterns
"		are valid too.
"	i	scan current and included files
"	d	scan current and included files for defined name or macro
"	]	tag completion
"	t	same as "]"
set complete+=k
"}}}

" {{{ cursorline
" Highlight the screen line of the cursor with CursorLine |hl-CursorLine|.
" Useful to easily spot the cursor. Will make screen redrawing slower.
" When Visual mode is active the highlighting isn't used to make it easier to
" see the selected text.
set cursorline
"}}}

" {{{ dictionary
" List of file names, separated by commas, that are used to lookup words for
" keyword completion commands |i_CTRL-X_CTRL-K|. Each file should contain a
" list of words. This can be one word per line, or several words per line,
" separated by non-keyword characters (white space is preferred). Maximum line
" length is 510 bytes.
set dictionary+=/usr/share/dict/words
"}}}

" {{{ diffopt
" Option settings for diff mode. It can consist of the following items. All
" are optional. Items must be separated by a comma.
"	filler		Show filler lines, to keep the text synchronized with
"			a window that has inserted lines at the same position.
"			Mostly useful when windows are side-by-side and
"			'scrollbind' is set.
"	context:{n}	Use a context of {n} lines between a change and a fold
"			that contains unchanged lines. When omitted a context
"			of six lines is used.
"	icase		Ignore changes in case of text. "a" and "A" are
"			considered the same. Adds the "-i" flag to the "diff"
"			command if 'diffexpr' is empty.
"	iwhite		Ignore changes in amount of white space. Adds the "-b"
"			flag to the "diff" command if 'diffexpr' is empty.
"			Check the documentation of the "diff" command for what
"			this does exactly. It should ignore adding trailing
"			white space, but not leading white space.
"	horizontal	Start diff mode with horizontal splits (unless
"			explicitly specified otherwise).
"	vertical	Start diff mode with vertical splits (unless
"			explicitly specified otherwise).
"	foldcolumn:{n}	Set the 'foldcolumn' option to {n} when starting diff
"			mode. Without this 2 is used.
set diffopt=filler,context:3,vertical,foldcolumn:3
"}}}

" {{{ encoding
" Sets the character encoding used inside Vim. It applies to text in the
" buffers, registers, Strings in expressions, text stored in the viminfo file,
" etc. It sets the kind of characters which Vim can work with. See
" |encoding-names| for the possible values.
set encoding=utf-8
"}}}

" {{{ expandtab
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands and when
" 'autoindent' is on. To insert a real tab when 'expandtab' is on, use
" CTRL-V<Tab>. See also |:retab| and |ins-expandtab|.
set expandtab
"}}}

" {{{ foldcolumn
" When non-zero, a column with the specified width is shown at the side of the
" window which indicates open and closed folds. The maximum value is 12.
set foldcolumn=2
"}}}

" {{{ foldlevel
" Sets the fold level: Folds with a higher level will be closed. Setting this
" option to zero will close all folds. Higher numbers will close fewer folds.
" This option is set by commands like zm, zM and zR.
" See fold-foldlevel.
set foldlevel=0
nnoremap ,1 :set foldlevel=0<CR>
nnoremap ,2 :set foldlevel=1<CR>
nnoremap ,3 :set foldlevel=2<CR>
nnoremap ,4 :set foldlevel=3<CR>
nnoremap ,5 :set foldlevel=4<CR>
nnoremap ,6 :set foldlevel=5<CR>
nnoremap ,7 :set foldlevel=6<CR>
nnoremap ,8 :set foldlevel=7<CR>
nnoremap ,9 :set foldlevel=8<CR>
nnoremap ,0 :set foldlevel=9<CR>
"}}}

" {{{ foldlevelstart
" Sets 'foldlevel' when starting to edit another buffer in a window. Useful to
" always start editing with all folds closed (value zero), some folds closed
" (one) or no folds closed (99).
" This is done before reading any modeline, thus a setting in a modeline
" overrules this option. Starting to edit a file for |diff-mode| also ignores
" this option and closes all folds.
" It is also done before BufReadPre autocommands, to allow an autocmd to
" overrule the 'foldlevel' value for specific files.
" When the value is negative, it is not used.
set foldlevelstart=0
"}}}

" {{{ foldmethod
" The kind of folding used for the current window.
set foldmethod=syntax
"}}}

" {{{ guifont
" This is a list of fonts which will be used for the GUI version of Vim. In
" its simplest form the value is just one font name. When the font cannot be
" found you will get an error message. To try other font names a list can be
" specified, font names separated with commas.
" The first valid font is used.
if has("gui_running")
    set guifont=Terminus\ 8
endif
"}}}

" {{{ guioptions
" This option only has an effect in the GUI version of Vim. It is a sequence
" of letters which describes what components and options of the GUI should be
" used.
if has("gui_running")
    set guioptions+=g
    set guioptions-=L
    set guioptions-=r
    set guioptions-=T
endif
"}}}

" {{{ guitablabel
" When nonempty describes the text to use in a label of the GUI tab pages line.
" When empty and when the result is empty Vim will use a default label.
if has('gui_running')
    function! GuiTabLabel()
        " Append the tab number
        let label = v:lnum . ': '
        let bufnrlist = tabpagebuflist(v:lnum)

        " Append the buffer name
        let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
        if name == ''
            " give a name to no-name documents
            if &buftype=='quickfix'
                let name = '[Quickfix List]'
            else
                let name = '[No Name]'
            endif
        else
            " get only the file name
            let name = fnamemodify(name,":t")
        endif

        let label .= name

        " Add '+' if one of the buffers in the tab page is modified
        for bufnr in bufnrlist
            if getbufvar(bufnr, "&modified")
                let label .= ' [+]'
                break
            endif
        endfor

        return label
    endfunction

    set guitablabel=%{GuiTabLabel()}
endif
"}}}

" {{{ helpheight
" Minimal initial height of the help window when it is opened with the ":help"
" command. The initial height of the help window is half of the current
" window, or (when the 'ea' option is on) the same as other windows. When the
" height is less than 'helpheight', the height is set to 'helpheight'. Set to
" zero to disable.
set helpheight=0
"}}}

" {{{ helplang
" Comma separated list of languages. Vim will use the first language for which
" the desired help can be found. The English help will always be used as a
" last resort. You can add "en" to prefer English over another language, but
" that will only find tags that exist in that language and not in the English
" help.
set helplang=en,de
"}}}

" {{{ hlsearch
" When there is a previous search pattern, highlight all its matches. The type
" of highlighting used can be set with the 'l' occasion in the 'highlight'
" option. This uses the "Search" highlight group by default. Note that only
" the matching text is highlighted, any offsets are not applied.
" See also: 'incsearch' and |:match|.
" When you get bored looking at the highlighted matches, you can turn it off
" with |:nohlsearch|. As soon as you use a search command, the highlighting
" comes back.
" 'redrawtime' specifies the maximum time spent on finding matches.
" When the search pattern can match an end-of-line, Vim will try to highlight
" all of the matched text. However, this depends on where the search starts.
" This will be the first line in the window or the first line below a closed
" fold. A match in a previous line which is not drawn may not continue in a
" newly drawn line.
" NOTE: This option is reset when 'compatible' is set.
if &t_Co > 2 || has("gui_running")
    set nohlsearch
    nnoremap <silent> ,L :set nohlsearch!<CR>:set hlsearch?<CR>
endif
"}}}

" {{{ history
" A history of ":" commands, and a history of previous search patterns are
" remembered. This option decides how many entries may be stored in each of
" these histories (see |cmdline-editing|).
" NOTE: This option is set to the Vi default value when 'compatible' is set
" and to the Vim default value when 'compatible' is reset.
set history=100
"}}}

" {{{ incsearch
" While typing a search command, show where the pattern, as it was typed so
" far, matches. The matched string is highlighted. If the pattern is invalid
" or not found, nothing is shown. The screen will be updated often, this is
" only useful on fast terminals.
set incsearch
"}}}

" {{{ joinspaces
" Insert two spaces after a '.', '?' and '!' with a join command. When
" 'cpoptions' includes the 'j' flag, only do this after a '.'. Otherwise only
" one space is inserted.
set nojoinspaces
"}}}

" {{{ laststatus
" The value of this option influences when the last window will have a status
" line:
"	0:	never
"	1:	only if there are at least two windows
"	2:	always
" The screen looks nicer with a status line if you have several windows, but
" it takes another screen line. |status-line|
set laststatus=2
"}}}

" {{{ linebreak
" If on Vim will wrap long lines at a character in 'breakat' rather than at
" the last character that fits on the screen. Unlike 'wrapmargin' and
" 'textwidth', this does not insert <EOL>s in the file, it only affects the
" way the file is displayed, not its contents. The value of 'showbreak' is
" used to put in front of wrapped lines.
" This option is not used when the 'wrap' option is off or 'list' is on.
set linebreak
"}}}

" {{{ lines
" Number of lines of the Vim window.
" Normally you don't need to set this. It is done automatically by the
" terminal initialization code. Also see |posix-screen-size|. When Vim is
" running in the GUI or in a resizable window, setting this option will cause
" the window size to be changed. When you only want to use the size for the
" GUI, put the command in your |gvimrc| file. Vim limits the number of lines
" to what fits on the screen. You can use this command to get the tallest
" window possible:
"	:set lines=999
" Minimum value is 2, maximum value is 1000. If you get less lines than
" expected, check the 'guiheadroom' option. When you set this option and Vim
" is unable to change the physical number of lines of the display, the display
" may be messed up.
if has("gui_running")
    set lines=38
endif
"}}}

" {{{ mousemodel
" Sets the model to use for the mouse. The name mostly specifies what the
" right mouse button is used for:
"	extend		Right mouse button extends a selection. This works
"			like in an xterm.
"	popup		Right mouse button pops up a menu. The shifted left
"			mouse button extends a selection. This works like with
"			Microsoft Windows.
"	popup_setpos	Like "popup", but the cursor will be moved to the
"			position where the mouse was clicked, and thus the
"			selected operation will act upon the clicked object.
"			If clicking inside a selection, that selection will be
"			acted upon, i.e. no cursor move. This implies of
"			course, that right clicking outside a selection will
"			end Visual mode.
set mousemodel=popup
"}}}

" {{{ nrformats
" This defines what bases Vim will consider for numbers when using the CTRL-A
" and CTRL-X commands for adding to and subtracting from a number
" respectively; see |CTRL-A| for more info on these commands.
"	alpha	If included, single alphabetical characters will be
"		incremented or decremented. This is useful for a list with a
"		letter index a), b), etc.
"	octal	If included, numbers that start with a zero will be considered
"		to be octal. Example: Using CTRL-A on "007" results in "010".
"	hex	If included, numbers starting with "0x" or "0X" will be
"		considered to be hexadecimal. Example: Using CTRL-X on "0x100"
"		results in "0x0ff".
" Numbers which simply begin with a digit in the range 1-9 are always
" considered decimal. This also happens for numbers that are not recognized as
" octal or hex.
set nrformats=alpha,octal,hex
"}}}

" {{{ number
" Print the line number in front of each line. When the 'n' option is excluded
" from 'cpoptions' a wrapped line will not use the column of line numbers
" (this is the default when 'compatible' isn't set). The 'numberwidth' option
" can be used to set the room used for the line number.
" When a long, wrapped line doesn't start with the first character, '-'
" characters are put before the number.
" See |hl-LineNr| for the highlighting used for the number.
" When setting this option, 'relativenumber' is reset.
set number
nnoremap <silent> ,n :set nonumber!<CR>:set number?<CR>
"}}}

" {{{ numberwidth
" Minimal number of columns to use for the line number. Only relevant when the
" 'number' or 'relativenumber' option is set or printing lines with a line
" number. Since one space is always between the number and the text, there is
" one less character for the number itself.
" The value is the minimum width. A bigger width is used when needed to fit
" the highest line number in the buffer respectively the number of rows in the
" window, depending on whether 'number' or 'relativenumber' is set. Thus with
" the Vim default of 4 there is room for a line number up to 999. When the
" buffer has 1000 lines five columns will be used. The minimum value is 1, the
" maximum value is 10.
" NOTE: 'numberwidth' is reset to 8 when 'compatible' is set.
set numberwidth=5
"}}}

" {{{ pastetoggle
" When non-empty, specifies the key sequence that toggles the 'paste' option.
" This is like specifying a mapping:
"	:map {keys} :set invpaste<CR>
" Where {keys} is the value of 'pastetoggle'. The difference is that it will
" work even when 'paste' is set. 'pastetoggle' works in Insert mode and Normal
" mode, but not in Command-line mode.
set pastetoggle=,p
"}}}

" {{{ path
" This is a list of directories which will be searched when using the |gf|,
" [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands, provided that
" the file being searched for has a relative path (not starting with "/", "./"
" or "../"). The directories in the 'path' option may be relative or absolute.
set path+=.,~/,~/repositories/**
"}}}

" {{{ sessionoptions
" Changes the effect of the mksession command. It is a comma separated list of
" words. Each word enables saving and restoring something:
"	word	save and restore
"	blank	empty windows
"	buffers	hidden and unloaded buffers, not just those in windows
"	curdir	the current directory
"	folds	manually created folds, opened/closed folds and local fold
"		options
"	globals	global variables that start with an uppercase letter and
"		contain at least one lowercase letter. Only String and
"		Number types are stored.
"	help	the help window
"	localoptions
"		options and mappings local to a window or buffer (not global
"		values for local options)
"	options	all options and mappings (also global values for local
"		options)
"	resize	size of the Vim window: 'lines' and 'columns'
"	sesdir	the directory in which the session file is located will become
"		the current directory (useful with projects accessed over a
"		network from different systems)
"	slash	backslashes in file names replaced with forward slashes
"	tabpages
"		all tab pages; without this only the current tab page is
"		restored, so that you can make a session for each tab page
"		separately
"	unix	with Unix end-of-line format (single <NL>), even when on
"		Windows or DOS
"	winpos	position of the whole Vim window
"	winsize	window sizes
"
" Don't include both "curdir" and "sesdir".
" When neither "curdir" nor "sesdir" is included, file names are stored with
" absolute paths. "slash" and "unix" are useful on Windows when sharing
" session files with Unix. The Unix version of Vim cannot source dos format
" scripts, but the Windows version of Vim can source unix format scripts.
set sessionoptions-=folds,help,options sessionoptions+=localoptions,resize
"}}}

" {{{ shiftwidth
" Number of spaces to use for each step of (auto)indent. Used for |'cindent'|,
" |>>|, |<<|, etc.
set shiftwidth=4
"}}}

" {{{ showmatch
" When a bracket is inserted, briefly jump to the matching one. The jump is
" only done if the match can be seen on the screen. The time to show the match
" can be set with 'matchtime'.
" A Beep is given if there is no match (no matter if the match can be seen or
" not). This option is reset when the 'paste' option is set. When the 'm' flag
" is not included in 'cpoptions', typing a character will immediately move the
" cursor back to where it belongs.
" See the "sm" field in 'guicursor' for setting the cursor shape and blinking
" when showing the match.
" The 'matchpairs' option can be used to specify the characters to show
" matches for. 'rightleft' and 'revins' are used to look for opposite matches.
" Also see the matchparen plugin for highlighting the match when moving around
" |pi_paren.txt|.
set showmatch
"}}}

" {{{ showtabline
" The value of this option specifies when the line with tab page labels will be
" displayed:
"   0: never
"   1: only if there are at least two tab pages
"   2: always
" This is both for the GUI and non-GUI implementation of the tab pages line.
if has('gui_running')
    set showtabline=2
endif
"}}}

" {{{ smartindent
" Do smart autoindenting when starting a new line. Works for C-like programs,
" but can also be used for other languages. 'cindent' does something like
" this, works better in most cases, but is more strict, see |C-indenting|.
" When 'cindent' is on or 'indentexpr' is set, setting 'si' has no effect.
" 'indentexpr' is a more advanced alternative.
set smartindent
"}}}

" {{{ smarttab
" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'. 'tabstop' or 'softtabstop' is used in other places. A <BS>
" will delete a 'shiftwidth' worth of space at the start of the line.
set smarttab
"}}}

" {{{ softtabstop
" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>. It "feels" like <Tab>s are
" being inserted, while in fact a mix of spaces and <Tab>s is used. This is
" useful to keep the 'ts' setting at its standard value of 8, while being able
" to edit like it is set to 'sts'. However, commands like "x" still work on
" the actual characters.
set softtabstop=4
"}}}

" {{{ spelllang
" A comma separated list of word list names. When the 'spell' option is on
" spellchecking will be done for these languages. Example:
"	set spelllang=en_us,nl,medical
" This means US English, Dutch and medical words are recognized. Words that
" are not recognized will be highlighted.
" The word list name must not include a comma or dot. Using a dash is
" recommended to separate the two letter language name from a specification.
" Thus "en-rare" is used for rare English words. A region name must come last
" and have the form "_xx", where "xx" is the two-letter, lower case region
" name. You can use more than one region by listing them: "en_us,en_ca"
" supports both US and Canadian English, but not words specific for Australia,
" New Zealand or Great Britain.
set spelllang=de_20,de_de,de,en_us,en_gb,en
"}}}

" {{{ spell
" When on spell checking will be done. See |spell|. The languages are specified
" with 'spelllang'.
noremap ,s :set spell!<CR>
"}}}

" {{{ highlight for spell checking
highlight SpellBad term=standout ctermfg=Red term=underline cterm=underline
highlight SpellCap term=underline cterm=underline
highlight SpellRare term=underline cterm=underline
highlight SpellLocal term=underline cterm=underline
"}}}

" {{{ statusline
" When nonempty, this option determines the content of the status line. Also
" see |status-line|.
set statusline=\ file:\ %F\ %y%m%r%w%q%=(%c,%l\ %P)\ "
"}}}

" {{{ suffixes
" Files with these suffixes get a lower priority when multiple files match a
" wildcard. See |suffixes|. Commas can be used to separate the suffixes.
" Spaces after the comma are ignored. A dot is also seen as the start of a
" suffix. To avoid a dot or comma being recognized as a separator, precede it
" with a backslash (see |option-backslash| about including spaces and
" backslashes).
" See 'wildignore' for completely ignoring files. The use of |:set+=| and
" |:set-=| is preferred when adding or removing suffixes from the list. This
" avoids problems when a future version uses another default.
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.bak
"}}}

" {{{ swapfile
" Use a swapfile for the buffer. This option can be reset when a swapfile is
" not wanted for a specific buffer. For example, with confidential information
" that even root must not be able to access. Careful: All text will be in
" memory:
"	- Don't use this for big files.
"	- Recovery will be impossible!
" A swapfile will only be present when |'updatecount'| is non-zero and
" 'swapfile' is set.
" When 'swapfile' is reset, the swap file for the current buffer is
" immediately deleted. When 'swapfile' is set, and 'updatecount' is non-zero,
" a swap file is immediately created.
" Also see |swap-file| and |'swapsync'|.
set noswapfile
"}}}

" {{{ termencoding
" Encoding used for the terminal. This specifies what character encoding the
" keyboard produces and the display will understand. For the GUI it only
" applies to the keyboard ('encoding' is used for the display). Except for the
" Mac when 'macatsui' is off, then 'termencoding' should be "macroman".
set termencoding=utf-8
"}}}

" {{{ undolevels
" Maximum number of changes that can be undone. Since undo information is kept
" in memory, higher numbers will cause more memory to be used (nevertheless, a
" single change can use an unlimited amount of memory). Set to 0 for Vi
" compatibility: One level of undo and "u" undoes itself:
"	set ul=0
" But you can also get Vi compatibility by including the 'u' flag in
" 'cpoptions', and still be able to use CTRL-R to repeat undo. Also see
" |undo-two-ways|.
" Set to a negative number for no undo at all:
"	set ul=-1
" This helps when you run out of memory for a single change.
set undolevels=1000
"}}}

" {{{ viminfo
" When non-empty, the viminfo file is read upon startup and written when
" exiting Vim (see |viminfo-file|). The string should be a comma separated
" list of parameters, each consisting of a single character identifying the
" particular parameter, followed by a number or string which specifies the
" value of that parameter. If a particular character is left out, then the
" default value is used for that parameter. The following is a list of the
" identifying characters and the effect of their value.
set viminfo='5,/25,:100,h,s1000
"}}}

" {{{ wildignorecase
" When set case is ignored when completing file names and directories. Has no
" effect on systems where file name case is generally ignored. Does not apply
" when the shell is used to expand wildcards, which happens when there are
" special characters.
if exists('&wildignorecase')
    set wildignorecase
endif
"}}}

" {{{ wildmenu
" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
" On pressing 'wildchar' (usually <Tab>) to invoke completion, the possible
" matches are shown just above the command line, with the first match
" highlighted (overwriting the status line, if there is one). Keys that show
" the previous/next match, such as <Tab> or CTRL-P/CTRL-N, cause the highlight
" to move to the appropriate match. When 'wildmode' is used, "wildmenu" mode
" is used where "full" is specified. "longest" and "list" do not start
" "wildmenu" mode. If there are more matches than can fit in the line, a ">"
" is shown on the right and/or a "<" is shown on the left. The status line
" scrolls as needed.
set wildmenu
"}}}

" {{{ wildmode
" Completion mode that is used for the character specified with 'wildchar'. It
" is a comma separated list of up to four parts. Each part specifies what to
" do for each consecutive use of 'wildchar'. The first part specifies the
" behavior for the first use of 'wildchar', The second part for the second
" use, etc.
" These are the possible values for each part:
"	""		Complete only the first match.
"	"full"		Complete the next full match. After the last match,
"			the original string is used and then the first match
"			again.
"	"longest"	Complete till longest common string. If this doesn't
"			result in a longer string, use the next part.
"	"longest:full"	Like "longest", but also start 'wildmenu' if it is
"			enabled.
"	"list"		When more than one match, list all matches.
"	"list:full"	When more than one match, list all matches and
"			complete first match.
"	"list:longest"	When more than one match, list all matches and
"			complete till longest common string.
" When there is only a single match, it is fully completed in all cases.
set wildmode="list:longest"
"}}}

" {{{ winheight
" Minimal number of lines for the current window. This is not a hard minimum,
" Vim will use fewer lines if there is not enough room. If the focus goes to a
" window that is smaller, its size is increased, at the cost of the height of
" other windows.
if has("gui_running")
    set winheight=5
elseif &diff
    set winheight=15
else
    set winheight=3
endif
"}}}

"{{{ winfixheight
" Keep the window height when windows are opened or closed and 'equalalways'
" is set. Also for |CTRL-W_=|. Set by default for the |preview-window| and
" |quickfix-window|.
" The height may be changed anyway when running out of room.
set winfixheight
"}}}

" {{{ winfixwidth
" Keep the window width when windows are opened or closed and 'equalalways' is
" set. Also for |CTRL-W_=|.
" The width may be changed anyway when running out of room.
set winfixwidth
"}}}

" {{{ winminheight
" The minimal height of a window, when it's not the current window.
" This is a hard minimum, windows will never become smaller.
" When set to zero, windows may be "squashed" to zero lines (i.e. just a
" status bar) if necessary. They will return to at least one line when they
" become active (since the cursor has to have somewhere to go.)
" Use 'winheight' to set the minimal height of the current window.
" This option is only checked when making a window smaller. Don't use a large
" number, it will cause errors when opening more than a few windows. A value
" of 0 to 3 is reasonable.
if has("gui_running")
    set winminheight=5
elseif &diff
    set winminheight=15
else
    set winminheight=3
endif
"}}}

" {{{ winminwidth
" The minimal width of a window, when it's not the current window.
" This is a hard minimum, windows will never become smaller.
" When set to zero, windows may be "squashed" to zero columns (i.e. just a
" vertical separator) if necessary. They will return to at least one line when
" they become active (since the cursor has to have somewhere to go.)
" Use 'winwidth' to set the minimal width of the current window.
" This option is only checked when making a window smaller. Don't use a large
" number, it will cause errors when opening more than a few windows. A value
" of 0 to 12 is reasonable.
if has("gui_running")
    set winminwidth=20
else
    set winminwidth=10
endif
"}}}

" {{{ wrapmargin
" Number of characters from the right window border where wrapping starts.
" When typing text beyond this limit, an <EOL> will be inserted and inserting
" continues on the next line.
" Options that add a margin, such as 'number' and 'foldcolumn', cause the text
" width to be further reduced. This is Vi compatible. When 'textwidth' is
" non-zero, this option is not used.
" See also 'formatoptions' and |ins-textwidth|. {Vi: works differently and
" less usefully}
set wrapmargin=5
"}}}
"}}}

" {{{ functions
"{{{ StripTrailingWhitespace
function! StripTrailingWhitespace()
    normal mZ
    silent %s/\s\+$//e
    normal `Z
endfunction
"}}}

" {{{ format file
function! FormatFile()
    execute "normal msHmtgg"
    execute "normal gg=G"
    execute "normal 'tzt`s"
endfunction
nnoremap <silent> ,m :call FormatFile()<CR>
"}}}
"}}}

" {{{ autocommands
if has("autocmd")
    " {{{ doJump
    augroup doJump
        autocmd!
        " The following to have Vim jump to the last position when reopening a
        " file
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <=line("$")
                    \| exe "normal g'\"" | endif
    augroup END
    "}}}

    " {{{ loadDictionary
    augroup loadDictionary
        autocmd!
        " automatically load dictionaries for known syntaxes
        autocmd FileType * exe("setlocal dictionary+=" . $VIMRUNTIME . "/syntax/" . &filetype . ".vim")
    augroup END
    "}}}

    " {{{ loadOmniFunc
    augroup loadOmniFunc
        autocmd!
        " This option specifies a function to be used for Insert mode omni
        " completion with CTRL-X CTRL-O. |i_CTRL-X_CTRL-O|
        " See |complete-functions| for an explanation of how the function is
        " invoked and what it should return.
        autocmd FileType * setlocal omnifunc=syntaxcomplete#Complete
        autocmd FileType c setlocal omnifunc=ccomplete#Complete
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup END
    "}}}

    " {{{ loadFoldMethod
    augroup loadFoldMethod
        autocmd!
        autocmd FileType c setlocal foldmethod=syntax
        autocmd FileType javascript setlocal foldmethod=syntax
        autocmd FileType php setlocal foldmethod=syntax
        autocmd FileType python setlocal foldmethod=syntax
        autocmd FileType ruby setlocal foldmethod=syntax
        autocmd FileType sql setlocal foldmethod=syntax
    augroup END
    "}}}

    " {{{ extraWhitespace
    augroup extraWhitespace
        autocmd!
        autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
        autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match ExtraWhitespace /\s\+$/
        autocmd BufWinLeave * call clearmatches()
    augroup END
    "}}}

    " {{{ pluginConf
    " don't load certain plugins depending on filetype
    augroup pluginConf
        autocmd!
        autocmd FileType mail let g:loaded_AutoClose = 1
    augroup END
    "}}}

    " {{{ specFile
    "augroup specFile
        "autocmd
        "augroup BufReadCmd *.doc,*.docx,*.gif,*.jpg,*.JPG,*.odt,*.pdf,*.png,*.ppt,*.xls,*.xlsx :call netrw#NetrwBrowseX(expand("<amatch>"),0)|enew!
    "augroup END
    "}}}
endif
"}}}

" {{{ mapping
" Don't use Ex mode, use Q for formatting
nnoremap <silent> Q gq

" place the cursor by default after the inserted text
nnoremap <silent> p gp
nnoremap <silent> P gP

" the default behaviour should be available too
nnoremap <silent> gp p
nnoremap <silent> gP P

" cycle through buffers, gont use tabs (dont like them)
nnoremap <silent> ,b0 :confirm blast<CR>
nnoremap <silent> ,bn :confirm bnext<CR>
nnoremap <silent> ,bp :confirm bprevious<CR>

" close buffers
nnoremap <silent> ,bq :confirm bdelete<CR>
nnoremap <silent> ,bQ :confirm quitall<CR>
nnoremap <silent> ,bw :write<CR>

" replace german umlauts
imap <silent> ä ae
imap <silent> Ä Ae
imap <silent> ü ue
imap <silent> Ü Ue
imap <silent> ö oe
imap <silent> Ö Oe
imap <silent> ß ss

" tab navigation like firefox
if has('gui_running')
    nnoremap <A-1> 1gt
    nnoremap <A-2> 2gt
    nnoremap <A-3> 3gt
    nnoremap <A-4> 4gt
    nnoremap <A-5> 5gt
    nnoremap <A-6> 6gt
    nnoremap <A-7> 7gt
    nnoremap <A-8> 8gt
    nnoremap <A-9> 9gt
    nnoremap <A-0> 10gt

    nnoremap <C-t> :tabnew<CR>
endif
"}}}

" {{{ abbreviation
" this is usefull when your name René is
iabbrev 'e é
"}}}

" {{{ syntax
" {{{ Java
" All identifiers in java.lang.* are always visible in all classes. To highlight
" them use
let g:java_highlight_java_lang_ids = 1

" }}}

" {{{ PHP
" {{{ SQL Query
" If you like SQL syntax highlighting inside Strings
let g:php_sql_query = 1
"}}}

" {{{ HTML syntax
" Enable HTML syntax highlighting inside strings
let g:php_htmlInStrings = 1
"}}}

" {{{ short Tags
" Disable short tags
let g:php_noShortTags = 1
"}}}

" {{{ folding
" Enable folding for classes and functions
let g:php_folding = 1
"}}}
"}}}
"}}}

" {{{ global options for plugins
" {{{ Bufexplrorer disabled
let g:bufexplorer_version=1
" }}}

" {{{ MiniBufExpl disabled
let g:loaded_minibufexplorer=1
" }}}

" {{{ Calendar
" if you want to keep focus when goto next or prev calendar, add the following
" to your .vimrc:
let g:calendar_focus_today=1

" if you want the week to start with monday, add below to your .vimrc:
"   let g:calendar_monday=1
" (You don't have to to change g:calendar_wruler!)
let g:calendar_monday=1
"}}}

" {{{ EnhancedCommentify
" With this option set, the script tries to figure out which filetype to use
" for every block by using the synID of the block. This improves handling of
" embedded languages eg. CSS in HTML, Perl in VimL... But be aware, that this
" feature currently relies on a special form of the names of the syntax items.
" So it might not work with every syntax file (see EnhComm-Bugs). It also
" calls synID only once for every block! So the first line is significant. Be
" aware, that "cross" commenting might cause problems.
let g:EnhCommentifyUseSyntax='Yes'
"}}}

" {{{ Latex
" If the first line of a *.tex file has the form
"	%&<format>
" then this determined the file type: plaintex (for plain TeX), context (for
" ConTeXt), or tex (for LaTeX). Otherwise, the file is searched for keywords
" to choose context or tex. If no keywords are found, it defaults to plaintex.
" You can change the default by defining the variable g:tex_flavor to the
" format (not the file type) you use most. Use one of these:
"	let g:tex_flavor = "plain"
"	let g:tex_flavor = "context"
"	let g:tex_flavor = "latex"
" Currently no other formats are recognized.
let g:tex_flavor="latex"
"}}}

"{{{ Latex-Suite
" {{{ Tex_DefaultTargetFormat
" Use this setting to choose the default target format. For example, setting
" this to pdf makes Latex-Suite compile a pdf file when you press \ll and fire
" up the pdf viewer on pressing \lv. Make sure that a rules for compiling and
" viewing have been defined for this target format as described here [|ls_a_dx|]
" and here [|ls_a_dF|].
let g:Tex_DefaultTargetFormat='pdf'
"}}}

" {{{ ViewRule
" Here <format> refers to a format such as dvi, ps, etc. This variable defines
" the program which will be called to display a file of that format.
"
" By default, Latex-Suite defines viewer programs for viewing DVI, PS and PDF
" formats as follows:
"                       Windows       Unix~
" g:Tex_ViewRule_dvi    'yap -1'      'xdvi'
" g:Tex_ViewRule_ps     'gsview32'    'ghostview'
" g:Tex_ViewRule_pdf    'AcroRd32'    'xpdf'
"
" For Macintosh systems, these strings are left empty by default. This lets the
" system pick the program for each format. If you define these variables for
" Mac, the system choice will be over-ridden.
"
" Latex-Suite appends file.format to the above settings while calling the
" external programs. For example, with
"   let g:Tex_ViewRule_dvi = 'yap -1'
" yap is called as
"   !start yap -1 file.dvi
" from within Vim. (The initial start is used on Windows platforms is to make
" yap start as a separate process.) If you find the way Latex-Suite constructs
" the command line too restrictive, you can use the Tex_ViewRuleComplete_format
" [|ls_a_dG|] setting for more complete control on how the command line is
" constructed while calling the external program for viewing.
"
" NOTE: For windows, you will need to set the $PATH variable to include the
"       paths to yap, AcroRd32, gsview32 and any other programs. See your system
"       documentation for how to do this.
"
" NOTE: Default Viewing Format
"       ----------------------
" To change the default format for viewing files, set the
" g:Tex_DefaultTargetFormat [|ls_a_dw|] variable.
let g:Tex_ViewRule_pdf='zathura'
"}}}
"}}}

" {{{ NERDTree
" {{{ toggle display
nnoremap <silent> <C-w><C-n> :NERDTreeToggle<CR>
"}}}}

" {{{ NERDTreeChDirMode
let g:NERDTreeChDirMode=2
"}}}

" {{{ NERDTreeBookmarksFile
let g:NERDTreeBookmarksFile=expand("${HOME}/.vim-bookmarks")
"}}}

" {{{ NERDTreeQuitOnOpen
let g:NERDTreeQuitOnOpen=1
"}}}

" {{{ NERDTreeWinSize
let g:NERDTreeWinSize=50
"}}}
"}}}

" {{{ PDV
inoremap <C-P> <ESC>:set nopaste<CR>:call PhpDocSingle()<CR>:set paste<CR>i
nnoremap <C-P> <ESC>:set nopaste<CR>:call PhpDocSingle()<CR>:set paste<CR>
vnoremap <C-P> <ESC>:set nopaste<CR>:call PhpDocRange()<CR>:set paste<CR>
"}}}

" {{{ PHP-Getter-Setter
" {{{ no_plugin_maps
" Setting this variable will disable all key mappings defined by any of your
" plugins (if the plugin writer adhered to the standard convention documented in
" the scripting section of the VIM manual) including this one.
let g:no_plugin_maps = 0
"}}}
"}}}

" {{{ Session
" {{{ session_command_aliases
" The names of the commands defined by the session plug-in start with the action
" they perform, followed by the string 'Session'. Some people prefer it the
" other way around because they find it easier to remember and you can type
" ':Session<Tab>' to get completion of all available commands (actually this
" works with the other style as well if you type ':*Session<Tab>' but I
" digress).
let g:session_command_aliases = 1
"}}}

" {{{ session_autosave
" By default this option is set to 'prompt'. When you've opened a session and
" you quit Vim, the session plug-in will ask whether you want to save the
" changes to your session. Set this option to 'yes' to always automatically save
" open sessions when you quit Vim. To completely disable automatic saving you
" can set this option to 'no'.
let g:session_autosave = 'yes'
" }}}
" }}}

" {{{ Syntastic
" {{{ syntastic_auto_jump
" Enable this option if you want the cursor to jump to the first detected error
" when saving or opening a file:
let g:syntastic_auto_jump = 1
"}}}

" {{{ syntastic_auto_loc_list
" Use this option to tell syntastic to automatically open and/or close the
" |location-list| (see |syntastic-error-window|).
"
" When set to 0 the error window will not be opened or closed automatically. >
"     let g:syntastic_auto_loc_list=0
" When set to 1 the error window will be automatically opened when errors are
" detected, and closed when none are detected.
"     let g:syntastic_auto_loc_list=1
" When set to 2 the error window will be automatically closed when no errors are
" detected, but not opened automatically.
"     let g:syntastic_auto_loc_list=2
let g:syntastic_auto_loc_list = 1
"}}}
"}}}

" {{{ TagBar
" {{{ toggle display
nnoremap <silent> <C-w><C-t> :TagbarToggle<CR>
"}}}

" {{{ tagbar_width
" Width of the Tagbar window in characters.
let g:tagbar_width = 30
"}}}

" {{{ tagbar_foldlevel
" The initial foldlevel for folds in the Tagbar window. Folds with a level
" higher than this number will be closed.
let g:tagbar_foldlevel = 2
"}}}

" {{{ tagbar_autoshowtag
" If this variable is set and the current tag is inside of a closed fold then
" the folds will be opened as much as needed for the tag to be visible so it can
" be highlighted. If it is not set then the folds won't be opened and the parent
" tag will be highlighted instead. You can use the |:TagbarShowTag| command to
" open the folds manually.
let g:tagbar_autoshowtag = 1
"}}}

" {{{ tagbar_type_sql
let g:tagbar_type_sql = {
    \ 'replace' : 1,
    \ 'ctagstype' : 'sql',
    \ 'kinds' : [
        \ 'P:packages',
        \ 'd:prototypes',
        \ 'c:cursors',
        \ 'f:functions',
        \ 'F:record fields:1:0',
        \ 'L:block label',
        \ 'p:procedures',
        \ 's:subtypes',
        \ 't:tables',
        \ 'T:triggers',
        \ 'v:variables',
        \ 'i:indexes',
        \ 'e:events',
        \ 'U:publications',
        \ 'R:services',
        \ 'D:domains',
        \ 'V:views',
        \ 'n:synonyms',
    \ ],
\ }
"}}}
"}}}

" {{{ Tagbar-PHP-CTags
let g:tagbar_phpctags_bin="~/.vim/PHPCTags/phpctags"
"}}}

" {{{ YankRing
" {{{ yankring_max_history
" Controls how many elements to save in the yankring.
let g:yankring_max_history = 25
"}}}

" {{{ yankring_history_file
" The history filename prefix can be controlled by setting this variable. You
" can put the following in your |vimrc|.
let g:yankring_history_file = '.vim_history'
"}}}
"}}}
"}}}

" vim: filetype=vim textwidth=80 foldmethod=marker
