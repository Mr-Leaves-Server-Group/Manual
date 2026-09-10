# 僵毁（Project Zombiod）
硬核2.5D生存游戏，操作复杂，生存困难，堪称2.5D版DayZ。

---

## 1.推荐配置
**自B42开始游戏需要最低4C/8G（启动需要9G+），模组服推荐4C/10G，4C/16G适合非常多模组的服务器**。由于游戏本身设计问题，本游戏对**CPU和内存的要求较高**，虽然最低占用很低，但模组一多，人一多，CPU和内存量会很重要。僵尸数量也对CPU有一定要求，**不建议设置太多僵尸**，否则请升级CPU.  

## 2.开服教程
后台设置界面，可用于简单的MOD安装和加载。  
**⚠️注意：不推荐使用该方式添加模组，除非你知道自己在做什么。因为僵毁基于LUA，模组依赖复杂，加载顺序要求严格，且BUG较多，通常无法在不测试的情况下添加大量模组，故不推荐您使用该方式创建模组服务器。请按照下方图文方式操作最为保险**。  
![后台设置](/assets/pz/admin-page.png)    

### 2.1.订阅模组/地图
![订阅模组](/assets/pz/Zombiod-1.png)

### 2.2.生成配置文件
![生成配置文件](/assets/pz/Zombiod-2.png)
![生成配置文件](/assets/pz/Zombiod-3.png)
![生成配置文件](/assets/pz/Zombiod-4.png)

### 2.3.添加模组/地图
![添加模组](/assets/pz/Zombiod-5.png)
![添加模组](/assets/pz/Zombiod-6.png)
![添加模组](/assets/pz/Zombiod-7.png)

### 2.4.设置世界参数
**设置完世界参数后，点击【存储】。**  
**⚠️注意：强烈推荐本地启动服务器测试几次。避免有任何模组BUG无法工作。**
![设置世界参数](/assets/pz/Zombiod-8.png)


### 2.5.上传配置文件
![找到配置文件](/assets/pz/Zombiod-9.png)
![上传配置文件](/assets/pz/Zombiod-10.png)
![上传成功](/assets/pz/Zombiod-11.png)
![修改加载配置](/assets/pz/Zombiod-12.png)
![重启服务器](/assets/pz/Zombiod-13.png)

### 2.6.手动修改配置
**配置文件所在位置: `/home/container/.Cache/Server/服务器名.ini`**  
**每个设置旁边都有具体的描述，以下为几个值得注意的**：  
**⚠️注意：强烈建议在本地配置好服务器，然后部分拷贝到配置文件**
```
# 以下为一个正确配置运行的Mod服务器的部分内容

# 输入Mod的名字，请查看文件夹 \Steam\steamapps\workshop\modID\mods\modName\info.txt
Mods=Arsenal(26)GunFighter;modoptions;Brita;PlayersOnMap;GRTranslationCN;InGameMaps_FortRedstone;FORTREDSTONE;InGameMaps;Brita_2;lakeivytownship;InGameMaps_WestPointExpansion;WestPointExpansion;Authentic Z - Current;AuthenticZBackpacks+;AuthenticZLite;InGameMaps_FortKnox;Fort Knox;InGameMaps_Vanilla;Fort Rock Ridge;RV_Interior_MP;autotsartrailers;tsarslib;ATA_Bus;MoreBuilds;PropaneTankFix;UBPropFix

# 输入地图名称，请查看文件夹 \Steam\steamapps\workshop\modID\mods\modName\media\maps\
Map=vehicle_interior;Fort Rock Ridge;InGameMaps_Vanilla;SouthMuldraugh_map;NewDenver_map;Rosebery_map;Silverton_map;SemaNewCity_map;pureland_map;landsole_map;koreancity_map;Glenport_map;Fort Knox, KY by Woldren_map;Fort Knox linked to Eerie Country_map;From Bedford Falls to Fort Knox_map;FezNature_map;Eerie Country_map;Rebuild_map;DirkVille_map;cherbourg_map;Brandenburg by Woldren_map;InGameMaps_Main;AZSpawn;west_point_expansion;west_point_expansion_map;li_township;FortRedstone;FortRedstone_map;Muldraugh, KY

# 是否在服务器列表（内置列表）显示服务器
Public=false

# 输Mod的Workshop ID，可以在创意工坊顶部的链接里面找到
WorkshopItems=2297098490;2200148440;2169435993;2732804047;2216172287;2335368829;2460154811;1516836158;2756689895;2252982049;2195155059;2806456685;1414568604;2822286426;2282429356;2392709985;2592358528;515555911;2889045069;2883755057
```
![配置文件](/assets/pz/settings.png)

## 3.加入游戏
请按照下方图文指引加入游戏服务器  
![加入游戏](/assets/pz/join-1.png)
![加入游戏](/assets/pz/join-2.png)
![加入游戏](/assets/pz/join-3.png)
![加入游戏](/assets/pz/join-4.png)

## 4.管理员功能
用管理员帐户连接登陆后，左边Admin按钮，点击查看设置页面
![游戏内设置](/assets/pz/in-game-settings.png)  

利用管理员帐户，可以给任何玩家管理权限，操作如下图
![设置管理员](/assets/pz/permission.png)  

## 5.注意事项

一些通用的注意事项，强烈建议阅读  

### 5.1.已知BUG

- .Cache文件夹超过500M后无法启动服务器 - 解决方法->设置 BackupsOnStart=false  
以上操作可以解决不能开机的BUG  

### 5.2.其他注意

- 服务器需要手动设置为Public后才能在lobby看到
- 后台服务器名，并不是游戏内显示的名字，而是仅用于后台文件夹多服务器的区分
- 游戏内服务器名字请在游戏内Admin或.Cache/Server/服务器名.ini设置
- 大量模组时，很容易出现不兼容情况，请自己注意一下后台报错  
<br>

