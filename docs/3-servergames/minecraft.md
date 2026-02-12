# 我的世界（Minecraft）
包含最常用的Mod和插件后台：PaperMC，Forge，CurseForge，Spigot

---

## 1.推荐配置
**不同版本差异较大，使用下面的工具，快速选择适合您需求的服务器配置。**  
<iframe src="/tools/quick_server_selector.html?game=minecraft"
    width="510px" 
    height="370px" 
    style="border: 1px solid #ccc; border-radius: 8px;" 
>
</iframe>

## 2.后台简介
- **🪵【必填】服务器类型** 选择要运行的服务端核心，这将影响安装脚本的识别逻辑。  
  ⚠️注：切换后需手动删除所有文件并在设置页面点击“重装服务器”。  

| 服务器类型 | 适用场景 | 核心特点 | 插件/模组支持 |
| :--- | :--- | :--- | :--- |
| **Vanilla (原版)** | 极简生存、好友开荒 | 官方纯净体验，最稳定，性能占用最低 | 不支持 |
| **Paper (插件)** | 商业服、多人社区 | 性能优化之王，支持高版本，防作弊强 | 仅插件 (.jar) |
| **Forge (模组)** | 大型模组生存 | 历史最悠久，模组生态最丰富，兼容性强 | 大型 Mod |
| **NeoForge (模组)** | 1.20.1+ 现代模组服 | Forge 的现代化分支，性能与架构更优 | 现代 Mod |
| **Fabric (模组)** | 生电、轻量化生存 | 启动极快，占用内存小，生电玩家首选 | 轻量 Mod |
| **CurseForge (整合包)** | 国际大作 (如 RLCraft) | 自动从CF下载整合包，无需手动上传 | 完整整合包 |
| **GuoChan (整合包)** | 国内流行整合包 | 预设国内热门包，一键安装，新手友好 | 完整整合包 |

- **🔴【高级】服务器 Jar 文件名** 用于运行服务器的核心文件名  
<small>注：默认为 `server.jar`，通常无需修改，第三方自定义模组包可根据需要修改。</small>
  
- **⭐️【常用】MC游戏版本** 选择主流版本(1.7.10 - latest)  
<small>注：填写手动版本后此项失效，修改版本后请务必同步更改右上角的 Java 镜像版本。</small>

- **🔴【高级】手动游戏版本** 填写不包含在常用列表中的版本（如 1.20.6）  
<small>注：留空不生效，修改版本后请务必同步更改右上角的 Java 镜像版本。</small>

- **🧩【模组】具体版本号** 用于确定 Loader 版本，请务必与客户端对齐  
<small>填写格式示例：Paper：`100`，Fabric：`0.16.13`，Forge：`47.4.2`，NeoForge：`20.4.194`</small>

- **🧩【模组】Fabric版本（Fabric API模组）** 自动安装 API 模组  
<small>Fabric 模式专用。填写格式示例：`0.92.0+1.20.1`</small>

- **📦【整合包】CF模组包-Project ID** 填写 CurseForge 模组包项目ID（位于页面右侧）  
<small>例如：RL-Craft 为 `285109` <a href="#36curseforge">点击查看获取方法</a></small>

- **📦【整合包】CF模组包-File ID** 填写 CurseForge 模组包文件ID（位于文件URL最后）  
<small>例如：RL-Craft 最新版服务器包为 `4612990` <a href="#36curseforge">点击查看获取方法</a></small>

- **📦【整合包】国产模组包-ModPack** 选择预设好的国产整合包服务端  
<small>如《愚者》或《乌托邦》<a href="#37guochan">点击查看模组包列表</a></small>

![后台界面](\assets\minecraft\minecraft-egg-backend.png)  

- **🎮【游戏】服务器MOTD** 服务器在联机列表显示的简短介绍，部分版本不支持中文，推荐使用英文
  

- **🎮【游戏】正版验证** 开关正版验证模式。关闭后离线玩家使用PCL2客户端可进入，但所有玩家皮肤将会失效


- **🎮【游戏】游戏难度** 设置世界难度：peaceful (和平), easy (简单), normal (普通), hard (困难)


- **🎮【游戏】游戏模式** 设置默认模式：survival (生存), creative (创造), adventure (冒险), spectator (旁观)


- **🎮【游戏】最大玩家数量** 设置服务器最大同时在线人数， 不推荐设置过高


- **🎮【游戏】地图种子** 自定义世界生成种子。若填写错误可能导致无法启动  
<small>注：留空则使用随机种子，推荐使用<a href="https://www.chunkbase.com/apps/seed-map">Chunkbase Seed Map</a>查看种子地形。</small>

- **🎮【游戏】允许飞行** 是否允许玩家在生存模式下飞行。模组服建议开启此项

## 3.开服教程
### 3.1.Java版本选择
**由于MC各类分支较多，请参考游戏版本选择Java版本**

| Minecraft服务端版本号 | JDK/Java推荐版本 |
| -------------------- | ---------------- |
| 1.7+                 | 8                |
| 1.12+ ~ 1.15+        | 8                |
| 1.16+                | 8/11             |
| 1.17+ ~ 1.20+        | 17               |
| 1.20.6+              | 21               |

<hr/>

### 3.2.Vanilla（原版）

- **原版优化不是很好，通常建议使用Paper，除非是最新版**  
但需要注意Paper默认关闭了部分游戏特性，来防止服务器卡顿
- 比如：刷沙机的传送门周边区域加载，所以需要两个人在传送门两边
- 比如：地毯机的位移刷物品特性（可以在Paper的Global设置里面开启）  

<hr/>
  
### 3.3.Paper（插件）
> 1. 修改 **服务器类型** 为 Paper
> 2. 修改 **MC游戏版本** 和 **具体版本号（选填）** 参数
> 3. 参考 **[Java版本选择](#31java)**，在右上角，选择正确的Java
> 4. 打开 **设置** 分页，点击 **重新安装服务器**
> 5. 等待安装完成，结果可在 **MLSG-LOG/install.log** 日志文件中查看

**注：可以使用底部的[快速版本查询工具](#8)来查询对应版本的Paper版本号**  

- Paper为Bukkit的分支，同时兼容Spigot，但仍有部分插件在两者之间存在兼容性问题  
Paper的插件可以直接放入**插件文件夹Plugins**里，通常可以从[SpigotMC](https://www.spigotmc.org/)下载  

<hr/>

### 3.4.Neo/Forge（模组）
> 1. 修改 **服务器类型** 为 Forge 或 NeoForge
> 2. 修改 **MC游戏版本** 和 **具体版本号（选填）** 参数
> 3. 参考 **[Java版本选择](#31java)**，在右上角，选择正确的Java
> 4. 打开 **设置** 分页，点击 **重新安装服务器**
> 5. 等待安装完成，结果可在 **MLSG-LOG/install.log** 日志文件中查看

**注：可以使用底部的[快速版本查询工具](#8)来查询对应版本的Forge/NeoForge版本号**  

<hr/>

### 3.5.Fabric（模组）
> 1. 修改 **服务器类型** 为 Fabric
> 2. 修改 **MC游戏版本** 和 **具体版本号（选填）** 参数
> 3. 【可选】修改 **Fabric版本（Fabric API模组）** 参数，自动安装 Fabric API 模组
> 4. 参考 **[Java版本选择](#31java)**，在右上角，选择正确的Java
> 5. 打开 **设置** 分页，点击 **重新安装服务器**
> 6. 等待安装完成，结果可在 **MLSG-LOG/install.log** 日志文件中查看

**注：可以使用底部的[快速版本查询工具](#8)来查询对应版本的Fabric版本号**  

<hr/>

### 3.6.CurseForge（整合包）
#### 3.6.1.服务器端自动安装  
**MLSG支持服务器端自动安装，只需用户填入 Project-ID 和 File-ID 服务器就会安装对应服务器端。**  

> 1. 修改 **服务器类型** 为 CurseForge
> 2. 按照下图在CurseForge官网找到对应的 **Project ID** 和 **File ID**
> 3. 填写 **CF模组包-Project ID** 和 **CF模组包-File ID** 参数
> 4. 参考 **[Java版本选择](#31java)**，在右上角，选择正确的Java
> 5. 打开 **设置** 分页，点击 **重新安装服务器**
> 6. 等待安装完成，结果可在 **MLSG-LOG/install.log** 日志文件中查看 

<hr/>

**[CurseForge模组包列表](https://curseforge.com/minecraft/modpacks)，Project-ID在对应模组包主页右侧找到**  
**File-ID则在，具体文件页面的顶部URL最后部分（服务器必须要Server Pack的File-ID）**  
![CurseForge-IDs](\assets\minecraft\curseforge-1.png)
![CurseForge-IDs](\assets\minecraft\curseforge-2.png)
![CurseForge-IDs](\assets\minecraft\curseforge-3.png)
![CurseForge-IDs](\assets\minecraft\curseforge-4.png)  

<hr/>

#### 3.6.2.客户端安装模组包  
**客户端使用CurseForge教程如下，同样以上面的ATM9为例：**  

点击[CurseForge官网](https://www.curseforge.com/download/app)下载客户端安装器，下载完成后，搜索并安装对应的模组包  
![CurseForge客户端下载](\assets\minecraft\curseforge-client.png)
![CurseForge安装模组包](\assets\minecraft\curseforge-modpack.png)
![CurseForge其他功能](\assets\minecraft\curseforge-demo.png)  

<hr/>

### 3.7.GuoChan（国产包）
#### 3.7.1.服务器端自动安装

**MLSG支持国产包服务器端自动安装，只需用户选择对应的模组包，服务器就会安装对应服务器端。**

> 1. 修改 **服务器类型** 为 GuoChan
> 2. 选择 **国产模组包-服务端** 参数
> 3. 参考 **[Java版本选择](#31java)**，在右上角，选择正确的Java
> 4. 打开 **设置** 分页，点击 **重新安装服务器**
> 5. 等待安装完成，结果可在 **MLSG-LOG/install.log** 日志文件中查看  
> 6. 可以在下方查看对应模组包的详细信息和客户端下载链接

<iframe src="/tools/guochan_metadata.html"
    width="100%" 
    height="370px" 
    style="border: 1px solid #ccc; border-radius: 8px;" 
>
</iframe>

<hr/>

#### 3.7.2.客户端安装模组包
**使用PCL2客户端安装国产包教程如下，同样以《愚者》为例：**

> 1. 首先下载PCL2客户端，点击[官网链接](https://bbsmc.net/software/pcl)下载
> 2. 安装并打开PCL2客户端，点击左下角 **版本选择**
> 3. 在版本选择界面，点击左侧的 **安装模组包**
> 4. 选择模组包 zip 文件，点击 **打开**
> 5. 等待安装完成后，选择右侧安装好的模组包
> 6. 返回主界面，点击 **启动游戏**

![PCL2客户端下载](\assets\minecraft\PCL2-1.png)
![PCL2版本选择](\assets\minecraft\PCL2-2.png)
![PCL2安装模组包](\assets\minecraft\PCL2-3.png)

## 4.模组相关
### 4.1.安装模组
> 1. 首先在客户端正确添加 Mod
> 2. 测试 Mod 在本地正常工作
> 3. 阅读[大文件/多文件传输-图文教程](/2-serveradvanced/filetransfer/)
> 4. 拷贝模组到服务器 **mods** 文件夹内
> 5. 删除无法加载的模组（客户端专用模组）
> 6. 调整在**config**和**world/severconfig**里的 Mod 配置文件  
> 7. 分发客户端整合包给其他玩家

### 4.2.模组上手

- 由于模组服对服务器/客户端版本对应要求非常严格，推荐新玩家从Curseforge打包好的模组包开始。**[CurseForge官网 - 模组包列表](https://curseforge.com/minecraft/modpacks)**  
- 如果想玩第三方模组包（如MCmod，B站，笔记），需要玩家自己**提供服务器端模组包**，以及自己**分发客户端模组包**，保证所有玩家客户端版本和模组统一。  
<br>

## 5.地图载入/生成速度

- **地图载入（已经探索的区域）**主要和内存大小有关，如果内存不够大，已经生成的地图则会载入很慢，一般8G足以，16G-24G最优，大内存一般3-5倍速飞行都会非常流畅的载入已经生成的地图。 
- **游戏生成（未探索过的区域）**和CPU有关系，绝大部分例如Paper和Spigot后端都支持多核心的地图渲染，多核心会显著提升地图生成速度。但对于绝大多数模组服务器通常没有帮助。
- 模组服务器（通常地图生成都是单核心渲染），所以都会很慢，可以使用对应版本的pregen模组来预生成地图，以提升玩家体验。（部分版本可能只能在客户端运行，请在客户端运行后上传地图到后台） 
<br>

## 6.游戏指令和权限
**在后台输入所有指令时**，**前面不需要加斜杠 `/`**，如下图所示 `/op 玩家游戏名称`，**后台直接输入 `op 玩家游戏名称` 即可**，**游戏内则需要正常输入 `/op 玩家游戏名称` （带斜杠）**。游戏内输入指令时，按下Tab键可以自动补全指令。**更多指令请参考[MC官方Wiki](https://minecraft.fandom.com/zh/wiki/%E5%91%BD%E4%BB%A4)**。

- 赋予玩家OP/管理员（指令权限）：`/op 玩家游戏名称`
- 显示全部可用指令：`/help`
- 查看当前地图种子：`/seed`
- 更改游戏模式：`/gamemode creative/survival/adventure/spectator`
- 更改生物破坏权限：`/gamerule mobGriefing true/false`  
- 死亡掉落物品：`/gamerule keepInventory true/false`

![MC指令](\assets\minecraft\op1.png)
![MC指令](\assets\minecraft\op2.png)


## 7.服务器属性设置
**服务器属性设置文件 `server.properties`，可以在后台的文件管理器中找到，可调整的参数如下：**  

- `online-mode`：正版验证，默认true，改成false允许盗版玩家进入（皮肤全部失效）
- `level-name`：地图名称，不可使用中文，不要使用空格，建议使用下划线或连字符，默认是world
- `level-seed`：地图种子，默认是随机（空值），可以在[chunkbase](https://www.chunkbase.com/apps/seed-map)上根据种子id查看种子地形
- `enable-command-block`：是否开启指令方块，如果要使用指令方块，设置为true
- `allow-flight`：是否允许飞行，默认false，如果有加装飞行模组，修改为true
- `view-distance`：视距，默认10，建议设置为8-12，过大会导致服务器卡顿
- `max-players`：最大玩家数量，默认20，建议设置为10-20，过大会导致服务器卡顿

## 8.快速版本查询器
<iframe src="/tools/fast_version_search.html"
    width="100%" 
    height="250px" 
    style="border: 1px solid #ccc; border-radius: 8px;" 
>
</iframe>
<br>