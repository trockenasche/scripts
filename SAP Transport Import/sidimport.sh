#!/bin/bash
File="transports.txt"
if [ -s "$File" ] # File is/not empty
then
    
    Import="Y" # Y or N
    SID="SID"
    Client="100"
    Profile="TP_DOMAIN_DWT.PFL"
    AddMode="u1"  # e.g. u1
    ImportMode="" # e.g. u26
    Project=""
    if ! ( $Project );then Project="${Project}_"; fi
    Logfile="./scriptlog/${SID}_${Project}$(date +%F_%H-%M-%S).log"
    timestamp() {
        date +%F_%T # current time
    }
    
    Red="\e[3;31m"
    Cyan="\e[3;96m"
    Green="\e[3;32m"
    Yellow="\e[3;93m"
    Magenta="\e[3;95m"
    ColorEnd="\e[0m"
    
    
    function addtobuffer() {
        tp addtobuffer "$Transport" $SID client=$Client pf=/usr/sap/trans/bin/$Profile $AddMode "$@" | tee -a "$Logfile"
        RC=${PIPESTATUS[0]}
        if [ "$RC" -ne 0 ]; then
            echo -e "${Red}$Transport: Code $RC: Fehler beim Anhängen!$ColorEnd" | tee -a "$Logfile"
            echo -en "${Magenta}"
            read -rp "Unconditional Mode für diesen Transport setzten (z.B. u1) oder (A)bbrechen, (W)iederholen oder (F)ortsetzen und diesen überspringen? " InputAddMode </dev/tty
            echo -en "${ColorEnd}"
            
            if [ "${InputAddMode,,}" == "a" ]; then
                echo -e "User (A)bbruch!" | tee -a "$Logfile"
                exit
                
                elif [ "${InputAddMode,,}" == "f" ]; then
                echo -e "${Red}$Transport: Wurde wegen Fehler $RC: beim anhängen übersprungen.$ColorEnd" | tee -a "$Logfile"
                # Delete transport from list to skip it.
                sed -i "/$Transport/d" "$File"
                continue
                
                elif [ "${InputAddMode,,}" == "w" ]; then
                addtobuffer
                
                elif [[ "${InputAddMode,,}" == u* ]]; then
                echo -e "Versuche Unconditional Mode $InputAddMode:" | tee -a "$Logfile"
                PrevAddMode=$AddMode
                AddMode=$InputAddMode
                addtobuffer "$@"
                AddMode=$PrevAddMode
                
            else
                echo -e "${Red}Keine Angabe gemacht, wird abgebrochen.$ColorEnd" | tee -a "$Logfile"
                exit
            fi
            
        else
            echo -e "${Green}$Transport: Code $RC: Erfolgreich angehängt.$ColorEnd" | tee -a "$Logfile"
        fi
    } # function addtobuffer()
    
    function import() {
        tp import "$Transport" $SID client=$Client pf=/usr/sap/trans/bin/$Profile $ImportMode "$@" | tee -a "$Logfile"
        RC=${PIPESTATUS[0]}
        if [ "$RC" -gt 4 ]; then
            echo -e "${Red}$Transport: Code $RC: Fehler beim Importieren!$ColorEnd" | tee -a "$Logfile"
            echo -en "${Magenta}"
            read -rp "Unconditional Mode für diesen Transport setzten (z.B. u2) oder (A)bbrechen oder (F)ortsetzen und diesen überspringen? " InputImportMode </dev/tty
            echo -en "${ColorEnd}"
            
            if [ "${InputImportMode,,}" == "a" ]; then
                echo -e "User (A)bbruch!" | tee -a "$Logfile"
                exit
                
                elif [ "${InputImportMode,,}" == "f" ]; then
                echo -e "${Red}$Transport: Wurde wegen Fehler $RC: übersprungen$ColorEnd" | tee -a "$Logfile"
                # Delete transport from list to skip it.
                sed -i "/$Transport/d" "$File"
                
                elif [[ ${InputImportMode,,} == u* ]]; then
                echo -e "Versuche Unconditional Mode $InputImportMode:" | tee -a "$Logfile"
                PrevImportMode=$ImportMode
                ImportMode=$InputImportMode
                import "$@"
                ImportMode=$PrevImportMode
                
            else
                echo -e "${Red}Keine Angabe gemacht, wird abgebrochen.$ColorEnd" | tee -a "$Logfile"
                exit
            fi
            
            elif [ "$RC" -eq 4 ]; then
            echo -e "${Yellow}$Transport: Code $RC: mit Warnung importiert.$ColorEnd" | tee -a "$Logfile"
            # Delete transport from list after successful import.
            sed -i "/$Transport/d" "$File"
            
        else
            echo -e "${Green}$Transport: Code $RC: Erfolgreich Importiert.$ColorEnd" | tee -a "$Logfile"
            # Delete transport from list after successful import.
            sed -i "/$Transport/d" "$File"
        fi
    } # function import()
    
    
    echo -e "SID=${SID}\nClient=${Client}\nProfile=${Profile}\nAdd Mode=${AddMode}\nImport Mode=${ImportMode}\n" | tee -a "$Logfile"
    
    # Looping over transports
    while IFS= read -r Transport; do
        Transport=$(echo -e "${Transport}" | tr -d "[:blank:]") # Trim whitespace
        
        echo -e "${Cyan}----------$ColorEnd" | tee -a "$Logfile"
        echo -e "${Cyan}$Transport:$ColorEnd" | tee -a "$Logfile"
        
        if [[ $Transport == "Pause" ]];then
            while : ; do
                echo -en "${Magenta}"
                read -rp "Pause entdeckt, bitte mit (W)eitermachen oder (A)bbrechen? " InputPause </dev/tty
                echo -en "${ColorEnd}"
                
                if [ "${InputPause,,}" == "w" ]; then
                    # Delete first occurrence of "Pause" from list.
                    sed -i "0,/$Transport/d" "$File"
                    continue 2
                    elif [[ "${InputPause,,}" == "a"  ]]; then
                    echo -e "${Red}Lauf wurde bei einer Pause abgebrochen.$ColorEnd" | tee -a "$Logfile"
                    exit
                else
                    echo "Bitte w oder a drücken!"
                fi
            done
        fi
        
        addtobuffer "$@"
        
        if [ "$Import" == "Y" ]; then
            import "$@"
        fi
        
    done <$File
    
else # File is empty
    Red="\e[3;31m"
    ColorEnd="\e[0m"
    
    echo -e "${Red}$File enthält keine Transporte!$ColorEnd"
    exit
fi