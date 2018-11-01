
function vcs-name -d "Output the name of the VCS controlling this directory. If
not vcs controlled output nothing and return 1. Name is the name of the
executable for that vcs"
    if test -d .git
        echo git 
        return
    end
    if test -d .svn
        echo svn
        return
    end
    if test -d .bzr
        echo bzr
        return
    end
    return 1 
end
