#!/bin/bash
echo "rosdoc2 run.sh"
python3 -m venv venv
source venv/bin/activate
python3 -m pip install rosdoc2
rosdoc2 scan -p 'plugins_data/checkout'
