REM Frontmotion Firefox changer Version 1.1.0 by trockenasche
@echo off
FOR %%f IN (*.msi) DO (SET filename=%%f)
SET "version=%filename:*-=%
SET "version=%version:-="%
SET "fileold=%filename:msi=old%
IF "%version%"=="*" GOTO :NOMSI
IF EXIST %version% GOTO :EXIST

:START
REM extracting the msi file to folder
msiexec /qb /a %filename% TARGETDIR="%cd%\%version%\"
REM copy all change to the extracted folder
xcopy /E /Y "change\*.*" "%version%\"
REM change the icon in the exe-resources
xcopy /y "%version%\Program Files\Mozilla Firefox\firefox.exe" "Icons\"
cd Icons\
ResHacker.exe -script iconchange.res
cd ..
move /y "Icons\firefox.exe" "%version%\Program Files\Mozilla Firefox\"
REM MsiFiler populates the file table with file versions and sizes based on the copied file from the "change" directory
START /B "" "MsiFiler.Exe" -d "%version%\%filename%"
:LOOP
<nul set /p "=."
tasklist /nh /fi "imagename eq MsiFiler.Exe" 2>&1|findstr /b /i /l /c:"MsiFiler.Exe">nul ||GOTO :CONTINUE
ping -n 1 localhost>nul
GOTO :LOOP
:CONTINUE
xcopy /y firefox.mst %version%\
IF EXIST %fileold% del %fileold%
RENAME %filename% %fileold%
GOTO :EXIT

:EXIST
ECHO Version already exist, do you want to continue and overwrite existing files? y/n
SET INPUT=
SET /P INPUT=Type input: %=%
If "%INPUT%"=="y" GOTO :START
If "%INPUT%"=="Y" GOTO :START
If "%INPUT%"=="n" GOTO :EXIT
If "%INPUT%"=="N" GOTO :EXIT

:NOMSI
ECHO There is no MSI file
pause
EXIT

:EXIT
ECHO ----finished! Go ahead, deploy!----
pause