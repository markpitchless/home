
#https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/

export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
