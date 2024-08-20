#!/bin/bash
python3 -m venv venv
source venv/bin/activate
python3 -m pip install osrf-pycommon
python3 -m pip install ./rosdoc2
python3 -m pip install ./distroclone
export ROS_DISTRO='rolling'
distroclone -d $ROS_DISTRO -p checkout
rosdoc2 scan -p 'checkout' -t 3600 -y 'rosdoc2/docs_ex.yaml'
