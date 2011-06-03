" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
    finish
endif

setlocal shiftwidth=4
setlocal tabstop=4


"
" Maps
"=============================================================================

" Shebang short cut
" TODO: Just write it to the top of the file if new file
"map #! O#!/usr/bin/perl -wuse strict;require 5.6.0;a


"
" Abbreviations 
"=============================================================================

ab #- #-----------------------------------------------------------------------------
ab #= #=============================================================================

" POD abreviations
"=============================================================================
"
" TODO: How do I make the abbrev =h1 not just h1? Can then set the rest of pod
" with some abbrevs eg ab =i =item

ab h1 =head1
ab h2 =head2
ab h3 =head3
ab h4 =head4
ab h5 =head5
ab h6 =head6
ab h7 =head7



"
" Perl syntax options
"=============================================================================

" Highlight embedded POD
"let perl_include_POD=1

" Affects how packages refs in vars are displayed e.g. $Pkg::Foo
"let perl_want_scope_in_variables=1

" Better highlighting of complex var declarations e.g. @{${"foo"}}
"let perl_extended_vars=1

" Treat strings as statements
"let perl_string_as_statement=1

" If you have problems with synchronization try chaning the following
"let perl_no_sync_on_sub=1
"let perl_no_sync_on_global=1
"let perl_sync_dist=num_lines
