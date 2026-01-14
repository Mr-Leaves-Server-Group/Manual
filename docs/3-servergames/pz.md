# 僵毁（Project Zombiod）
硬核2.5D生存游戏，操作复杂，生存困难，堪称2.5D版DayZ。

---

## 1.推荐配置

**2C/4G起跳，4C/8G非常流畅，8C/16G一般属于大服，适合非常多模组的服务器**  
由于游戏本身设计问题，僵尸数量也对CPU有一定要求，**不建议设置太多僵尸**，否则请升级CPU  
由于本游戏对**内存的要求较高**，虽然最低占用很低，但模组一多，人一多，内存量会很重要  
<br>

## 2.开服教程
**重要的服务器配置步骤**

### 2.1.管理员帐户
![后台设置](/assets/pz/admin.png)

### 2.2.游戏内设置
用管理员帐户连接登陆后，左边Admin按钮，点击查看设置页面
![游戏内设置](/assets/pz/in-game-settings.png)  

利用管理员帐户，可以给任何玩家管理权限，操作如下图
![设置管理员](/assets/pz/permission.png)  

### 2.3.找到配置文件
服务器配置文件位于：`/home/container/.cache/Server/<服务器本地文件夹名>.ini`
![文件夹位置](/assets/pz/folder-name.png)

### 2.4.修改配置文件
每个设置旁边都有具体的描述，**以下为几个值得注意的**：  
**强烈建议，在本地配置好服务器，然后部分拷贝到配置文件**
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

## 3.注意事项

一些通用的注意事项，强烈建议阅读  

### 3.1.已知BUG

- .Cache文件夹超过500M后无法启动服务器 - 解决方法->设置 BackupsOnStart=false  
以上操作可以暂时解决不能开机的问题  

### 3.2.其他注意

- 服务器需要手动设置为Public后才能在lobby看到
- 后台服务器名，并不是游戏内显示的名字，而是仅用于后台文件夹多服务器的区分
- 游戏内服务器名字请在游戏内Admin或.Cache/Server/服务器名.ini设置
- 大量模组时，很容易出现不兼容情况，请自己注意一下后台报错  
<br>

