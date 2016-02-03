" vimscript#65
"
" vim cd's to the dir of the current buffer.
"
" Author: Rich Harkins

au   BufEnter *   execute ":lcd " . expand("%:p:h") 
