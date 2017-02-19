@ECHO OFF
REM Batch file to terminate an EC2 instance.

REM Load configuraiton.
CALL ec2_mc_config.bat

CALL %CTRL_PATH%ec2_terminate.bat %1

PAUSE