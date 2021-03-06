@ECHO OFF
REM Batch file to create a backup ot the current minecraft map/world.
SETLOCAL enabledelayedexpansion

REM Load configuration.
CALL ec2_mc_config.bat

REM Let user type in a short comment to add to the name of the backup.
ECHO Bitte gib ein Stichwort ein, mit dem sp�ter das Backup identifiziert werden kann.
SET /P _input=

REM This remove-unwanted-chars-in-string solution was shared by jeb on stack overflow. Thank you!
set "_output="
set "map=abcdefghijklmnopqrstuvwxyz1234567890_"

:loop
if not defined _input goto endLoop    
for /F "delims=*~ eol=*" %%C in ("!_input:~0,1!") do (
    if "!map:%%C=!" NEQ "!map!" set "_output=!_output!%%C"
)
set "_input=!_input:~1!"
    goto loop
:endLoop

CALL %CTRL_PATH%ec2_send_command.bat %1 service minecraft backupmap %_output%

PAUSE
