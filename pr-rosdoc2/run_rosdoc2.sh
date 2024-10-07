#!/bin/bash
python3 -m venv venv
source venv/bin/activate
python3 -m pip install osrf-pycommon
python3 -m pip install ./rosdoc2
export ROS_DISTRO='rolling'
rosdoc2 scan -p 'checkout' -t 3600 -y 'rosdoc2/docs_ex.yaml'
