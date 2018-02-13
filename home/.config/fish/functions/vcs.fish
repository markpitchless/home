
function vcs -d "Generic command line API to multiple VCS systems."
    set vcs (vcs-name)
    if test -z $vcs-name 
        echo No VCS!
    end

    set cmd $argv[1]
    set -e argv[1] # shift

    switch "$cmd"
        case info 
            switch $vcs
                case git
                    git status $argv
                    echo
                    git branch -v $argv
                    echo
                    git remote -v $argv
                    return
            end
    end
    vcs-call $cmd $argv
end
