# 七日杀（7 Days to Die）
也许是DayZ之前最经典的丧尸末日生存开放世界，什么？这两年才发售正式版？

---

## 1.推荐配置

- 🪣原版游戏
	- 最低： **✅特惠EPC【4G】**  
	- 推荐： **✅特惠EPC【8G】**  

- 🧩模组游戏：
	- 最低： **⭐至尊R5K【8G】**  
	- 推荐： **⭐至尊R5K【16G】**

## 2.开服教程

### 2.1.基础设置（管理后台）
**后台设置将覆盖文件的设置**，比如服务器端口，难度，玩家数量等。
![后台设置](/assets/7dd/panel.png)
<br>

如果需要上传或者下载存档，**游戏存档文件夹所在位置如下**
![后台设置](/assets/7dd/saves.png)
<br>

### 2.2.高级设置（游戏文件）
服务器配置文件 `serverconfig.xml` 如下，**建议对照以下翻译直接在后台修改文件**：  
**注意：该文件很宽，注释都在右侧**

![配置文件](/assets/7dd/config_file.png)

```
<?xml version="1.0"?>
<ServerSettings>
	<!-- 服务器通用设置 -->

	<!-- 服务器名称 -->
	<property name="ServerName"						value="我的游戏主机"/>		<!-- 你想要的服务器名称。 -->
	<!-- 服务器描述 -->
	<property name="ServerDescription"				value="一个7天之内的服务器"/>	<!-- 你想要的服务器描述，将显示在服务器浏览器中。 -->
	<!-- 服务器网站链接 -->
	<property name="ServerWebsiteURL"				value=""/>					<!-- 服务器的网站链接，在服务器浏览器中将显示为可点击的链接。 -->
	<!-- 服务器密码 -->
	<property name="ServerPassword"					value="123"/>					<!-- 进入服务器所需的密码 -->
	<!-- 进入服务器时的确认文本 -->
	<property name="ServerLoginConfirmationText"	value="" />					<!-- 如果设置，玩家在加入服务器时将看到此消息，并必须确认后才能继续。对于对此窗口进行更复杂更改，你可以修改XUi中的“serverjoinrulesdialog”窗口 -->
	<!-- 服务器所在地区 -->
	<property name="Region"							value="NorthAmericaEast" />	<!-- 该服务器所在地区。值：NorthAmericaEast, NorthAmericaWest, CentralAmerica, SouthAmerica, Europe, Russia, Asia, MiddleEast, Africa, Oceania -->
	<!-- 服务器语言 -->
	<property name="Language"						value="English" />			<!-- 玩家在此服务器上使用的主要语言。值：使用玩家预期搜索的任何语言名称。应该是该语言的英文名称，例如不是“Deutsch”而是“German”。 -->

	<!-- 网络设置 -->
	<!-- 服务器监听端口 -->
	<property name="ServerPort"						value="26900"/>				<!-- 你想要服务器监听的端口。保持在26900到26905或27015到27020范围内，以便局域网上的PC可以将其视为LAN服务器。 -->
	<!-- 服务器可见性 -->
	<property name="ServerVisibility"				value="2"/>					<!-- 服务器的可见性：2 = 公共，1 = 仅对好友可见，0 = 不列出。由于独立服务器不会成为玩家的好友，将此设置为“1”仅在第一个玩家通过IP手动连接时才有效。 -->
	<!-- 禁用的网络协议 -->
	<property name="ServerDisabledNetworkProtocols"	value="SteamNetworking"/>	<!-- 不应使用的网络协议，用逗号分隔。可能的值：LiteNetLib, SteamNetworking。如果独立服务器用户和服务器之间没有NAT路由器，或者端口转发已正确设置，独立服务器应禁用SteamNetworking -->
	<!-- 最大世界传输速度 -->
	<property name="ServerMaxWorldTransferSpeedKiBs" value="512"/>				<!-- 第一次连接时，世界传输到客户端的最大速度（以kiB/s为单位），如果客户端还没有世界。最大速度约为1300 kiB/s，即使设置更高的值也是如此。 -->

	<!-- 插槽设置 -->
	<!-- 最大玩家数量 -->
	<property name="ServerMaxPlayerCount"			value="8"/>					<!-- 最大同时在线玩家数 -->
	<!-- 保留的插槽数量 -->
	<property name="ServerReservedSlots"			value="0"/>					<!-- 最大玩家数中的这么多插槽只能由具有特定权限级别的玩家使用 -->
	<!-- 保留插槽所需的权限级别 -->
	<property name="ServerReservedSlotsPermission"	value="100"/>				<!-- 使用保留插槽所需的权限级别 -->
	<!-- 管理员插槽数量 -->
	<property name="ServerAdminSlots"				value="0"/>					<!-- 即使服务器已达到最大玩家数，仍可加入的管理员数量 -->
	<!-- 管理员插槽所需的权限级别 -->
	<property name="ServerAdminSlotsPermission"		value="0"/>					<!-- 使用管理员插槽所需的权限级别 -->

	<!-- 管理界面设置 -->
	<!-- 启用/禁用Web仪表板 -->
	<property name="WebDashboardEnabled"			value="false"/>				<!-- 启用/禁用Web仪表板 -->
	<!-- Web仪表板端口 -->
	<property name="WebDashboardPort"				value="8080"/>				<!-- Web仪表板的端口 -->
	<!-- Web仪表板URL -->
	<property name="WebDashboardUrl"				value=""/>					<!-- Web仪表板的外部URL，如果Web仪表板位于反向代理后面，则需要提供完整的URL，例如"https://domainOfReverseProxy.tld:1234/"。如果直接使用公共IP和仪表板端口，则可以将其留空 -->
	<!-- 启用/禁用地图渲染 -->
	<property name="EnableMapRendering"				value="false"/>				<!-- 启用/禁用在探索地图时渲染地图为瓷块图像。Web仪表板用于显示地图的视图时会使用此功能。 -->

	<!-- Telnet设置 -->
	<!-- 启用/禁用Telnet -->
	<property name="TelnetEnabled"					value="true"/>				<!-- 启用/禁用Telnet -->
	<!-- Telnet端口 -->
	<property name="TelnetPort"						value="8081"/>				<!-- Telnet服务器的端口 -->
	<!-- Telnet密码 -->
	<property name="TelnetPassword"					value=""/>					<!-- 进入Telnet界面所需的密码。如果没有设置密码，服务器只会在本地回环接口上监听 -->
	<!-- Telnet失败登录限制 -->
	<property name="TelnetFailedLoginLimit"			value="10"/>				<!-- 来自单个远程客户端的密码错误次数达到此值后，将阻止该客户端连接到Telnet界面 -->
	<!-- Telnet失败登录阻止时间 -->
	<property name="TelnetFailedLoginsBlocktime"	value="10"/>				<!-- 阻止将持续的时间（以秒为单位） -->

	<!-- 终端窗口设置 -->
	<property name="TerminalWindowEnabled"			value="true"/>				<!-- 显示用于日志输出/命令输入的终端窗口（仅适用于Windows） -->

	<!-- 文件夹和文件位置设置 -->
	<!-- 服务器管理员文件名 -->
	<property name="AdminFileName"					value="serveradmin.xml"/>	<!-- 服务器管理员文件名。相对于SaveGameFolder的路径 -->
	<!-- 用户数据文件夹路径 -->
	<!-- <property name="UserDataFolder"				value="绝对路径" /> -->	<!-- 使用此选项来覆盖服务器存储的所有生成的数据，包括RWG生成的世界。不要忘记取消注释该条目！ -->
	<!-- 存档文件夹路径 -->
	<!-- <property name="SaveGameFolder"				value="绝对路径" /> -->	<!-- 使用此选项只覆盖保存游戏路径。不要忘记取消注释该条目！ -->

	<!-- 其他技术设置 -->
	<!-- 启用/禁用EasyAntiCheat -->
	<property name="EACEnabled"						value="true"/>				<!-- 启用/禁用EasyAntiCheat -->
	<!-- 隐藏命令执行日志 -->
	<property name="HideCommandExecutionLog"		value="0"/>					<!-- 隐藏命令执行的日志。0 = 显示所有，1 = 仅从Telnet/ControlPanel隐藏，2 = 也从远程游戏客户端隐藏，3 = 隐藏所有 -->
	<!-- 每个玩家可开启的地图块数上限 -->
	<property name="MaxUncoveredMapChunksPerPlayer"	value="131072"/>			<!-- 覆盖每个玩家在游戏地图上可以揭示的块数上限。结果的最大地图文件大小限制为（x * 512字节），揭示的区域为（x * 256平方米）。默认值131072表示最多可以同时揭示32平方公里的区域 -->
	<!-- 持久玩家配置文件 -->
	<property name="PersistentPlayerProfiles"		value="false" />			<!-- 如果禁用，则玩家可以使用任何选定的配置文件加入。如果启用，他们将使用他们上次加入时选择的配置文件 -->

	<!-- 游戏设置 -->
	
	<!-- 世界设置 -->
	<!-- 游戏世界 -->
	<property name="GameWorld"						value="Navezgane"/>			<!-- "RWG"（见下面的WorldGenSeed和WorldGenSize选项）或已存在的世界名称，位于Worlds文件夹中（当前提供的有"Navezgane"、"PREGEN01"等） -->
	<!-- 世界生成种子 -->
	<property name="WorldGenSeed"					value="asdf"/>				<!-- 如果是RWG，则这是生成新世界的种子。如果已经存在具有相同名称的世界，则将加载它 -->
	<!-- 世界生成大小 -->
	<property name="WorldGenSize"					value="6144"/>				<!-- 如果是RWG，这控制创建的世界的宽度和高度。官方支持的尺寸在6144到10240之间，必须是2048的倍数，例如6144、8192、10240。 --> 
	<!-- 游戏名称 -->
	<property name="GameName"						value="我的游戏"/>			<!-- 你想要的游戏名称。这影响保存游戏名称以及放置装饰物（树等）在世界中使用的种子。它不控制创建RWG世界的通用布局 -->
	<!-- 游戏模式 -->
	<property name="GameMode"						value="GameModeSurvival"/>	<!-- 游戏模式：GameModeSurvival -->

	<!-- 难度设置 -->
	<!-- 游戏难度 -->
	<property name="GameDifficulty"					value="1"/>					<!-- 0 - 5，0=最容易，5=最难 -->
	<!-- 玩家对方块造成的伤害 -->
	<property name="BlockDamagePlayer"				value="100" />				<!-- 玩家对方块造成的伤害（以整数百分比表示） -->
	<!-- AI对方块造成的伤害 -->
	<property name="BlockDamageAI"					value="100" />				<!-- AI对方块造成的伤害（以整数百分比表示） -->
	<!-- 血月期间AI对方块造成的伤害 -->
	<property name="BlockDamageAIBM"				value="100" />				<!-- 血月期间AI对方块造成的伤害（以整数百分比表示） -->
	<!-- 经验值倍率 -->
	<property name="XPMultiplier"					value="500" />				<!-- 经验值获取倍率（以整数百分比表示） -->
	<!-- 玩家安全区级别 -->
	<property name="PlayerSafeZoneLevel"			value="5" />				<!-- 如果玩家等级小于或等于此级别，他将在生成时创建一个安全区域（没有敌人） -->
	<!-- 安全区存在的游戏时间小时数 -->
	<property name="PlayerSafeZoneHours"			value="5" />				<!-- 安全区存在的游戏时间小时数 -->

	<!-- 建筑模式设置 -->
	<!-- 作弊模式开关 -->
	<property name="BuildCreate"					value="false" />			<!-- 作弊模式开关 -->
	<!-- 白天和夜晚的长度 -->
	<property name="DayNightLength"					value="120" />				<!-- 游戏内一天的实际分钟数：60分钟 -->
<!-- 夜晚日照时长 -->
	<property name="DayLightLength"					value="18" />				<!-- 游戏中每天阳光照射的小时数：游戏内每天18小时日光 -->
	<!-- 死亡惩罚 -->
	<property name="DeathPenalty"					value="0" />				<!-- 死亡后的惩罚。0 = 无惩罚。1 = 默认：经典经验值惩罚。2 = 受伤：你保留大部分负面效果。食物和水在重生时设置为50%。3 = 永久死亡：你的角色将被完全重置。你将在保存的游戏中以全新的开始重生。 -->
	<!-- 死亡时掉落物品 -->
	<property name="DropOnDeath"					value="3" />				<!-- 0 = 无掉落，1 = 掉落所有物品，2 = 仅掉落工具栏，3 = 仅掉落背包，4 = 删除所有物品 -->
	<!-- 退出游戏时掉落物品 -->
	<property name="DropOnQuit"						value="0" />				<!-- 0 = 无掉落，1 = 掉落所有物品，2 = 仅掉落工具栏，3 = 仅掉落背包 -->
	<!-- 床垫无僵尸区域大小 -->
	<property name="BedrollDeadZoneSize"			value="15" />				<!-- 床垫无僵尸区域的大小（盒子“半径”，因此是一个各边长为给定值两倍的盒子）。此区域内不会生成僵尸，且任何接触床垫无僵尸区域的清除睡眠体积在被清除后不会再生成。 -->
	<!-- 床垫有效时间 -->
	<property name="BedrollExpiryTime"				value="45" />				<!-- 玩家最后一次在线后，床垫保持活跃的现实世界天数 -->

	<!-- 性能相关 -->
	<!-- 最大生成僵尸数 -->
	<property name="MaxSpawnedZombies"				value="128" />				<!-- 此设置涵盖整个地图。整个地图上同时只能有这么多僵尸。更改此设置对性能有巨大影响。 -->
	<!-- 最大生成动物数 -->
	<property name="MaxSpawnedAnimals"				value="100" />				<!-- 如果你的服务器有大量玩家，你可以增加此限制以增加更多野生动物。动物的CPU消耗比僵尸少。注意：这并不会导致更多动物任意生成：生物群落生成系统只在给定区域内生成一定数量的动物，但如果你有很多玩家分散开来，你可能会达到限制，可以增加它。 -->
	<!-- 服务器允许的最大视距 -->
	<property name="ServerMaxAllowedViewDistance"	value="12" />				<!-- 客户端可能请求的最大视距（6 - 12）。对内存使用和性能影响很大。 -->
	<!-- 最大排队网格层 -->
	<property name="MaxQueuedMeshLayers"			value="1000" />			<!-- 在网格生成期间可以排队的最大块网格层数。降低此值将改善内存使用，但可能增加块生成时间 -->

	<!-- 僵尸设置 -->
	<!-- 敌人生成模式 -->
	<property name="EnemySpawnMode"					value="true" />				<!-- 启用/禁用敌人生成 -->
	<!-- 敌人难度 -->
	<property name="EnemyDifficulty"				value="0" />				<!-- 0 = 正常，1 = 狂野 -->
	<!-- 僵尸夜间感知 -->
	<property name="ZombieFeralSense"				value="0" />				<!-- 0-3 (关闭，白天，夜间，全时段) -->
	<!-- 僵尸移动模式 -->
	<property name="ZombieMove"						value="0" />				<!-- 0-4 (行走，慢跑，跑步，疾跑，噩梦) -->
	<!-- 僵尸夜间移动模式 -->
	<property name="ZombieMoveNight"				value="2" />				<!-- 0-4 (行走，慢跑，跑步，疾跑，噩梦) -->
	<!-- 狂野僵尸移动模式 -->
	<property name="ZombieFeralMove"				value="2" />				<!-- 0-4 (行走，慢跑，跑步，疾跑，噩梦) -->
	<!-- 血月僵尸移动模式 -->
	<property name="ZombieBMMove"					value="3" />				<!-- 0-4 (行走，慢跑，跑步，疾跑，噩梦) -->
	<!-- 血月频率 -->
	<property name="BloodMoonFrequency"				value="7" />				<!-- 血月发生的频率（以天数计）。设置为“0”表示无血月 -->
	<!-- 血月范围 -->
	<property name="BloodMoonRange"					value="0" />				<!-- 实际血月日与上述设置相比可以随机偏差的天数。将此设置为0使血月精确每N天发生一次，如BloodMoonFrequency所指定 -->
	<!-- 血月预警 -->
	<property name="BloodMoonWarning"				value="8" />				<!-- 在血月日，红色日期数字开始显示的小时数。将此设置为-1使红色永远不显示。 -->
	<!-- 血月敌人数量 -->
	<property name="BloodMoonEnemyCount"			value="16" />				<!-- 血月群战期间，每个玩家同时可以存活（生成）的僵尸数量，然而，在多人游戏中，MaxSpawnedZombies会覆盖此数字。另请注意，你的游戏阶段设置了每个队伍的最大僵尸数量。低游戏阶段值可能导致比BloodMoonEnemyCount设置更低的僵尸数量。更改此设置对性能有巨大影响。 -->

	<!-- 战利品设置 -->
	<!-- 战利品丰富度 -->
	<property name="LootAbundance"					value="100" />				<!-- 以整数百分比表示 -->
	<!-- 战利品重生天数 -->
	<property name="LootRespawnDays"				value="3" />				<!-- 以整天数表示 -->
	<!-- 空投频率 -->
	<property name="AirDropFrequency"				value="72"/>				<!-- 空投发生的游戏小时数，0 == 从不 -->
	<!-- 空投标记 -->
	<property name="AirDropMarker"					value="true"/>				<!-- 设置是否在地图/指南针上为空投添加标记。 -->

	<!-- 多人游戏设置 -->
	<!-- 队伍共享击杀范围 -->
	<property name="PartySharedKillRange"			value="10000"/>				<!-- 你必须在此范围内才能获得队伍共享击杀经验和任务队伍击杀目标完成度。 -->
	<!-- 玩家杀戮模式 -->
	<property name="PlayerKillingMode"				value="2" />				<!-- 玩家杀戮设置（0 = 无杀戮，1 = 仅杀盟友，2 = 仅杀陌生人，3 = 杀戮所有人） -->

    <!-- 土地所有权选项 -->
    <property name="LandClaimCount"					value="3"/>					<!-- 每位玩家允许的最大土地所有权数量。 -->
    <property name="LandClaimSize"					value="41"/>				<!-- 由基石保护的区域大小（以方块计算）。 -->
    <property name="LandClaimDeadZone"				value="30"/>				<!-- 基石之间必须保持这么多方块的间隔（除非你和另一位玩家是朋友）。 -->
    <property name="LandClaimExpiryTime"			value="7"/>					<!-- 玩家离线之后，其土地所有权在失效并不再受保护前可以有多少天的真实世界天数。 -->
    <property name="LandClaimDecayMode"				value="0"/>					<!-- 控制离线玩家土地所有权的衰退方式。0=慢速（线性），1=快速（指数级），2=无（直到所有权过期都完全保护）。 -->
    <property name="LandClaimOnlineDurabilityModifier"	value="4"/>				<!-- 当玩家在线时，受保护的区域内方块硬度增加的倍数。0表示无限（永远不会受到伤害）。默认为4倍 -->
    <property name="LandClaimOfflineDurabilityModifier"	value="4"/>				<!-- 当玩家离线时，受保护的区域内方块硬度增加的倍数。0表示无限（永远不会受到伤害）。默认为4倍 -->
    <property name="LandClaimOfflineDelay"			value="0"/>					<!-- 玩家登出后，土地所有权区域的硬度从在线转变为离线所需的分钟数。默认为0 -->

    <property name="DynamicMeshEnabled"				value="true"/>				<!-- 动态网格系统是否启用 -->
    <property name="DynamicMeshLandClaimOnly"		value="true"/>				<!-- 动态网格系统是否仅在玩家LCB区域内活跃 -->
    <property name="DynamicMeshLandClaimBuffer"		value="3"/>					<!-- 动态网格LCB块半径 -->
    <property name="DynamicMeshMaxItemCache"		value="3"/>					<!-- 同时能处理的物品数量，数值越高使用的RAM越多 -->

    <property name="TwitchServerPermission"			value="90"/>				<!-- 使用服务器上Twitch集成所需的权限等级 -->
    <property name="TwitchBloodMoonAllowed"			value="false"/>				<!-- 服务器是否允许在血月期间进行Twitch操作。这可能会在血月期间生成额外僵尸时导致服务器延迟。 -->

    <property name="MaxChunkAge"					value="-1"/>				<!-- 自访问某个块以来必须经过的游戏内天数，以便在未重新访问或未受保护时（例如，通过土地所有权或床垫接近）重置其原始状态。 -->
    <property name="SaveDataLimit"					value="-1"/>				<!-- 每个保存游戏允许的最大磁盘空间，以兆字节（MB）为单位。当达到此限制时，已保存的块可能会被强制重置为其原始状态。负数值禁用限制。 -->

    <!-- 有几个游戏设置在开始新游戏时无法更改。
    您可以使用控制台命令在游戏中至少更改其中的一些。
    setgamepref BedrollDeadZoneSize 30 -->
</ServerSettings>
```

### 2.3.服务器常用命令（后台）
| 命令                     | 描述                                                   |
|--------------------------|--------------------------------------------------------|
| kick <名字/实体ID/Steam ID> [原因] | 踢出游戏中指定的玩家。可选提供原因。                    |
| kickall [原因]               | 踢出游戏中的所有玩家。可选提供原因。                   |
| ban add <名字/实体ID/Steam ID> <持续时间> <分钟/小时/天/周/月/年> [原因] | 将玩家添加到封禁列表，指定封禁持续时间。原因是可选的。       |
| ban remove <名字/实体ID/Steam ID> | 从封禁列表中移除玩家。                                     |
| ban list                  | 显示所有被封禁玩家的列表，包括封禁持续时间、ID和封禁原因。    |
| admin add <名字/实体ID/Steam ID> <权限级别> | 将玩家添加到管理员列表，并分配特定的权限级别。可以使用实体ID、玩家名字或Steam ID。权限级别从0（完全权限）到1000（无权限）。 |
| admin remove <名字/实体ID/Steam ID> | 从管理员列表中移除指定玩家。                                |
| whitelist add <名字/实体ID/Steam ID> | 将玩家添加到游戏白名单中。                               |
| whitelist remove <名字/实体ID/Steam ID> | 从游戏白名单中移除玩家。                                |
| whitelist list            | 提供当前所有在游戏白名单中的玩家列表。                  |

### 2.4.游戏Debug菜单（创造模式）
**有管理员权限情况下**，游戏内按F1打开游戏命令行，输入cm打开创造模式，输入dm开启Debug模式。
- 创造模式会在菜单U里面提供创意选项卡，可以直接拿出物品。
- Debug模式会在Esc退出窗口提供，飞行，瞬移，隐身等功能。

**视频教程**  
个人推荐，内容比较全。
<iframe width="100%" height="360" src="https://www.youtube.com/embed/Lm0PiRig9qU" title="7 Days to Die Tutorial - Debug Menu | God Mode | Command Console | Dev Tools | Teleport Guide How To" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>