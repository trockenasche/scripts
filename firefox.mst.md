[firefox.mst](firefox.mst) - documentation
===
this documentation was done with Windows Installer Transfom Viewer
***


Enforce Validation Flags: True  
Base package: FMFirefoxCEESR-31.3.0-de.msi  
ProductCode: {A2A89B3E-B124-4999-9E6F-288E246BD7CB}; ProductVersion: 31.3.0.0; UpgradeCode: {8688A741-61CC-4A67-96ED-E9037C4D2362}

Transform: firefox.mst  
Expected values - ProductCode: {EEE7D3D0-9590-4BBA-AE6F-7928AB66D53B}; ProductVersion: 31.2.0.0; UpgradeCode: {8688A741-61CC-4A67-96ED-E9037C4D2362}


DATA CHANGE - Component	Component	ComponentId	Directory_	Attributes	Condition	KeyPath	
 <> 	c309.F_FirefoxMain._INSTALLDIR_DICTIONARIES_x					de_DE.aff{en_US.aff}

DATA CHANGE - Directory	Directory	Directory_Parent	DefaultDir	
 <> 	_PROGRAMMENUFOLDER_FRONTMOTION_FIREFOX		MOZILL~1|Mozilla Firefox{FRONTM~1|FrontMotion Firefox}

DATA CHANGE - Feature	Feature	Feature_Parent	Title	Description	Display	Level	Directory_	Attributes	
 <> 	F_SetDefaultBrowser					3{4}		

DATA CHANGE - File	File	Component_	FileName	FileSize	Version	Language	Attributes	Sequence	
  - 	amazondotcom.xml
  - 	bing.xml
  - 	eBay.xml
  - 	eBay_de.xml
  - 	en_US.aff
  - 	en_US.dic
  - 	twitter.xml
  - 	wikipedia.xml
  - 	yahoo.xml
  + 	custom.js	c308.F_FirefoxMain._INSTALLDIR_DEFAULTS_PREF_x	custom.js	46			1536	6000
  + 	de_DE.aff	c309.F_FirefoxMain._INSTALLDIR_DICTIONARIES_x	de-DE.aff	18638			1536	3220
  + 	de_DE.dic	c309.F_FirefoxMain._INSTALLDIR_DICTIONARIES_x	de-DE.dic	1072994			1536	3221
  + 	override.ini	c3.F_FirefoxMain._INSTALLDIR_BROWSER_x	override.ini	34			1536	6001

DATA CHANGE - Icon	Name	Data	
  + 	mozilla.ico	Icon.mozilla.ico

DATA CHANGE - Media	DiskId	LastSequence	DiskPrompt	Cabinet	VolumeLabel	Source	
 <> 	1	6001{4812}				

DATA CHANGE - MsiFileHash	File_	Options	HashPart1	HashPart2	HashPart3	HashPart4	
  + 	custom.js	0	1819190932	1869607806	899243074	1372911033
  + 	de_DE.aff	0	-1514834994	583179758	1240220345	1926195055
  + 	de_DE.dic	0	-1995212411	1509395517	-12145319	1624906423
  + 	override.ini	0	-604764136	-1018035264	725863470	-1335845327

DATA CHANGE - Property	Property	Value	
 <> 	ARPPRODUCTICON	mozilla.ico{firefox.31.3.0.0.ico.exe}
 <> 	IAgree	Yes{No}

DATA CHANGE - Registry	Registry	Root	Key	Name	Value	Component_	
 <> 	RegKey010				Mozilla Firefox{FrontMotion Firefox}	

DATA CHANGE - Shortcut	Shortcut	Directory_	Name	Component_	Target	Arguments	Description	Hotkey	Icon_	IconIndex	ShowCmd	WkDir	DisplayResourceDLL	DisplayResourceId	DescriptionResourceDLL	DescriptionResourceId	
 <> 	ScKey001		MOZILL~1|Mozilla Firefox{FRONTM~1|FrontMotion Firefox}				Starte Mozilla Firefox{Run FrontMotion Firefox (Version 31.3.0.0).}		mozilla.ico{firefox.31.3.0.0.ico.exe}							
 <> 	ScKey002		MOZILL~1|Mozilla Firefox{FRONTM~1|FrontMotion Firefox}				Starte Mozilla Firefox{Run FrontMotion Firefox (Version 31.3.0.0).}		mozilla.ico{firefox.31.3.0.0.ico.exe}							

