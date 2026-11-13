#!/bin/bash
export ROS_DISTRO=${ROS_DISTRO:-'rolling'}
export ROS_VERSION=2
python3 -m venv --system-site-packages venv
source venv/bin/activate
# python3 -m pip install osrf-pycommon
python3 -m pip install ./rosdoc2
echo "Execute rosdoc2 $1"
rosdoc2 $1
