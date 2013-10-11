" Mark Pitchless vim config.

" 2013-10-11. Lots of tweaks from here:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" make vim useful!
set nocompatible

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


"set encoding=utf-8


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

" Writes FILE.un~ files for saved undo history
set undofile


"
" Interface
"=============================================================================

" Number of lines (or subs with s///) that have to change for a message to be
" given. =0 for allways message.
set report=1

" show cursor pos all the time
set ruler

" What to display in the status line
"
" Colour. Can set the hl groups User1..User9 for use in this string. Only
" font,guifb and guibg have any effect.
" Set colour with %1*. which sets User1. %* or %0*. resets to normal
" See mda_dark colour scheme for the User1 used here
set statusline=<%n>\ %1*\ %-0.50f\ %*%r%m\ %y%<\ %=\ (%l/%L,%c%V)\ %P

" Show mode and partial command in status line
set showmode
set showcmd

" Allow backspace over everyting in insert mode
set backspace=indent,eol,start

set colorcolumn=80

" Use terminal mouse in normal mode
set mouse=n

" Command history
set history=100

" Display status line always
set laststatus=2   " 0=never 1=only with 2+ windows 2=always

" Show hidden chars and make tab and eol look nice with some unicode
set list
set listchars+=tab:▸\ ,eol:¬,trail:☠
" Chars to display at end of lines when nowrap.
set listchars+=precedes:<,extends:>

" How much to scroll when no wrap
set sidescroll=4

" How near the bottom before scroll
set scrolloff=4

set ttyfast
"set relativenumber



" Search
"=============================================================================
set hlsearch            " Highlight search matches set hlsearch
set incsearch           " and show part matches

" Insert \v before search strings so we get more perl like regexp
nnoremap / /\v
vnoremap / /\v

" If you search for an all-lowercase string your search will be
" case-insensitive, but if one or more characters is uppercase the search will
" be case-sensitive.
set ignorecase
set smartcase

set gdefault


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
set softtabstop=4
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
set formatoptions=tcqlrn1


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
"set guifont=Monospace\ 9
"This sets font to sans not Droid...
"set guifont=Droid\ Sans\ Mono\ 9,Monospace\ 9
"...but this works. wtf?
set guifont=Droid\ Sans\ Mono\ 9
" No toolbar
set guioptions-=T

"
" Pathogen bundle (plugin) manager.
" See: https://github.com/tpope/vim-pathogen
" See: http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen/
" Plugins go in .vim/bundle
"=============================================================================
execute pathogen#infect()
execute pathogen#helptags()


"
" Colours
"=============================================================================

" Note: Syntax on also does :filetype on
syntax on
colorscheme mda_dark

"
" FileType plugin.
"=============================================================================
"
" See ~/.vim/ftplugin/*.vim and ~/.vim/ftplugin/*.vim for my settings.

" let myscriptsfile = "~/.vim/scripts.vim"
filetype plugin on
filetype indent on

" Write changes on loss of focus
"au FocusLost * :wa

" xacro are xml macro files used by ROS
au BufNewFile,BufRead *.xacro set filetype=xml
" urdf are xml files from ROS - universal robot description format
au BufNewFile,BufRead *.urdf set filetype=xml
" ROS launch files
au BufNewFile,BufRead *.launch set filetype=xml


"
" Highlight the current line (cursorline)
" http://vim.wikia.com/wiki/Highlight_current_line
"=============================================================================
set cursorline
"set columnline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"To highlight the current line, and have the highlighting stay where it is when
"the cursor is moved, use this mapping:
"
":nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
"
"With the default backslash leader key, pressing \l will highlight the line
"that currently contains the cursor. The mapping also sets mark l so you can
"type 'l to return to the highlighted line. Enter :match to clear the
"highlighting when finished.
"
"To highlight the current virtual column (column after tabs are expanded), and
"have the highlighting stay where it is when the cursor is moved, use this
"mapping:
"
":nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>


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

" x keys
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

" Clear the current search
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

" Make wrapped lines easier, move cursor by screen lines not file lines.
nnoremap j gj
nnoremap k gk
nnoremap <up> g<up>
nnoremap <down> g<down>

" Map faster keys for window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-left> <C-w>h
nmap <C-down> <C-w>j
nmap <C-up> <C-w>k
nmap <C-right> <C-w>l


" NERDTree bundle
" Auto open tree if no files. Close if only tree left.
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDCommenter
nmap <leader># <leader>c<space>
vmap <leader># <leader>c<space>
