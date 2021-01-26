#!/usr/bin/env bash
if [[ "$#" -le 1 ]]
then
    echo "Bitte --SID und --days angeben! Bsp. backupcleanup.sh --SID DWT --days 7"
    exit
else
    while [[ "$#" -gt 0 ]]
    do
        case $1 in
            --sid|--SID)
                SID="$2"
            ;;
            --days)
                days="$2"
            ;;
        esac
        shift
    done

    function findAndDelete() {
        newDate=$(find ${path} -type f -not -path '*/\.*' -printf '%TY-%Tm-%Td %TH:%TM:%.2TS\n' |sort -nr |head -n 1)
        newDate=$(date +"%Y-%m-%d %T" -d "${newDate} ${days} days ago")
        
        find ${path} -type f ! -newermt "$newDate" -exec rm {} \;
    }

    path="/hana/backup/${SID}/log/DB_${SID}/*"
    findAndDelete

    path="/hana/backup/${SID}/log/SYSTEMDB/*"
    findAndDelete

fi