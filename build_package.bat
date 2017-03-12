@ECHO OFF
REM Batch file to create package for distribution to users.
SET LOCAL_DIR=dos_ctrl_ec2_minecraft\
SET BUILD_DIR=build\
SET DSTFILENAME=dos_ctrl_ec2_minecraft.zip
SET DOS_CTRL_EC2_DIR=dos_ctrl_ec2\
SET DOS_CTRL_EC2_PKG=build\dos_ctrl_ec2.zip
REM Remember previous current directory.
SET EXCURRENTDIR=%CD%
REM Switch current directory to installation directory.
CD /D %~dp0

CALL ec2_mc_config.bat

REM Update tarball for server installation.
CD server
REM Remove old tarball if it exists.
IF EXIST ..\build\setup_server.tar (
	DEL ..\build\setup_server.tar
)

C:\Programme\7-Zip\7z.exe a -ttar ..\build\setup_server.tar @build_file_list.txt

CD ..

REM Remove old package if it exists.
IF EXIST %BUILD_DIR%%DSTFILENAME% (
	DEL %BUILD_DIR%%DSTFILENAME%
) 

REM Move up one directory level.
CD ..

REM Copy dos_ctrl_ec2 package.
ECHO Creating deployment package %BUILD_DIR%%DSTFILENAME%
COPY %DOS_CTRL_EC2_DIR%%DOS_CTRL_EC2_PKG% %LOCAL_DIR%%BUILD_DIR%%DSTFILENAME%
IF ERRORLEVEL 1 (
	ECHO Error copying %DOS_CTRL_EC2_DIR%%DOS_CTRL_EC2_PKG%.
	REM Restore previous current directory.
	CD /D %EXCURRENTDIR%
	EXIT /B 1
) ELSE (
	ECHO Successfully copied dos_ctrl_ec2 package.
)

REM Add files to control Minecraft instance.
C:\Programme\7-Zip\7z.exe a %LOCAL_DIR%%BUILD_DIR%%DSTFILENAME% @%LOCAL_DIR%build_file_list.txt

IF ERRORLEVEL 1 (
	ECHO Error creating deployment package.
	REM Restore previous current directory.
	CD /D %EXCURRENTDIR%
	EXIT /B 1
) ELSE (
	ECHO Successfully created deployment package.
)

CD %LOCAL_DIR%\build
REM Add server setup tarball.

C:\Programme\7-Zip\7z.exe a %DSTFILENAME% setup_server.tar

REM Remove tarball from build directory.
IF EXIST setup_server.tar (
	DEL setup_server.tar
)

REM Restore previous current directory.
CD /D %EXCURRENTDIR%

PAUSE
