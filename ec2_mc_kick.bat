@ECHO OFF
REM Batch file to kick user off the Minecraft server.
SETLOCAL enabledelayedexpansion

REM Load configuration.
CALL ec2_mc_config.bat

REM Let user type in minecraft user name to add.
ECHO Bitte geben Sie den Minecraft User Namen ein, der vom Server gekickt werden soll.
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

IF DEFINED _output (
  CALL %CTRL_PATH%ec2_send_command.bat %1 service minecraft command kick %_output%
) ELSE (
  ECHO Eingabe des Minecraft User Namen war leer. Kick konnte nicht ausgefuehrt werden.
)

PAUSE