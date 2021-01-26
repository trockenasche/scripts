@ECHO off
del /f machine.txt
REM Get all Computers from a OU
DSQUERY COMPUTER "OU=Computer,DC=domain,DC=com" -o rdn -limit 1000 > machines.txt
REM Get other Computers from an other OU
DSQUERY COMPUTER "OU=OtherOU,DC=domain,DC=com" -o rdn -limit 1000 >> machines.txt
REM remove all qoutes
FOR /F "usebackq tokens=*" %%a IN ("machines.txt") DO echo:%%~a>> machine.txt
REM remove a computer with the name "ADMIN"
findstr /C:"ADMIN" /V machine.txt > machines.txt
FOR /F %%i IN (machines.txt) DO (
shutdown /s /t 60 /f /c "Nachtabschaltung                                     Der Computer wird in 60 Sekunden heruntergefahren." /d u:00:00 /m \\%%i
)
exit
