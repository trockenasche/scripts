REM BATCH-INSTALLER VER. 1.0
@echo off
SET DIR=\\storage\deployment\software
SET VERSION=SoftwareName_1.0.0
SET INSTALLER=SoftwareName_1.0.0.exe
SET OPTIONS=/VERYSILENT /NORESTART
if exist "%SYSTEMROOT%\%VERSION%.log" goto :END
 
%DIR%\%INSTALLER% %OPTIONS%
echo %VERSION% erfolgreich installiert.>> "%SYSTEMROOT%\%VERSION%.log"

:END
exit