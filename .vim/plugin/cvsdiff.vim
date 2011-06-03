" CVSdiff - vimtip#390
"
" Author: Jens Finkhauser
"
" Adds a CVSdiff command that you call with the revision number to diff the
" current source against
"

command -nargs=1 CVSdiff silent call CVSdiff("%", "<args>")
function! CVSdiff(filename, cvsversion)
    " append a:filename to keep extension and therefore highlighting mode
    let patchname = tempname() . a:filename
    let tempname  = tempname() . a:filename
    let newname   = tempname() . a:filename
    execute "!cvs diff -a -r " . a:cvsversion . " " . a:filename . " > " . patch
    execute "!cp " . a:filename . " " . tempname
    execute "!patch -R -o " . newname . " " . tempname . " < " . patchname
    execute "vertical diffsplit " . newname
    call delete(patchname)
    call delete(tempname)
    call delete(newname)
endfunction p
