#!/bin/bash
python3 -m venv venv
source venv/bin/activate
python3 -m pip install osrf-pycommon
python3 -m pip install ./rosdoc2
touch rosindex/_plugins_data/checkout/_release_repos/CATKIN_IGNORE || true
rosdoc2 scan -p 'rosindex/_plugins_data/checkout' -t 3600
