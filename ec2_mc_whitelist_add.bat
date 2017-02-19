@ECHO OFF
REM Batch file to add whitelisted user on EC2 Minecraft Server.

REM Load configuration.
CALL ec2_mc_config.bat

REM Let user type in minecraft user name to add.
ECHO Bitte geben Sie den Minecraft User Namen ein, der hinzugefügt werden soll.
SET /P ADDUSER=

CALL %CTRL_PATH%ec2_send_command.bat %1 service minecraft command whitelist add %ADDUSER%

PAUSE