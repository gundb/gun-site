setlocal enableDelayedExpansion

call ../conf/conf.bat

for /f "usebackq tokens=*" %%A in ("../helper/dev_destroy.sh") do set cmds=!cmds!%%A ^&^& 
set cmds=!cmds:~0,-4!
SET conc=C:\Program Files\ConEmu\ConEmu\ConEmuC64.exe

for /f "tokens=2 delims=," %%a in (
  'tasklist /fi "imagename eq ConEmu64.exe" /v /fo csv ^| findstr /i "%sys_dev_title%"'
) do (
  set "mypid=%%~a"
)

echo !cmds!

start "" "%conc%" -GuiMacro:%mypid% Context(1) ; Break(0)
start "" "%conc%" -GuiMacro:%mypid% Context(2) ; Break(0)
start "" "%conc%" -GuiMacro:%mypid% Context(3) ; Break(0)
start "" "%conc%" -GuiMacro:%mypid% Shell("new_console:s50Hn","","cmd.exe /k !cmds!") ; WindowMode("MAX")
