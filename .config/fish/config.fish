
function ack -d "ack-grep - grep like text finder"
    ack-grep $argv
end

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

function d;        vcs diff $argv; end
function s;        vcs status $argv; end
function checkout; vcs checkout $argv; end
function commit;   vcs commit $argv; end
function pull;     vcs pull $argv; end
function push;     vcs push $argv; end
function branch;   vcs branch $argv; end