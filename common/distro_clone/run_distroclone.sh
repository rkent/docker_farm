#!/bin/bash
# Usage: ./run_distroclone.sh ROS_DISTRO DESTINATION REPO_MERGE_FILE
ROS_DISTRO=${1:-'rolling'}
DESTINATION=${2:-'checkout'}
REPO_MERGE_FILE=${3:-''}
GITHUB_PATH='distroclone/github'
python3 -m venv venv
source venv/bin/activate
python3 -m pip install osrf-pycommon
python3 -m pip install ./distroclone
if [[ $REPO_MERGE_FILE ]]; then
    echo "Checking out $ROS_DISTRO to destination $DESTINATION merging $REPO_MERGE_FILE"
    distroclone -d $ROS_DISTRO -p $DESTINATION -c $REPO_MERGE_FILE -g $GITHUB_PATH
else
    echo "Checking out $ROS_DISTRO to destination $DESTINATION"
    distroclone -d $ROS_DISTRO -p $DESTINATION -g $GITHUB_PATH
fi
