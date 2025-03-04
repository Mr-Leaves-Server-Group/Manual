# 饥荒联机版（Don't Starve Together）
一款年久失修，但非常经典的2.5D生存游戏。

---

## 1.推荐配置

**2C/4G起跳，适合最多6-8人，4C/8G顶配，适合8-20人。**  
**由于该游戏几乎是单核心为主的，所以单核心性能对于多人的模组服影响非常大。**  
CPU升级路线：Intel-E5 < Ryzen2000 < Intel-10th < Ryzen3000 < Ryzen5000 < Ryzen7000  
由于游戏的本身设计问题，人数超过单核心性能后，会出现明显的回溯现象。  
<br>

## 2.开服教程

**首次设置服务器，请仔细阅读以下内容**  

### 2.1.生成服务器Token
获取一个服务器Token，用于服务器列表识别，Token生成网址: [Klei Account](https://accounts.klei.com/account/game/servers?game=DontStarveTogether)  

### 2.2.填入服务器Token
将获取到的Token填在服务器后台的变量栏里, 为避免没能刷入文件内：  
将Token填在 `/home/container/DoNotStarveTogether/config/server/cluster_token.txt`  

![Token设置](/assets/dontstrave/token-setup.png)  

### 2.3.设置世界生成参数
**文件夹 `/home/container/DoNotStarveTogether/config/server/Master` 和 `Caves`**   
**配置文件 `leveldataoverride.lua` 和 `worldgenoverride.lua` 控制世界生成设置**，洞穴和地上各一个，内容不一样，`worldgenoverride.lua` 文件已经弃用，**推荐直接把 `leveldataoverride.lua` 文件拷贝到对应文件夹，然后删除 `worldgenoverride.lua` **。（注：原本这俩文件一个是客户端专用，一个是服务器专用，功能基本上一样，现在leveldataoverride.lua已经可以兼容客户端和服务器，所以推荐直接使用leveldataoverride.lua）

### 2.4.添加/下载MOD
**文件夹 `/home/container/mods`**  
**配置文件 `dedicated_server_mods_setup.lua` 控制mod下载设置**，找到并按照文件上面给出的例子，填写即可（填写后只会下载，不会启用，不填写不下载当然也不会启用）。如这以下两种形式 `ServerModSetup("xxxxxxxxx")` 和 `ServerModCollectionSetup("xxxxxxxxx")` 分别对应单一模组和模组包。只需将 `modoverride.lua` 文件中所有 `workshop-xxxxxxxxx` 转换成以上对应形式，然后一行行填入文件即可。推荐使用ChatGPT等工具进行批量替换。替换后务必检查是否有错误。

### 2.5.启用/配置MOD
**文件夹 `/home/container/DoNotStarveTogether/config/server/Master` 和 `Caves`**  
**配置文件 `modoverrides.lua` 控制mod开启和设置**，俩shard文件夹（Master和Cave）各一个，直接将在客户端设置好的同名文件，拷贝到对应文件夹即可。（注：由于配置文件没有注释，建议在客户端单机设置好后，直接拷贝到服务器端，强烈不建议在服务器端手动修改，很容易出错）  

**注意：完成以上步骤后，如果提示缺少MOD，请重启后等待5-10分钟，让MOD下载完成**  

**温馨提示：`MLSG-Chinese-Guide-and-Manual-for-Server-Admins-Please-READ-ME` 文件夹里  
有一些之前开服的Mod模板，包含添加Mod所需的两个文件，用之前建议根据自己需求修改一下**  

![世界设置](/assets/dontstrave/mod-setup.png)  
<br>

## 3.注意事项

一些通用的注意事项，强烈建议阅读  

### 3.1.已知BUG

- **该游戏由于年久失修，后台落后，操作不便是常态**
- **服务器Ping显示为???的问题，无法完美解决，等待一会会变化，之后每次都会显示** - 开发团队说只需要一个端口就应该可以显示ping，但实践中，该问题游戏发售起直至今天仍然天天发生。本问题无法解决，官方未对此进行Debug。Ping显示为???的原因猜测为：游戏开发时为了避免同一时间发出太多ICMP ECHO包，每个服务器只客户端只会Ping一次。导致一旦该Ping丢包（不管是服务器，还是客户端，还是中间网络丢包）会客户端都会显示为???  

### 3.2.弃用MOD

- **由于5格装备作者不再更新，很多Mod与其不兼容**，会导致世界崩溃  

### 3.2.其他注意

- **请记得在 `server.ini` 中更改 Cave 的 Server ID 避免重复无法识别多Shard**  
<br>

## 4.重装服务器

直接删除master和cave文件夹里面的Save和Backup文件夹就可以了，这样服务器开机的时候就会重新生成所有东西。
由于饥荒的Mod文件配置比较繁琐，**不建议删除所有文件重装**，把 `modoverride.lua` 里的字段删了就好，当然也可以利用 
`MLSG-Chinese-Guide-and-Manual-for-Server-Admins-Please-READ-ME` 文件夹里面的饥荒Mod模板。
