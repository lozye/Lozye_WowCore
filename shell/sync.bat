@echo off
set info=%1
if (%info%) == () set info= "auto_sync"

git pull
git add --all
git commit -a -m %info%
git push