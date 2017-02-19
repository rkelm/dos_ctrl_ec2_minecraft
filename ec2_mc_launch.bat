@ECHO OFF
REM Batch file to launch EC2 instance with Minecraft Server.

REM Load configuraiton.
CALL ec2_mc_config.bat

CALL %CTRL_PATH%ec2_launch.bat %1

TIMEOUT /T 60 /NOBREAK
ECHO .
ECHO ********************************************
ECHO * Der Server sollte jetzt erreichbar sein. *
ECHO * Falls nicht bitte noch kurz warten.      *
ECHO ********************************************
ECHO .

PAUSE