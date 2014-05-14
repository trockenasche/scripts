@ECHO off
del /f machine.txt
DSQUERY COMPUTER "OU=Computer,DC=domain,DC=com" -o rdn -limit 1000 > machines.txt
DSQUERY COMPUTER "OU=OtherOU,DC=domain,DC=com" -o rdn -limit 1000 >> machines.txt
FOR /F "usebackq tokens=*" %%a IN ("machines.txt") DO echo:%%~a>> machine.txt
findstr /C:"ADMIN" /V machine.txt > machines.txt
FOR /F %%i IN (machines.txt) DO (
shutdown /s /t 60 /f /c "Nachtabschaltung                                     Der Computer wird in 60 Sekunden heruntergefahren." /d u:00:00 /m \\%%i
)
exit
