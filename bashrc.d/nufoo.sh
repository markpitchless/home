NUFOO_DIR="$HOME/Lab/NuFoo"
if [ -d "$NUFOO_DIR" ]; then
    if [ -z "$PERL5LIB" ]; then
        export PERL5LIB="$NUFOO_DIR/lib"
    else
        PERL5LIB="$NUFOO_DIR/lib:$PERL5LIB"
    fi
    PATH="$NUFOO_DIR/bin:$PATH"
fi
