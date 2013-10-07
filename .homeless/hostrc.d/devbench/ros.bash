#!/bin/bash

# TACO Setup.
# Join the workspace and set some config for that.

# Simulate the hand and or kinect?
export SIMULATED=1
export SIMULATED_KINECT=0
source /home/taco/workspace/setup.bash
export ROS_MASTER_URI=http://devbench:11311
