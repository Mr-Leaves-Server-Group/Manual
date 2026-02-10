# 幻兽帕鲁（Palworld）
宝可梦+ARK+我的世界，缝合游戏，捕捉Pal，战斗，生存，建筑，开放世界游戏。

---

## 1.推荐配置

**后期流畅度，主要依靠CPU核心性能来支撑，人多推荐高配置**  
<iframe src="/tools/quick_server_selector.html?game=palworld"
    width="510px" 
    height="370px" 
    style="border: 1px solid #ccc; border-radius: 8px;" 
>
</iframe>
<br>

## 2.开服教程

**配置文件位置如下**，每次修改务必 **关闭服务器修改，改完再启动服务器**  
**Linux（默认）**```/home/container/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini```  
**Windows（模组）**```/home/container/Pal/Saved/Config/WindowsServer/PalWorldSettings.ini```  

ℹ️因该游戏配置文件复杂，请使用下方工具生成配置文件，再复制粘贴到服务器对应位置。  

✅点击使用➡ **[幻兽帕鲁Palworld 服务器配置工具](https://pal-conf.bluefissure.com/)**  

**⚠️注意：未关闭服务器修改配置文件，或错误配置文件，将导致配置文件将被刷回默认值**  

<div align="center"><img src="/assets/palworld/configer.png" alt="配置生成器"></div>
<div align="center"><strong>使用配置生成器</strong></div>  

<div align="center"><img src="/assets/palworld/configer-result.png" alt="配置生成器"></div>
<div align="center"><strong>拷贝生成的代码</strong></div>  

<div align="center"><img src="/assets/palworld/setting.png" alt="配置文件位置"></div>
<div align="center"><strong>粘贴在设置文件</strong></div>  

## 3.管理指令
**要使用控制台指令**，**请在游戏内输入`/adminpassword <Admin密码>`**，见下图：  
**⚠️注：修改管理员密码请在后台 “启动” 分页，修改 `管理员密码` 值**  

<div align="center"><img src="/assets/palworld/enter_password.png" alt="管理员登陆"></div>
<div align="center"><strong>管理员登陆指令</strong></div>  

<div align="center"><img src="/assets/palworld/password_success.png" alt="管理员登陆成功"></div>
<div align="center"><strong>成功登录管理员账户提示</strong></div>
<br>

**控制台指令，如下**  

| 指令语法                            | 指令说明                           |
|------------------------------------|-------------------------------------------------|
| `/Shutdown [Seconds] [Message Text]` | 此命令将在指定秒数延迟过后，带有指定消息关闭服务器。    |
| `/DoExit`                            | 使用此命令立即停止服务器。                        |
| `/Broadcast [Message Text]`          | 从服务器向所有连接的玩家广播一条消息。              |
| `/KickPlayer [Player ID or Steam ID]` | 将指定玩家从服务器断开连接。                       |
| `/BanPlayer [Player ID or Steam ID]`  | 禁止指定玩家进入服务器。                          |
| `/TeleportToPlayer [Player ID or Steam ID]` | 将你传送到指定玩家的位置。该命令不能从控制台运行。  |
| `/TeleportToMe [Player ID or Steam ID]`   | 将指定玩家传送到你的位置。这个命令也不能从控制台使用。 |
| `/ShowPlayers`                        | 显示所有连接玩家的玩家ID和Steam ID等信息。          |
| `/Info`                               | 显示有关服务器的信息。                             |
| `/Save`                               | 此命令强制保存世界数据。                          |


## 3.加入游戏
**要加入独立服务器**，**请按照以下流程**，见下图：

<div align="center"><img src="/assets/palworld/connect1.png" alt="连接服务器"></div>
<div align="center"><strong>选择菜单第二个</strong></div>  

<div align="center"><img src="/assets/palworld/connect2.png" alt="连接服务器"></div>
<div align="center"><strong>输入地址，并点“连接”</strong></div>
<br>

## 4.已知BUG
**存档损坏无法修复，请格外注意会丢档的BUG**  

| 已知问题                           | 解决方法 / 当前状态         |
|---------------------------------------------|-----------------------|
| 独立服务器，直接连接无法输入密码              | 已修复    |
| 工会中玩家退出，会导致其他未退出玩家烂档     | 已修复            |
| 独立服务器，无法在游戏列表显示服务器          | 已修复            |
| 营地内的最大Pal数量上限设置无效              | 无效设置            |
| 无法调整Boss刷新时间，默认为1小时            | 已修复            |
| 内存泄漏，游戏每隔一段时间会爆内存重启   | 已修复       |
| 卡Bug抓高塔Boss可能导致后期烂档              | 已修复          |
| 使用近期连接过的列表加入，会提示创建角色 | 已修复          |
| 各种卡地形，看起来像是服务器卡顿          | 请以Server FPS为准       |

<br>

## 5.存档位置
**存档文件位置：`/home/container/Pal` 里的 `Saved` 文件夹**  

- **如果要下载整个存档**，**压缩整个文件夹并下载压缩文件**，见下图：  

<div align="center"><img src="/assets/palworld/save_folder.png" alt="存档文件夹"></div>
<div align="center"><strong>游戏存档，设置都在里面</strong></div>  

<div align="center"><img src="/assets/palworld/save.png" alt="压缩存档文件夹"></div>
<div align="center"><strong>压缩整个文件夹，以搬运</strong></div>

<div align="center"><img src="/assets/palworld/download_save.png" alt="下载压缩文件"></div>
<div align="center"><strong>下载压缩后的存档文件夹</strong></div>

- **如果要重新开始游戏，可以删除整个`Saved`文件夹**  
- **如果想保存设置，但删除存档，可以删除`Saved/SaveGames`文件夹**
<br>

## 6.存档转换
该游戏**小四人存档，Linux存档，Windows存档互不相通**，需要转换存档才能使用。  
**⚠️注：该操作非常复杂，且存在存档损坏风险，不推荐使用。强烈推荐联系客服完成**

> 1. 确保所有需要转档的玩家都在线配合操作

> 2. 将原始存档上传到对应服务器文件夹

> 3. 启动服务器，每个玩家都需进入并创建新角色

> 4. 关闭服务器，下载新生成的存档

> 5. 使用转换工具将**新存档**的**老角色转到新角色**上

> 6. 将转换后的存档上传到服务器并启动

> 7. 所有玩家进入游戏，确认存档无误

✅点击查看➡ **[幻兽帕鲁Palworld 存档编辑器](https://github.com/deafdudecomputers/PalWorldSaveTools)**
