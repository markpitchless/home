
"
" Custom filetype detection
"
" This file is sourced before the global FiltType commands have been installed
" and the commands here will match first.
"
" NB: You must restart vim for changes to take effecs

" Don't run this if we already have
if exists("did_load_filetypes")
	finish
endif

" e.g.
"augroup filetypetest
"	au! BufRead,BufNewFile *.mime	setfiletype mime
"	au! BufRead,BufNewFile *.xyz	setfiletype drawing
"augroup END

" JSON
" http://vimawesome.com/plugin/json-vim
augroup json
    au! BufRead,BufNewFile *.json set filetype=json
augroup END

"
" Fish
"
augroup fish
    au! BufRead,BufNewFile *.fish   setfiletype sh
augroup END

"
" ROS
"
augroup ros
    au! BufRead,BufNewFile *.rosinstall   setfiletype yaml
augroup END

"
" Template Toolkit
"

au BufNewFile,BufRead *.tt2 setf tt2
au BufNewFile,BufRead *.tt setf tt2
"        or
"au BufNewFile,BufRead *.tt2
"    \ if ( getline(1) . getline(2) . getline(3) =~ '<\chtml'
"    \           && getline(1) . getline(2) . getline(3) !~ '<[%?]' )
"    \   || getline(1) =~ '<!DOCTYPE HTML' |
"    \   setf tt2html |
"    \ else |
"    \   setf tt2 |
"    \ endif
"
"define START_TAG, END_TAG
"    "ASP"
"    :let b:tt2_syn_tags = '<% %>'
"    "PHP"
"    :let b:tt2_syn_tags = '<? ?>'
"    "TT2 and HTML"
"    :let b:tt2_syn_tags = '\[% %] <!-- -->' 
