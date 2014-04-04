#!/usr/bash

# Fix for using tmux and screen.
# Starting screen clears LD_LIBRARY_PATH that setup.bash setup for us.
# As we end up with a new bash process the completion setup etc (rosbash)
# hasn't been run.
# We work around these by re-sourcing the setup if we are in a ros environment.
if [ ! -z "${ROS_WORKSPACE}" ]; then
    startdir=$(pwd)
    cd "$ROS_WORKSPACE"
    source setup.bash
    cd "$startdir"
fi

# If we start in a catkin workspace source the devel space
# Works well if you have a term open on the workspace and start a new terminal
# from there (Ctl-Shift-N).
if [ -d build ] && [ -d devel ] && [ -f devel/setup.bash ]; then
    source devel/setup.bash
fi

# catkin_make that works from anywhere in the fs when in a ros environment.
function catkin_mk {
    (
        roscd || return
        cd ..
        echo Workspace: $(pwd)
        catkin_make "$@"
    )
}

alias lstopic="rostopic list"
alias lsnode="rosnode list"
alias lsparam="rosparam list"
alias lsmsg="rosmsg list"
alias lssrv="rossrv list"
alias lsservice="rosservice list"
alias techo="rostopic echo"
alias rviz="rosrun rviz rviz"
