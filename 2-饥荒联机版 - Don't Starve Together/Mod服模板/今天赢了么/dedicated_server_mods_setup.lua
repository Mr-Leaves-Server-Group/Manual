--There are two functions that will install mods, ServerModSetup and ServerModCollectionSetup. Put the calls to the functions in this file and they will be executed on boot.

--ServerModSetup takes a string of a specific mod's Workshop id. It will download and install the mod to your mod directory on boot.
	--The Workshop id can be found at the end of the url to the mod's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=350811795
	--ServerModSetup("350811795")

--ServerModCollectionSetup takes a string of a specific mod's Workshop id. It will download all the mods in the collection and install them to the mod directory on boot.
	--The Workshop id can be found at the end of the url to the collection's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=379114180
	--ServerModCollectionSetup("379114180")

--#5 Equipment
ServerModSetup("375850593")

--#Health Info
ServerModSetup("375859599")

--#Global Position
ServerModSetup("378160973")

--#SmartBoardforBOX
ServerModSetup("1595631294")

--#Fang KA 2 Zhao
ServerModSetup("1216718131")

--#CampFire Respawn
ServerModSetup("569043634")

--#Xue tiao
ServerModSetup("1207269058")

--#Tishi
ServerModSetup("1898292532")

--#No Thermal Stone Durability
ServerModSetup("466732225")

--#Wormhole Marks [DST]
ServerModSetup("362175979")

--#Map Revealer for DST
ServerModSetup("363112314")

--#Infinite Tent Uses
ServerModSetup("356930882")
