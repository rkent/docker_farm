#!/bin/bash
python3 -m venv venv
source venv/bin/activate
python3 -m pip install osrf-pycommon
python3 -m pip install ./distroclone
export ROS_DISTRO='rolling'
distroclone -d $ROS_DISTRO -p checkout
