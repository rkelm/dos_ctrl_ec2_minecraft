@ECHO OFF
REM Batch file to create a snapshot of an EBS volume.

REM Load configuraiton.
CALL ec2_mc_config.bat

CALL %CTRL_PATH%ec2_create_snap.bat %1

PAUSE