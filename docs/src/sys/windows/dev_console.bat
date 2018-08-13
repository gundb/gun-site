setlocal enableDelayedExpansion

call ../conf/conf.bat

SET "dr=%cd%\..\.."

SET "cmd1=bash"

SET con=C:\Program Files\ConEmu\ConEmu64.exe
SET bsh=C:/Program Files/Git/bin/bash.exe
SET c1=%bsh% --login -i -new_console:s:d:"%dr%" -c "%cmd1%"

start "" "%con%" -Max -runlist !c1!
