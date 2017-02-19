@ECHO OFF
REM Batch file to create package for distribution to users.
SET DSTFILENAME=build\dos_ctrl_ec2.zip
ECHO Creating deployment package %DSTFILENAME%

IF EXIST %DSTFILENAME% (
	DEL %DSTFILENAME%
) 
C:\Programme\7-Zip\7z.exe a %DSTFILENAME% changes.txt README.md ec2_mc_config.bat ec2_mc_launch.bat ec2_mc_terminate.bat ec2_mc_create_snap.bat ec2_mc_whitelist_add.bat ec2_mc_whitelist_list.bat ec2_mc_whitelist_remove.bat 

IF ERRORLEVEL 1 (
	ECHO => Error creating deployment package.
	) ELSE (
	ECHO => Successfully created deployment package.
	)
	
pause
