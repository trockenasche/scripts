# SAP Transport Import Skript

## [copytransport.sh](copytransport.sh)

This is for copying transport files from other systems to this one. For this, it is necessary to mount the other trans directory under /opt and the SID.
The transports are entered per line in the transports.txt.
The script uses the SID in the transport number to check which system the transport comes from and copies it and sets the corresponding permissions.

## [sidimport.sh](sidimport.sh)

This script is used to add the transports from the list to the import queue and or import them.
It checks for errors when adding and/or importing and, if necessary, the current transport can be restarted with a different unconditional mode or cancelled.
Everything is written into a log file.

