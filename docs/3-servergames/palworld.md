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

### 2.1 参数修改

**在【启动】分页里修改参数**，见下图：  
支持绝大部分参数修改，**不支持的参数请参考下方教程手动修改配置文件**
<div align="center"><img src="/assets/palworld/palworld_config.png" alt="启动参数"></div>

**⚠️注意：修改参数后务必 ➡重启服务器，才能生效**  
**✅温馨提醒：在这里修改的参数，会自动覆盖配置文件里的对应设置**  
<br>

### 2.2 其他参数

**很少用的参数** 在**【启动】**分页没有列出，手动修改请参考下方教程：  

<hr>
控制游戏各类参数的 **配置文件** 可以在如下位置找到  

**性能原版服（Linux版）**  
```/home/container/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini```  
**模组扩展服（Windows版）**  
```/home/container/Pal/Saved/Config/WindowsServer/PalWorldSettings.ini```

**⚠️注意：是服务器后台的[【文件】](/1-serverbasics/){target=_blank}分页里，不是客户端**
<hr>

**请按照以下步骤配置服务器：**  

> 1. **使用下方工具生成配置文件**  

> 2. **复制粘贴到配置文件的位置**  

> 3. **不会可以看下方的图文教程**  

<br>
✅点击使用➡ **[幻兽帕鲁Palworld 服务器配置工具](https://pal-conf.bluefissure.com/){target=_blank}**  

**⚠️注意：每次修改务必 ➡关闭服务器修改，改完再启动服务器**  

<div align="center"><img src="/assets/palworld/configer.png" alt="配置生成器"></div>
<div align="center"><strong>使用配置生成器</strong></div>  
<div align="center"><strong>只需调整 游戏内设置 & 高级设置 即可</strong></div>  

<div style="height:20px"></div>  <!-- 完美间距 -->

<div align="center"><img src="/assets/palworld/configer-result.png" alt="配置生成器"></div>
<div align="center"><strong>拷贝生成的代码</strong></div>  

<div style="height:20px"></div>  <!-- 完美间距 -->

<div align="center"><img src="/assets/palworld/setting.png" alt="配置文件位置"></div>
<div align="center"><strong>粘贴在<a href="/3-servergames/palworld/#2" target="_blank">配置文件</a></strong></div>  

## 3.管理指令
**要使用控制台指令**，**请在游戏内输入`/adminpassword <Admin密码>`**，见下图：  
**⚠️注意：修改管理员密码请在后台[【启动】](/1-serverbasics/){target=_blank}分页，修改 `管理员密码` 值**  

<div align="center"><img src="/assets/palworld/enter_password.png" alt="管理员登陆"></div>
<div align="center"><strong>管理员登陆指令</strong></div>  

<div style="height:20px"></div>  <!-- 完美间距 -->

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
<div align="center"><strong>选择加入专用服务器</strong></div>

<div style="height:20px"></div>  <!-- 完美间距 -->

<div align="center"><img src="/assets/palworld/connect2.png" alt="连接服务器"></div>
<div align="center"><strong>输入地址，并点“连接”</strong></div>
<br>

## 4.安装模组

**安装模组请按照以下流程：**  

> 1. 在**[Steam创意工坊](https://steamcommunity.com/app/1623730/workshop/)**上找想要的模组，**复制模组ID（链接里最后的数字）**

> 2. 在**服务器后台[【启动】](/1-serverbasics/){target=_blank}分页**的底部找到变量 **`模组列表`**

> 3. 输入模组ID，用英文逗号 **","** 分隔多个模组ID，**回车后重启服务器**

> 4. 正确的形式应该像这样 ➡ **`3625287786,3625287787,3625287788`**

> 5. 启动服务器会**自动下载并安装模组**，连接就可以在游戏里使用了

<br>
**ℹ️提醒：唯一测试过能工作的是[创造菜单](https://steamcommunity.com/sharedfiles/filedetails/?id=3625287786)（ID：3625287786）**  
**❓更多：其他服务器模组问题，请参考 [官方教程](https://docs.palworldgame.com/settings-and-operation/mod/)**

**⚠️注意：现在大多Mod都不支持在服务器上运行，而不是安装失败。**  
**⚠️注意：绝大多数能工作的Mod，在客户端和服务器都需要安装。**  

<div align="center"><img src="/assets/palworld/pal_mod_0_0.png" alt="Steam创意工坊"></div>
<div align="center"><strong>在<a href="https://steamcommunity.com/app/1623730/workshop/" target="_blank">Steam创意工坊</a>找Mod</strong></div>

<div style="height:20px"></div>  <!-- 完美间距 -->

<div align="center"><img src="/assets/palworld/pal_mod_0_1.png" alt="具体模组页面"></div>
<div align="center"><strong>获取链接里的模组ID</strong></div>  

<div style="height:20px"></div>  <!-- 完美间距 -->

<div align="center"><img src="/assets/palworld/pal_mod_1.png" alt="后台模组列表"></div>
<div align="center"><strong>在后台填写所有模组ID</strong></div>  

## 5.已知BUG
**存档损坏无法修复，请格外注意会丢档的BUG**  
<small>***️⃣无效设置：官方说这个设置没有效果，可能是留着未来用**</small>  

| 已知问题                           | 解决方法 / 当前状态         |
|---------------------------------------------|-----------------------|
| 独立服务器，直接连接无法输入密码              | 已修复    |
| 工会中玩家退出，会导致其他未退出玩家烂档     | 已修复            |
| 独立服务器，无法在游戏列表显示服务器          | 已修复            |
| 营地内的最大Pal数量上限设置无效              | 无效设置*            |
| 无法调整Boss刷新时间，默认为1小时            | 已修复            |
| 内存泄漏，游戏每隔一段时间会爆内存重启   | 已修复       |
| 卡Bug抓高塔Boss可能导致后期烂档              | 已修复          |
| 使用近期连接过的列表加入，会提示创建角色 | 已修复          |
| 各种卡地形，看起来像是服务器卡顿          | 请以Server FPS为准       |


## 6.存档位置
**存档文件位置：`/home/container/Pal` 里的 `Saved` 文件夹**  

- **如果要下载整个存档**，**压缩整个文件夹并下载压缩文件**，见下图：  

<div align="center"><img src="/assets/palworld/pal_backup_1.png" alt="存档文件夹"></div>
<div align="center"><strong>打开<a href="/1-serverbasics/" target="_blank">【备份】</a>分页，创建备份</strong></div>  

<div style="height:20px"></div>  <!-- 完美间距 -->

<div align="center"><img src="/assets/palworld/pal_backup_2.png" alt="压缩存档文件夹"></div>
<div align="center"><strong>可以不输入任何东西，点备份</strong></div>

<div style="height:20px"></div>  <!-- 完美间距 -->

<div align="center"><img src="/assets/palworld/pal_backup_3.png" alt="下载压缩文件"></div>
<div align="center"><strong>点开 ··· 选择下载</strong></div>
<div style="height:10px"></div>

- **如果要重新开始游戏，可以删除整个`Saved`文件夹**  
- **如果想保存设置，但删除存档，可以删除`Saved/SaveGames`文件夹**
<br>

## 7.存档转换
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
