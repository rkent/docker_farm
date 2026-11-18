#!/bin/bash
export ROS_DISTRO=${ROS_DISTRO:-'rolling'}
export ROS_VERSION=2
python3 -m venv --system-site-packages venv
source venv/bin/activate
source /opt/ros/${ROS_DISTRO}/setup.bash
rosdep update
# Remove duplicate packages
touch $REPOS/$ROS_DISTRO/ros_battery_monitoring/COLCON_IGNORE
rosdep install --from-paths $REPOS/$ROS_DISTRO --ignore-src -y -t doc
# python3 -m pip install osrf-pycommon
python3 -m pip install ./rosdoc2
echo "Execute rosdoc2 $1"
rosdoc2 $1
