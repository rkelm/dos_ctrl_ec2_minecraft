@ECHO OFF
SETLOCAL enabledelayedexpansion
SET _BAT_DIR=dos_ctrl_ec2_minecraft

ECHO Dieser Batch erstellt Verknuepfungen zu den Batch Dateien in diesem Verzeichnis und benennt diese.
ECHO Bitte geben Sie das Kuerzel der zu verwendenden dos_ctrl_ec2 Konfigurationsdatei ein.
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

IF NOT DEFINED _output (
	ECHO Sie haben keinen gültigen Wert fuer das Kuerzel eingegeben.
	EXIT /B 1
	PAUSE
)

SET _DIR=%~dp0

REM ec2_mc_backup_map.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 Backup der aktuellen Karte erstellen %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\ec2_mc_backup_map.bat'; $s.Arguments='%_output%';$s.Save()"

REM ec2_mc_create_snap.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 Snapshot erstellen %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\%_BAT_DIR%\ec2_mc_create_snap.bat'; $s.Arguments='%_output%';$s.Save()"

REM ec2_mc_kick.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 Kick Spieler vom Server %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\ec2_mc_kick.bat'; $s.Arguments='%_output%';$s.Save()"

REM ec2_mc_launch.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 STARTE Server %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\ec2_mc_kick.bat'; $s.Arguments='%_output%';$s.Save()"

REM ec2_mc_punish.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 Bestrafe Spieler %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\ec2_mc_punish.bat'; $s.Arguments='%_output%';$s.Save()"

REM ec2_mc_terminate.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 BEENDE Server %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\ec2_mc_terminate.bat'; $s.Arguments='%_output%';$s.Save()"

REM ec2_mc_whitelist_add.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 Spieler zur Whitelist hinzufuegen %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\ec2_mc_whitelist_add.bat'; $s.Arguments='%_output%';$s.Save()"

REM ec2_mc_whitelist_list.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 Namen auf der Whitelist anzeigen %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\ec2_mc_whitelist_list.bat'; $s.Arguments='%_output%';$s.Save()"

REM ec2_mc_whitelist_remove.bat
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%_DIR%\AWS EC2 Namen auf der Whitelist anzeigen %_output%.lnk');$s.TargetPath='%_DIR%\%_BAT_DIR%\ec2_mc_whitelist_remove.bat'; $s.Arguments='%_output%';$s.Save()"

ECHO Verknuepfungen wurden erstellt und koennen jetzt ins Zielverzeichnis verschoben werden.

PAUSE
