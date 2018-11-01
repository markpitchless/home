" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
    finish
endif

"
" Syntax highlighting
"=============================================================================

" Use bash highlights
let bash_is_sh=1

" Highlight single quotes inside double quotes eg "x 'x' x"
let highlight_balanced_quotes=1

let highlight_function_name=1

" let sh_minlines=   " Number of lines for synchronization
" let sh_maxlines=   " Limit number of lines for synchronization (go faster)
