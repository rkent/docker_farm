#!/bin/bash
export ROS_DISTRO=${ROS_DISTRO:-'rolling'}
python3 -m venv venv
source venv/bin/activate
# python3 -m pip install osrf-pycommon
python3 -m pip install ./rosdoc2
rosdoc2 $1
