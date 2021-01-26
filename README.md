# Scripts

A collection of scripts


## Windows


### [Batch-Installer](Batch-Installer)

Batch Skript zum automatischen Installieren von Software über Startup-Skripte in Gruppenrichtlinien.


### [domain-shutdown](domain-shutdown)

domain shutdown script


### [Frontmotion-Firefox-Changer](Frontmotion-Firefox-Changer)

The script is for manipulating the FrontMotion Firefox Community Edition MSI package.


### [profilefolders](profilefolders) 

A logon script to set system attribut for the profile folders to make the desktop.ini working after moving the profile folders.

## Linux 🐧

### [SAP Transport Import](SAP%20Transport%20Import)

Scripts to copy and import transports from other SAP system which are not attach to each other.

### [backupcleanup.sh](backupcleanup.sh)

With all SAP databases, the logs are automatically saved on the backup target. However, these must be tidied up, otherwise they will cause the backup target to overflow.
For this purpose, there is a cron job on each database server under the SIDadm.
A script is called up via this job which then deletes the logs that are older than the specified days.
The days are counted backwards to the last most recent log file.<br>
Example: `.\backupcleanup.sh --SID SAP --days 7`