setlocal enableDelayedExpansion

call ../conf/conf.bat

SET "dr=%cd%\..\.."

FOR /f "usebackq tokens=*" %%A IN ("../helper/dev_sync.bat") DO SET cmd2=!cmd2!%%A ^&^& 
SET cmd2=!cmd2:~0,-4!

SET "cmd1=./sys/helper/dev_launch.sh %sys_dev_sync_port% %sys_dev_box_sys_dir% '%sys_dev_screen1_cmd%'"

SET con=C:\Program Files\ConEmu\ConEmu64.exe
SET bsh=C:/Program Files/Git/bin/bash.exe
SET c1=%bsh% --login -i -new_console:t:"%sys_dev_title_cons1%":s:d:"%dr%" -c "%cmd1%"
SET c2=cmd -new_console:t:"%sys_dev_title_cons2%":s:d:"%dr%" /k call ./sys/helper/dev_watcher.bat "!cmd2!"

start "" "%con%" -Max -Title %sys_dev_title% -runlist !c1! ^|^|^| !c2!
