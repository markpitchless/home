
function vcs-call --description "Send argv to the detected VCS"
    if not set cmd (vcs-name)
        return
    end
    eval $cmd $argv
end

