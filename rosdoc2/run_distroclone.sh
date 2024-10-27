#!/bin/bash
# Usage: ./run_distroclone.sh ROS_DISTRO DESTINATION
ROS_DISTRO=${1:-'rolling'}
DESTINATION=${2:-'checkout'}
python3 -m venv venv
source venv/bin/activate
python3 -m pip install osrf-pycommon
python3 -m pip install ./distroclone
echo "Checking out $ROS_DISTRO to destination $DESTINATION"
distroclone -d $ROS_DISTRO -p $DESTINATION
