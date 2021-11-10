
set -x CHRUBY_ROOT /usr/local
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

function j -d "Jobs"
    jobs $argv
end

function g -d "Grep"
    grep $argv
end

function bye
    echo Goodbye ":)"
    exit $argv
end

#
# Git aliases
#

function lsv -d "Git status"
    git status $argv
end

function pull -d "Git pull"
    git pull $argv
end

function push -d "Git push"
    git push $argv
end

function checkout -d "Git checkout"
    git checkout $argv
end

function commit -d "Git commit"
    git commit $argv
end

# function d;        vcs diff $argv; end
# function s;        vcs status $argv; end
# function checkout; vcs checkout $argv; end
# function commit;   vcs commit $argv; end
# function pull;     vcs pull $argv; end
# function push;     vcs push $argv; end
# function branch;   vcs branch $argv; end

function bi -d "Bundle install"
    bundle install $argv
end

function be -d "Bundle exec"
    bundle exec $argv
end

function bo -d "Bundle open"
    bundle open $argv
end
