@echo off
echo:
echo =================================================
echo Watching file changes so the box will be updated.
echo (You can ignore inital error(s)).
echo =================================================
echo:
cd ..
"C:/Program Files/watchexec/watchexec.exe" %1
