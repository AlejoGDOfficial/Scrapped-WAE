@echo off

title ALE Engine GitHub Update

echo Adding all files to the stage...

git add .

set /p commitMessage="Commit name: "

echo Commiting... (%commitMessage%)

git commit -m "%commitMessage%"

echo Pushing to origin master...

git push origin master

echo Everything up to date!

pause