# 我的世界（Minecraft）
包含最常用的Mod和插件后台：PaperMC，Forge，CurseForge，Spigot

---

## 1.推荐配置

**2C/4G起跳，4C/8G非常流畅，8C/16属于大服，更高配置适合百人或MOD服**  
**由于部分功能是单核心处理的，所以单核心性能对于多人/大量物品的模组服影响非常大**  
CPU升级路线：Intel-E5 < Ryzen2000 < Intel-10th < Ryzen3000 < Ryzen5000 < Ryzen7000  
<br>

## 2.开服教程

**由于MC各类分支较多，以下为不同分支的后台教程**

| Minecraft服务端版本号 | JDK/Java推荐版本 |
| -------------------- | ---------------- |
| 1.7+                 | 8                |
| 1.12+ ~ 1.15+        | 8                |
| 1.16+                | 8/11             |
| 1.17+ ~ 1.20+        | 17               |
| 1.20.6+              | 21               |


### 2.1.Vanilla

- **原版优化不是很好，通常建议使用Paper，除非是最新版**  
但需要注意Paper默认关闭了部分游戏特性，来防止服务器卡顿
- 比如：刷沙机的传送门周边区域加载，所以需要两个人在传送门两边
- 比如：地毯机的位移刷物品特性（可以在Paper的Global设置里面开启）  
  
### 2.2.Paper

- Paper为Bukkit的分支，同时兼容Spigot，但仍有部分插件在两者之间存在兼容性问题  
Paper的插件可以直接放入**插件文件夹Plugins**里，通常可以从[Spigot MC](https://www.spigotmc.org/)下载  
  
- Paper的**最优开机指令可以在[flags.sh](https://flags.sh/)生成**（注意勾选Pterodactyl）  
但务必请记得**内存Heap上限最高为50%-75%的分配内存**  
**否则服务器JVM内存增长过程中可能触发内存限制导致停机**  

### 2.3.Forge/NeoForge

**警告：强烈不建议新手玩家，自己组装中大型模组包，Debug问题将会非常麻烦**
![Forge后台](\assets\minecraft\forge-1.png)  

#### 2.3.1.更换版本

> 1. 去 **启动** 页面，更改 **MC游戏版本** 和 **FORGE/NeoForge构建版本号** 两个参数
> 2. 在 **启动** 页面，根据对应的版本，在右上角，选择正确的Java
> 3. 去 **文件** 页面，删除当前服务器所有文件
> 4. 去 **设置** 页面，点击 重新安装服务器, 等待服务器安装完成
> 5. 启动服务器，弹窗 选择接受EULA后，服务器会重启正确运行  

#### 2.3.2.添加模组

> 1. 首先在客户端正确添加 Mod
> 2. 测试 Mod 在本地正常工作
> 3. 拷贝到服务器 Mod 文件夹内
> 3. [大文件/多文件传输-图文教程](/2-serveradvanced/filetransfer/)
> 4. 调整在**config**和**world/severconfig**里的 Mod 配置文件  
> 5. 分发 Mod 和 资源包 给玩家


### 2.4.Spigot

假矿插件会导致严重的网络问题和加载问题，不建议使用  
**推荐直接使用Paper后端**，因为Paper对假矿的优化较好，基本上体验不到卡顿和穿模问题  


### 2.5.CurseForge

#### 2.5.1.服务器端自动安装  
**MLSG支持服务器端自动安装，只需用户填入 Project-ID 和 File-ID 服务器就会安装对应服务器端。**  
<hr/>
<center>**填写完成后，删除服务器所有文件，然后在 设置 选项卡，点击重装服务器**</center>  
![CurseForge后台](\assets\minecraft\curseforge-panel.png)  

<hr/>
<center>**[CurseForge模组包列表](https://curseforge.com/minecraft/modpacks)，Project-ID在对应模组包主页右侧找到**  
**File-ID则在，具体文件页面的顶部URL最后部分（服务器必须要Server Pack的File-ID）**</center>  
![CurseForge-IDs](\assets\minecraft\curseforge-1.png)
![CurseForge-IDs](\assets\minecraft\curseforge-2.png)
![CurseForge-IDs](\assets\minecraft\curseforge-3.png)
![CurseForge-IDs](\assets\minecraft\curseforge-4.png)  


#### 2.5.2.客户端安装模组包  
**客户端使用CurseForge教程如下，同样以上面的ATM9为例：**  
<hr/>
<center>点击[CurseForge官网](https://www.curseforge.com/download/app)下载客户端安装器，下载完成后，搜索并安装对应的模组包</center>  
![CurseForge客户端下载](\assets\minecraft\curseforge-client.png)
![CurseForge安装模组包](\assets\minecraft\curseforge-modpack.png)
![CurseForge其他功能](\assets\minecraft\curseforge-demo.png)
<br>

## 3.注意事项

一些通用的注意事项，强烈建议阅读  

### 3.1.已知BUG

- 请务必为服务器设置有限的内存（数字或百分比），否则MC的安装脚本将不会正常运行
- 由于MC运行在JVM里面，所以内存显示并不正确，**强烈推荐使用Spark**查看服务器状态  

### 3.2.内存设置

- 对于启动指令的参数，**必须设置有限的Heap大小**，因为JVM本身需要一部分额外内存，
- **Heap的最大内存为分配内存的50%-75%之间，或者留2G，比如12G的分配，Heap给10G**
- 部分JVM的Flag**建议不要使用**，包括：**-XX:+DisableExplicitGC**，**-XX:+AlwaysPreTouch**  
  以上Flag可能导致爆内存问题频繁发生，导致服务器频繁触发OOM，自动重启  

### 3.3.模组上手

- 由于模组服对服务器/客户端版本对应要求非常严格，推荐新玩家从Curseforge打包好的模组包开始。**[CurseForge官网 - 模组包列表](https://curseforge.com/minecraft/modpacks)**  
- 如果想玩第三方模组包（如MCmod，B站，笔记），需要玩家自己**提供服务器端模组包**，以及自己**分发客户端模组包**，保证所有玩家客户端版本和模组统一。  
<br>

## 4.地图载入/生成速度

- **地图载入（已经探索的区域）**主要和内存大小有关，如果内存不够大，已经生成的地图则会载入很慢，一般8G足以，16G-24G最优，大内存一般3-5倍速飞行都会非常流畅的载入已经生成的地图。 
- **游戏生成（未探索过的区域）**和CPU有关系，绝大部分例如Paper和Spigot后端都支持多核心的地图渲染，多核心会显著提升地图生成速度。但对于绝大多数模组服务器通常没有帮助。
- 模组服务器（通常地图生成都是单核心渲染），所以都会很慢，可以使用对应版本的pregen模组来预生成地图，以提升玩家体验。（部分版本可能只能在客户端运行，请在客户端运行后上传地图到后台） 
<br>

## 5.游戏内指令和权限

- 赋予玩家OP/管理员（指令权限）：`/op 玩家游戏名称`  
- 更改游戏模式：`/gamemode 0/1/2/3 玩家游戏名称`  
- 更改生物破坏权限：`/gamerule mobGriefing true/false`  
- 死亡掉落物品：`/gamerule keepInventory true/false`

![MC指令](\assets\minecraft\op1.png)
![MC指令](\assets\minecraft\op2.png)
<center>**[更多指令请参考MC官方Wiki](https://minecraft.fandom.com/zh/wiki/%E5%91%BD%E4%BB%A4)**</center>  
<br>

## 6.网页地图Dynmap设置

Dynmap需要额外的端口分配，如果只有一个首选（游戏端口）请联系管理员开通更多端口  
同时也可以为您配置反向代理来提供https和纯地址访问（无需端口号）  
**Dynmap对于较大和较多层的世界，可能占据巨大硬盘空间，建议对其进行专门的设置**  
