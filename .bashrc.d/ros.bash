#!/usr/bash

# Fix for using tmux and screen.
# Starting screen clears LD_LIBRARY_PATH that setup.bash setup for us.
# As we end up with a new bash process the completion setup etc (rosbash)
# hasn't been run.
# We work around these by re-sourcing the setup if we are in a ros environment.
if [ ! -z "${ROS_ROOT}" ]; then
    startdir=$(pwd)
    cd "$ROS_WORKSPACE"
    source setup.bash
    cd "$startdir"
fi
