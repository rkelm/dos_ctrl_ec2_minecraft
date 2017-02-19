@ECHO OFF
REM Batch file to list whitelisted user on EC2 Minecraft Server.

REM Load configuration.
CALL ec2_mc_config.bat

ECHO Rufe Whitelist des Minecraft Servers ab.
CALL %CTRL_PATH%ec2_send_command.bat %1 service minecraft command whitelist list

PAUSE
