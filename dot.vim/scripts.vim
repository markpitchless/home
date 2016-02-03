" User Vim support file to detect file types in scripts. This is loaded before
" the default file so overrides $VIMRUNTIME/scripts.vim
"

" This file is called by an autocommand for every file that has just been
" loaded into a buffer.  It checks if the type of file can be recognized by
" the file contents.  The autocommand is in $VIMRUNTIME/filetype.vim.

" Only do the rest when the FileType autocommand has not been triggered yet.
if did_filetype()
  finish
endif

"
" e.g.
"
"if did_filetype()	" filetype already set..
"  finish		" ..don't do these checks
"endif
"if getline(1) =~ '^#!.*\<mine\>'
"  setfiletype mine
"elseif getline(1) =~? '\<drawing\>'
"  setfiletype drawing
"endif
"
" See $VIMRUNTIME/scripts.vim for more examples

