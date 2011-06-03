version 6.0
" make vim useful!
set nocompatible

"
" map x keys
"=============================================================================

map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>

" Set up xterm for 8 colours. See *xterm-color* in help.
"
"if &term =~ "xterm"
"	if has("terminfo")
"	  set t_Co=8
"	  set t_Sf=[3%p1%dm
"	  set t_Sb=[4%p1%dm
"	else
"	  set t_Co=8
"	  set t_Sf=[3%dm
"	  set t_Sb=[4%dm
"	endif
"endif

" 16 colour xterm setup
"if has("terminfo")
"  set t_Co=16
"  set t_AB=<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
"  set t_AF=<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
"else
"  set t_Co=16
"  set t_Sf=<Esc>[3%dm
"  set t_Sb=<Esc>[4%dm
"endif



"
" Read writing backup etc
"=============================================================================

set ffs=unix,dos,mac   " EOL types to try
" Write a viminfo file
set viminfo='50,\"1000,n~/.viminfo
" Backups
"set backup
set writebackup          " Write a backup while saving and remove it afterwards
set backupcopy=yes
"set backupext=~mda



"
" Interface
"=============================================================================

" Number of lines (or subs with s///) that have to change for a message to be
" given. =0 for allways message.
set report=1

" show cursor pos all the time
set ruler

" Search
set hlsearch            " Highlight search matches set hlsearch
set incsearch           " and show part matches

" What to display in the status line
"
" Colour. Can set the hl groups User1..User9 for use in this string. Only
" font,guifb and guibg have any effect.
" Set colour with %1*. which sets User1. %* or %0*. resets to normal
" See mda_dark colour scheme for the User1 used here
set statusline=<%n>\ %1*\ %f\ %*%r%m\ %y%<\ %=\ (%l/%L,%c%V)\ %P

" Show partial command in status line
set showcmd


" Allow backspace over everyting in insert mode
set backspace=indent,eol,start

" Use terminal mouse in normal mode
set mouse=n

" Command history
set history=100

" Display status line always
set laststatus=2   " 0=never 1=only with 2+ windows 2=always

" Chars to display at end of lines when nowrap.
set listchars+=precedes:<,extends:>

" How much to scroll when no wrap
set sidescroll=4

" How near the bottom before scroll
set so=4


" Completion
"=============================================================================

" When doing completion with wildchar (Tab!) display list of matches in status
" line and highlight the current match.
set wildmenu

" Normal vim stype use of Tab completion (the way we like it!)
set wildmode=longest,list:full

" File patterns to ignore when doing filename completion
" Not use set+= and set-=
"set wildignore+=

" Suffixes of files that should appear later in the completion list ie lower
" priority.
" (default ".bak,~,.o,.h,.info,.swp,.obj")
"set suffixes+=
"



"
" Buffers
"=============================================================================

" What todo when a buffer is nolonger visable
set bufhidden=hide
" Dont use a swapfile as its bad with big files.
"set noswapfile


"
" Formatting
"============================================================================= 

set autoindent          " Indent of next line follwos previous line.
set expandtab
set shiftwidth=4
set tabstop=4
set textwidth=79

" Format opts on
" -t Auto-wrap (at textwidth) text
" -c Auto-wrap comments
" -q Allow gq formatting of comments
" -l Long lines not broken in instert mode
" -r Auto insert comment leader after <Enter> in insert mode
" -n Sort indent on numbered lists
" -a Auto format paras as they change
"  TODO: Use long form of set for these
set formatoptions=tcqlrn



"
" Colours
"=============================================================================

" Note: Syntax on also does :filetype on
syntax on
colorscheme mda_dark



"
" Console menus
"=============================================================================

source $VIMRUNTIME/menu.vim
" Requires set wildmenu (above)
" set cpo-=<
set wcm=<C-Z>  " Wild charm. Use <C-Z> to start wild completion in macro's
map <F4> :emenu <C-Z>



"
" GUI
"=============================================================================

"set guifontset=-*-Monospace-medium-r-normal--10-*-*-*-c-*-*-*,-*-*-medium-r-normal--14-*-*-*-c-*-*-*,-*-*-medium-r-normal--14-*-*-*-m-*-*-*,*
set guifont=Monospace\ 9
" No toolbar
set guioptions-=T



"
" FileType plugin.
"=============================================================================
"
" See ~/.vim/ftplugin/*.vim and ~/.vim/ftplugin/*.vim for my settings.

" let myscriptsfile = "~/.vim/scripts.vim"
filetype plugin on
filetype indent on


"
" Folding
"=============================================================================

set foldcolumn=6
set foldmethod=indent

" Min lines for current window. Not a hard limit!
set winheight=6

" Allow windows to squash down to just a status bar
set winminheight=0


"
" File browser plugin
"=============================================================================

" Split vertical when opening 0=horizontal
let g:explVertical=1
" Put new window to right of explorer window 0=above Works when g:explVertical=1
let g:explSplitRight=1
" Put new window below explorer window 0=above Works when g:explVertical=0
let g:explSplitBelow=1
let g:explStartRight=0    " Put new explorer window to the left of the
			              " current window
let g:explStartBelow=1
" After opening a file with the 'o' command, resize the explorer window.
" N is the number of rows (when the window is split horizontally) or the number
" of columns (when the window is split vertically).  If g:explWinSize is set to
" an empty string (""), resizing will not be done.  g:explWinSize defaults to
" 15.
let g:explWinSize=12

" The format of date displayed (after pressing 'i')
" Explorer uses this variable to pass to strftime() to fetch
" the date information. |strftime()|  The default is >
" let g:explDateFormat="%d %b %Y %H:%M"

" Hide filetypes. Fill var with regexps
" let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$'

" Use a single line help message at top
"let g:explDetailedHelp=0

" Set default sort order
"let g:explSortBy='name'          " Can also use 'date' or 'size'
"let g:explSortBy='reverse name'

" Where do the directories go?
" 1 = Top of list. 0 = mixed in. -1 = bottom
let g:explDirsFirst=1

" To control the segregation of files matching the suffixes option
" 1 = top (Default). 0 = mixed. -1 = bottom.
"let g:explSuffixesLast=1

" Directories and files matching the suffixes list will be highlighted.  If you
" have the directories, files, and suffixes separated, add a
" separator line between the groups
"let g:explUseSeparators=1    " Use separator lines



"
" Man page viewing
"=============================================================================

" Allow use of :Man command before any man pages have been loaded
runtime ftplugin/man.vim

" :Man ls    - View, highlighted, man page for ls in split
" <Leader>K  - View man page for word under the cursor
"
" Local maps
" CTRL-]     - Man page of word under cursor
" CTRL-T     - Jump previous man page
"
" TODO: How do we set this up for perldoc pages.


"
" matchit plugin
"
" Turn on % key style bracket matchiing for tags. From the matchit plugin.
let b:match_words = &matchpairs



"
" Maps
"=============================================================================

" Tab switching
map <C-PageUp> :tabprev<Return>
map <C-PageDown> :tabnext<Return>
