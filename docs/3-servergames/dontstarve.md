# 饥荒联机版（Don't Starve Together）
一款年久失修，但非常经典的2.5D生存游戏。

---

## 1.推荐配置

**2C/4G起跳，适合最多6-8人，4C/8G顶配，适合8-20人。**  
**由于该游戏几乎是单核心为主的，单核心性能对于多人的模组服影响巨大。**  
由于游戏的本身设计问题，人数超过单核心性能后，会出现明显的回溯现象。  
<br>

## 2.开服教程

**首次设置服务器，请仔细阅读以下内容**  

### 2.1.生成服务器Token
获取一个服务器Token，用于服主身份识别，模组下载等，Token生成网址: [Klei Account](https://accounts.klei.com/account/game/servers?game=DontStarveTogether)  

### 2.2.填入服务器Token
将获取到的Token填在服务器后台的变量栏里, 为避免没能刷入文件内：  
将Token填在 `/home/container/DoNotStarveTogether/config/server/cluster_token.txt`  

![Token设置](/assets/dontstrave/token-setup.png)  

### 2.3.开服前的准备
1. 在客户端菜单点击 **创建游戏**
2. 根据需要，**调整世界生成参数**
3. 根据需要，**添加并设置MOD**
4. 设置完成后，点击**生成世界**
5. 去客户端首页点击 **数据** 图标
6. 根据日期，找到刚创建的世界文件夹

**注：下面的截图有完整的流程，建议对照操作**

### 2.4.世界生成参数
**文件夹 `/home/container/DoNotStarveTogether/config/server/Master` 和 `Caves`**   
**配置文件 `leveldataoverride.lua` 控制世界生成设置**，主世界和洞穴各自有一个，**把刚本地创建的 `leveldataoverride.lua` 文件拷贝到服务器对应文件夹，然后删除文件夹内的 `worldgenoverride.lua` **。  
  
**注：原本 `leveldataoverride.lua` 是客户端专用，`worldgenoverride.lua` 是服务器专用，功能基本一样，现在服务器已可读取前者，故删除后者即可**  

### 2.5.启用/配置MOD
**文件夹 `/home/container/DoNotStarveTogether/config/server/Master` 和 `Caves`**  
**配置文件 `modoverrides.lua` 控制mod开启和设置**，主世界Master和地洞Caves文件夹各有一个，把刚本地创建的同名文件，拷贝到对应文件夹即可。  
  
**注：由于配置文件为全英文，且设置名称和游戏内不一致，故不推荐在服务器端手动修改**   

**温馨提示：`MLSG-Chinese-Guide-and-Manual-for-Server-Admins-Please-READ-ME` 文件夹里  
有一些之前开服的Mod模板，包含添加Mod所需的两个文件，用之前建议根据自己需求修改一下**  

![模组服务器图文教程](/assets/dontstrave/mod-setup-1.png)  
![模组服务器图文教程](/assets/dontstrave/mod-setup-2.png)  

### 2.6.添加/下载MOD
**后台已全面升级，不再需要编辑 `dedicated_server_mods_setup.lua` 文件，只需上传 `modoverrides.lua` 文件即可，服务器会自动下载所需MOD。**
  
<hr>
**文件夹 `/home/container/mods`**  
**配置文件 `dedicated_server_mods_setup.lua` 控制mod下载设置**，找到并按照文件上面给出的例子填写（填写后只会下载，不会启用！不填写=不下载，当然也不会启用）。以下两种形式 `ServerModSetup("xxxxxxxxx")` 和 `ServerModCollectionSetup("xxxxxxxxx")` 分别对应单一模组和模组包。只需将 `modoverrides.lua` 文件中所有 `workshop-xxxxxxxxx` 使用下面的转换器，转换成以上对应形式，然后黏贴到服务器对应文件。替换后务必检查是否有错误。
<iframe src="/tools/dst_mod_setup.html" 
    width="100%" 
    height="500" 
    style="border: 1px solid #ccc; border-radius: 8px; overflow: hidden;" 
    scrolling="no">
</iframe>

**将生成的 `dedicated_server_mods_setup.lua` 文件内容，粘贴到服务器对应文件即可, 如下图**
![模组服务器图文教程](/assets/dontstrave/mod-setup-4.png)  
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

## 4.重置服务器（世界）

如果只是重置游戏世界，请在游戏后台使用指令 `c_regenerateworld()` 重置世界即可  
回到原生模式最新版本，请在 `文件` 页面勾选删除所有文件，然后在 `设置` 页面点击重装服务器
<br>


## 5.服务器指令（作弊）

**服务器后台输入指令位置，[请看本页](/1-serverbasics/#21)（部分指令需要在服务器后台使用）**  
**游戏内使用指令：按下 `~` 键（ESC下面的键），或 `shift + ~` 键打开控制台**  
**（游戏内使用指令需管理员/房主身份，且确保控制台显示为remote模式）**  

| 常用指令 | 说明 |
| ---- | ---- |
| c_shutdown() | 【关闭服务器】关闭会自动存档 |
| c_freecrafting() | 【创造模式】免费制作物品 |
| c_godmode() | 【上帝模式】不掉血不会死 |
| c_supergodmode() | 【超级上帝】满状态且上帝 |
| c_speedmult(倍数) | 【速度倍数】调整移动速度 |
| c_regenerateworld() | 【重置世界】重新生成世界 |
| c_listallplayers() | 【列出所有玩家】显示在服务器后台 |
| c_announce("内容") | 【公告】向所有玩家发送公告 |
| c_save() | 【保存游戏】可在一天任意时刻保存 |
| c_rollback(天数) | 【回档】警告！超过快照天数会重置世界 |
| c_goto(AllPlayers[玩家编号]) | 【传送到玩家】游戏内按Tab看玩家顺序 |
  

更多指令推荐参考[灰机Wiki的指令列表](https://dontstarve.huijiwiki.com/wiki/%E6%95%99%E7%A8%8B/%E5%B8%B8%E7%94%A8%E6%8E%A7%E5%88%B6%E5%8F%B0%E6%8C%87%E4%BB%A4)  
<br>


## 6.模组配置器（高级）
用于快速手动编辑模组的配置文件，**不提供添加MOD的功能**，添加MOD强烈建议在客户端操作，以避免MOD兼容性问题，**也不提供添加MOD设置的功能**，因为太容易导致报错。**如果您是新手，强烈不推荐使用该模组编辑器，不正确的操作会导致服务器崩溃，或者模组无法使用。**可以直接在下方的窗口使用，也可以点击<a href="/tools/dst_mod_edit.html" target="_blank">使用网页版模组编辑器(全屏)</a>。  
<iframe src="/tools/dst_mod_edit.html" 
    width="100%" 
    height="1000" 
    style="border: 1px solid #ccc; border-radius: 8px;" 
>
</iframe>
