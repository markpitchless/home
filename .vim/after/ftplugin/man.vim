" Only do this when not done yet for this buffer
"if exists("b:did_ftplugin")
"   finish
"endif


" Mappings
"=============================================================================

" From VIMTIP#397
" map ctrl-] (follow help link) to <enter> in normal mode only for this buffer
nmap <buffer><cr> <c-]>

" map ctrl-T to (back help page) <backspace> in normal mode only for this buffer
nmap <buffer><bs> <c-T>
