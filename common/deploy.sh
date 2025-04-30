#!/bin/bash
cd _site
git init -b main
git remote rm origin
git remote add -f origin git@github.com:rosdabbler/index.rosdabbler.com.git
git reset origin/main
git add .
git commit --amend --no-edit
git push -f --set-upstream origin main
