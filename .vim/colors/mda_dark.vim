" Vim color file
" Maintainer:   markpitchless <markpitchless@gmail.com>
" Last Change:  27th Feb 2012
" URL:

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" Reset the colors (with dark bg) so we can use all our own settings.
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="mda_dark"


" TODO: How do we set up our own colour names? ie can we create a theme like
" setup?

"
" Normal
"=============================================================================

" The normal group is used when no highlighting is on. Note, that setting
" ctermbg can cause the background= option to change! Set Normal first.
"hi Normal guifg=#ECECEC	guibg=#000020	ctermfg=White ctermbg=Black	term=NONE
" Use gnome-terminal transparent color for ctermbg
hi clear Normal
hi Normal   guifg=#ECECEC   guibg=#000010  ctermbg=NONE   ctermfg=Grey term=NONE

" TODO: Add font settings

"
" Vim interface
"=============================================================================
" *highlight-groups*

"hi Cursor
"hi CursorIM

" Status lines, fold bars etc
"
" #443F5E
hi VertSplit	guifg=Black		guibg=#B3B3B3	gui=NONE ctermfg=DarkMagenta
hi StatusLine	guifg=#FFF701	guibg=#8522A1	gui=NONE ctermfg=DarkMagenta ctermbg=Grey
hi StatusLineNC guibg=#451153 	guifg=#888888	gui=NONE ctermfg=DarkMagenta
	" Not current status line. Hides any text in line by using the same
	" colours. There are codes in StatusLine= that colour the filename.
" Colour used in status line for filename
hi User1 guibg=#5B176E guifg=#EFEF0A

"hi LineNr
"hi Folded     guibg=#443F5E   guifg=#CCCCCC   gui=NONE
"hi FoldColumn guibg=#443F5E   guifg=#CCCCCC   gui=NONE
hi Folded     guibg=#1A1824   guifg=#AAAAAA   gui=NONE ctermfg=DarkMagenta ctermbg=DarkGrey
hi FoldColumn guibg=#1A1824   guifg=#CCCCCC   gui=NONE ctermfg=DarkMagenta ctermbg=DarkGrey
"hi WildMenu

hi ColorColumn term=reverse ctermbg=0 ctermfg=DarkGrey guibg=#1A1824

" Messages
"
hi ErrorMsg	guifg=Red	guibg=Black	gui=bold
"hi ModeMsg
	" e.g. -- INSERT --
"hi MoreMsg
"hi Question
"hi WarningMsg

" ~ and @ at the end of window, newlines from set list, etc
hi NonText guifg=#292939 ctermfg=DarkGrey
" Meta and special keys listed with :map. Also unprintable chars like tabs
"hi SpecialKey
hi SpecialKey guifg=#292939 ctermfg=DarkGrey

" Visual mode and search
"
hi Visual		guibg=Yellow	guifg=bg	gui=NONE
"hi Visual		gui=reverse
"hi Visual		guibg=bg	guifg=Yellow	gui=Bold,Underline
"hi VisualNOS
	" Visual selection when VIM doesn't own the selection. Only X11 gui and
	" xterm-clipboard
hi IncSearch	guifg=#FDC600	guibg=bg	gui=underline,bold	ctermbg=magenta
hi Search	guifg=Yellow	guibg=bg	gui=bold,underline	ctermbg=magenta

"hi Title
hi Directory	guifg=#C4A000	gui=NONE	ctermfg=DarkYellow

" Diff colours
"
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText

" GUI
"
"hi Menu
"hi Scrollbar
"hi Tooltip

" Current line highlight. Turn on with set cursorline
" http://vim.wikia.com/wiki/Highlight_current_line
hi CursorLine term=reverse ctermbg=0 cterm=None
hi CursorLine guibg=#1A1824
"hi CursorColumn

"
" syntax highlighting groups
"=============================================================================
" See *group-name*

hi Comment		guifg=#2865A4	ctermfg=DarkBlue	term=bold
hi Constant		guifg=#AC4303	ctermfg=DarkRed
	" Sub-groups
	hi String guifg=#4E9A06 ctermfg=DarkGreen
	"hi Character
	"hi Number
	"hi Boolean
	"hi Float
hi Identifier	guifg=#069898	ctermfg=DarkCyan
	hi Function guifg=#75507B   ctermfg=DarkMagenta
	hi perlMethod guifg=#75507B   ctermfg=DarkMagenta

" TODO: Perl syntax highlights sub { as a statement but I want it as a
" Function so I can add extra Bold hilights to it

hi Statement	guifg=#C4A000	gui=NONE	ctermfg=DarkYellow
	"hi Conditional
	"hi Repeat
	"hi Label
	"hi Operator
	"hi Keyword
	"hi Exception
hi PreProc		guifg=#F900ED	ctermfg=DarkMagenta
	 "hi Include
	 "hi Define
	 "hi Macro
	 "hi PreCondit
hi Type			guifg=#2EF906	gui=NONE	ctermfg=DarkGreen
"hi Type			guifg=#C600BD	gui=NONE	ctermfg=DarkGreen
	 "hi StorageClass
	 "hi Structure
	 "hi Typedef
hi Special		guifg=#F900ED	ctermfg=Magenta
	 "hi SpecialChar
	 "hi Tag
	 "hi Delimiter
	 "hi SpecialComment
	 "hi Debug
hi Underlined	gui=underline	cterm=underline	term=underline
hi Ignore		guifg=#ACACAC	ctermfg=Gray
hi Error		guifg=#FF0000	guibg=bg	gui=underline	ctermbg=Red	term=reverse
hi Todo			guifg=Magenta	guibg=bg	ctermfg=fg ctermbg=Magenta	term=reverse



"
" Custom
"=============================================================================

" Highligh trailing whitspace at the end of lines
" VIMTIP#396
highlight WhitespaceEOL guibg=bg guifg=Red	gui=underline	ctermbg=red
match WhitespaceEOL /\s\+$/
