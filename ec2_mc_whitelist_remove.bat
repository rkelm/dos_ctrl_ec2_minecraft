@ECHO OFF
REM Batch file to remove whitelisted user on EC2 Minecraft Server.

REM Load configuration.
CALL ec2_mc_config.bat

REM Let user type in minecraft user name to remove.
ECHO Bitte geben Sie den Minecraft User Namen ein, der entfernt werden soll.
SET /P REMOVEUSER=

CALL %CTRL_PATH%ec2_send_command.bat %1 service minecraft command whitelist remove %REMOVEUSER%

PAUSE
