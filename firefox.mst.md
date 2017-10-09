[firefox.mst](firefox.mst) - documentation
===
this documentation was done with Windows Installer Transfom Viewer from Office 2003 Editions Resource Kit (ork.exe --> ork.cab --> mstview.exe) and a lot of search & replace ;)
***

Enforce Validation Flags: True

Base package: \FrontMotion Firefox Community Edition ESR\52.4.0\FMFirefoxCEESR-52.4.0-de.msi

ProductCode: {CFD28737-C1B1-40F1-A292-259F94980AB0}; ProductVersion: 52.4.0.0; UpgradeCode: {8688A741-61CC-4A67-96ED-E9037C4D2362}

Transform: \FrontMotion Firefox Community Edition ESR\52.4.0\firefox.mst

Expected values - ProductCode: {CFD28737-C1B1-40F1-A292-259F94980AB0}; ProductVersion: 52.4.0.0; UpgradeCode: {8688A741-61CC-4A67-96ED-E9037C4D2362}


DATA CHANGE - Component | Component | ComponentId | Directory_ | Attributes | Condition | KeyPath
--- | --- | --- | --- | --- | --- | ---
 <> | c54.F_FirefoxMain._INSTALLDIR_DICTIONARIES_x | | | | | de_DE.aff ~~en_US.aff~~


DATA CHANGE - Directory | Directory | Directory_Parent | DefaultDir
--- | --- | --- | ---
 <> | _PROGRAMMENUFOLDER_FRONTMOTION_FIREFOX | | MOZILL~1\|Mozilla Firefox ~~FRONTM~1\|FrontMotion Firefox~~


DATA CHANGE - Feature | Feature | Feature_Parent | Title | Description | Display | Level | Directory_ | Attributes
--- | --- | --- | --- | --- | --- | --- | --- | ---
 <> | F_SetDefaultBrowser | | | | | 3 ~~4~~ | | 


DATA CHANGE - File | File | Component_ | FileName | FileSize | Version | Language | Attributes | Sequence
--- | --- | --- | --- | --- | --- | --- | --- | ---
 \- | en_US.aff
 \- | en_US.dic
 \+ | custom.js | c53.F_FirefoxMain._INSTALLDIR_DEFAULTS_PREF_x | custom.js | 46 | | | 1536 | 502
 \+ | de_DE.aff | c54.F_FirefoxMain._INSTALLDIR_DICTIONARIES_x | de-DE.aff | 18978 | | | 1536 | 78
 \+ | de_DE.dic | c54.F_FirefoxMain._INSTALLDIR_DICTIONARIES_x | de-DE.dic | 1113107 | | | 1536 | 79


DATA CHANGE - Icon | Name | Data
--- | --- | ---
 \+ | mozilla.ico | Icon.mozilla.ico
 <> | firefox.52.4.0.0.ico.exe | Icon.firefox.52.4.0.0.ico.exe ~~Icon.firefox.52.4.0.0.ico.exe~~

 
DATA CHANGE - Media | DiskId | LastSequence | DiskPrompt | Cabinet | VolumeLabel | Source
--- | --- | --- | --- | --- | --- | ---
 <> | 1 | 600 ~~108~~ | | | | 


DATA CHANGE - MsiFileHash | File_ | Options | HashPart1 | HashPart2 | HashPart3 | HashPart4
--- | --- | --- | --- | --- | --- | ---
 \- | en_US.aff
 \- | en_US.dic
 \+ | custom.js | 0 | 1819190932 | 1869607806 | 899243074 | 1372911033
 \+ | de_DE.aff | 0 | -835776907 | -1332436576 | 1808923501 | -704847899
 \+ | de_DE.dic | 0 | 1295314130 | 1173116573 | 520580929 | -1359428921
 <> | VisualElements_150.png | | 1574030286 ~~-1704862931~~ | 1785742812 ~~1568697474~~ | 718587260 ~~1032327367~~ | -763802862 ~~-1241782593~~
 <> | VisualElements_70.png | | -785444957 ~~-1061646584~~ | 1559517179 ~~-2112712698~~ | 369161773 ~~1639502778~~ | 123592967 ~~-1023656082~~


DATA CHANGE - Property | Property | Value
--- | --- | --- 
 <> | ARPPRODUCTICON | mozilla.ico ~~firefox.52.4.0.0.ico.exe~~
 <> | IAgree | Yes ~~No~~


DATA CHANGE - Shortcut | Shortcut | Directory_ | Name | Component_ | Target | Arguments | Description | Hotkey | Icon_ | IconIndex | ShowCmd | WkDir | DisplayResourceDLL | DisplayResourceId | DescriptionResourceDLL | DescriptionResourceId
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
 <> | ScKey001 | | MOZILL~1\|Mozilla Firefox ~~FRONTM~1\|FrontMotion Firefox~~ | | | | Start Mozilla Firefox ~~Run FrontMotion Firefox (Version 52.4.0.0).~~ | | mozilla.ico ~~firefox.52.4.0.0.ico.exe~~ | | | | | | | 
 <> | ScKey002 | | MOZILL~1\|Mozilla Firefox ~~FRONTM~1\|FrontMotion Firefox~~ | | | | Start Mozilla Firefox ~~Run FrontMotion Firefox (Version 52.4.0.0).~~ | | mozilla.ico ~~firefox.52.4.0.0.ico.exe~~ | | | | | | | 