
function vcs-is -d "Is this a VSC controlled directory? With no args output the
name (see vcs-name) or error message. With arg tests if that vcs name is in
use, output nothing but set the status of the test."
    set name (vcs-name)
    if test (count $argv) = 0
        if test -z $name
            echo No VCS found
            return 1
        end
        echo $name
        return 0
    end
    if test -z $name
        return 1
    end
    if test $name = $argv[1]
        return 0
    else
        return 1
    end
end
