@ECHO OFF
REM Batch file to create a snapshot of an EBS volume.
SETLOCAL enabledelayedexpansion

REM Load configuration.
CALL ec2_mc_config.bat

REM Ask for a short comment to include in 
ECHO Bitte gib einen Namen ein, mit dem der Snapshot später identifiziert werden kann. Kann auch weggelassen werden.
SET /P _input=

REM This remove-unwanted-chars-in-string solution was shared by jeb on stack overflow. Thank you!
set "_output="
set "map=abcdefghijklmnopqrstuvwxyz1234567890_-"

:loop
if not defined _input goto endLoop    
for /F "delims=*~ eol=*" %%C in ("!_input:~0,1!") do (
    if "!map:%%C=!" NEQ "!map!" set "_output=!_output!%%C"
)
set "_input=!_input:~1!"
    goto loop
:endLoop

CALL %CTRL_PATH%ec2_create_snap.bat %1 %_output%

PAUSE
