# 手册知识库 · 供自动回复机器人使用

> 本文件是菜菜云 MLSG 教程站（<https://manual.mr-leaves.com/>）的**页面清单 + 关键词映射表**，供另一个 Agent 读取后实现「用户提问 → 命中教程链接」的自动回复。
> 数据来源于仓库 `docs/` 的真实页面结构与构建产物中的真实锚点，**锚点 id 已逐页核对，可直接拼接成链接**。
> 本文件放在仓库根目录，不参与 MkDocs 构建，不会被发布到站点。
> **配套文件**：`FAQ-ANSWERS.md`（带现成答案的问答库，按「通用 / 我的世界 / 饥荒 / 帕鲁 / 其他游戏」分节，每条含关键词与链接）。本文件负责「去哪看」，它负责「直接怎么答」。

---

## 0. 使用规则（读我）

### 0.1 URL 规则

| 源文件 | 线上 URL |
|---|---|
| `docs/index.md` | `https://manual.mr-leaves.com/` |
| `docs/1-serverbasics.md` | `https://manual.mr-leaves.com/1-serverbasics/` |
| `docs/3-servergames/minecraft.md` | `https://manual.mr-leaves.com/3-servergames/minecraft/` |
| `docs/2-serveradvanced/index.md` | `https://manual.mr-leaves.com/2-serveradvanced/` |
| `docs/tools/*.html` | `https://manual.mr-leaves.com/tools/<文件名>.html` |

- 站点根：`https://manual.mr-leaves.com/`
- 锚点直接拼在页末：`…/3-servergames/minecraft/#38guochan`
- 锚点 id 由**标题文字**生成（中文标题会被压缩成本拼音/数字，如 `### 3.8.GuoChan（国产包）` → `#38guochan`）。**改标题会改锚点**，链接必须取自本文件 `§3` 的锚点表，不要自己推。
- 站点有 `sitemap.xml`、站点内搜索（Material `search` 插件），可作为兜底检索入口。

### 0.2 匹配优先级（多对 1 的实现建议）

1. 同一 target 有多个关键词（含同义词、口语说法、错别字、英文名、缩写）→ **多对 1**，全部映射到同一个 URL。
2. 一个提问同时命中多个 target 时，按此顺序取：**更具体的锚点级 target > 整页 target > FAQ target > 索引页**。
3. 游戏名 + 操作词（如「饥荒 重置世界」）→ 优先命中该游戏页的**锚点级** target，不要只给整页。
4. 通用后台操作词（上传/备份/端口/重启/权限…）先命中 `1-serverbasics` 的对应小节；若是「传不上去 / 大文件」再升级到 `2-serveradvanced/filetransfer`。
5. **未命中任何 target**：不要编造答案，回复固定话术 + 兜底链接（见 `§4`）。
6. 回复必须**带完整 URL**（用户点开就是教程），不要只描述文字。

### 0.3 页面状态字段

- `ready`：内容完整、可放心引用。
- `partial`：有真实内容，但只覆盖部分操作，回复时说明「教程覆盖了 X，其余建议联系客服」。
- `template`：**占位模板页**（章节是通用建议、结尾有「后续可补充内容」），回复时**不要引用其具体参数**，只说「该游戏教程整理中」并给兜底链接。

---

## 1. 页面清单

| 源文件 | URL | 内容 | 状态 |
|---|---|---|---|
| `docs/index.md` | `/` | 手册简介、各模块入口、来源声明、客服渠道 | ready |
| `docs/about.md` | `/about/` | 手册简介、MLSG 公司背景、联系方式 | ready |
| `docs/contact.md` | `/contact/` | 4 种客服渠道（工单 / 微信 / 淘宝 / Discord）与回复时效 | ready |
| `docs/faq.md` | `/faq/` | 5 类高频问题（大文件、重生成世界、切游戏、性能崩溃、无法启动） | ready |
| `docs/1-serverbasics.md` | `/1-serverbasics/` | 后台基本操作：仪表盘 + 左侧 9 个功能页逐个说明 | ready |
| `docs/2-serveradvanced/index.md` | `/2-serveradvanced/` | 进阶操作索引 + 翼龙官方文档 | ready |
| `docs/2-serveradvanced/upgrade.md` | `/2-serveradvanced/upgrade/` | 配置升级：官网自助按天补差 / 客服人工按整月补差 | ready |
| `docs/2-serveradvanced/subuser.md` | `/2-serveradvanced/subuser/` | 邀请子用户、分配权限、子用户登录 | ready |
| `docs/2-serveradvanced/reinstall.md` | `/2-serveradvanced/reinstall/` | 重装服务器 4 步（关机→删文件→重装→等邮件） | ready |
| `docs/2-serveradvanced/plan.md` | `/2-serveradvanced/plan/` | 创建计划任务、触发时间、任务偏移 | ready |
| `docs/2-serveradvanced/filetransfer.md` | `/2-serveradvanced/filetransfer/` | SFTP / FileZilla 传大文件与文件夹 | ready |
| `docs/2-serveradvanced/steamcheck.md` | `/2-serveradvanced/steamcheck/` | Steam 服务器是否公开的 curl 自查 | ready |
| `docs/3-servergames/index.md` | `/3-servergames/` | 游戏索引、配置选择器、更多教程 | ready |
| `docs/3-servergames/minecraft.md` | `/3-servergames/minecraft/` | MC 全流程：一键安装、6 种核心分支、模组、指令权限、properties、版本查询 | ready |
| `docs/3-servergames/palworld.md` | `/3-servergames/palworld/` | 帕鲁：参数、管理指令、加入游戏、模组、已知BUG、存档位置与转换 | ready |
| `docs/3-servergames/dontstarve.md` | `/3-servergames/dontstarve/` | 饥荒：Token、世界设置、模组安装/管理、手动方案、重置世界、作弊指令 | ready |
| `docs/3-servergames/dayz.md` | `/3-servergames/dayz/` | DayZ：游戏参数、参数说明表、启动器导出模组、管理指令、备份、排错 | ready |
| `docs/3-servergames/pz.md` | `/3-servergames/pz/` | 僵尸毁灭工程：订阅模组、生成/上传配置、世界参数、管理员 | partial |
| `docs/3-servergames/rust.md` | `/3-servergames/rust/` | Rust：4 端口、插件(oxide/umod)、权限命令、管理员、存档写入 | partial |
| `docs/3-servergames/7dtd.md` | `/3-servergames/7dtd/` | 七日杀：后台基础设置、serverconfig.xml、后台命令、Debug/创造模式 | partial |
| `docs/3-servergames/ark.md` | `/3-servergames/ark/` | 方舟：GameUserSettings.ini、多通用 ARK Server Manager、rcon 正常关机 | partial |
| `docs/3-servergames/cs.md` | `/3-servergames/cs/` | CS2/CSGO：GSLT 令牌、WAPI、地图、创意工坊、游戏模式、进服 | partial |
| `docs/3-servergames/valheim.md` | `/3-servergames/valheim/` | 英灵神殿：内存需求、开服填写项、Thunderstore 模组管理 | partial |
| `docs/3-servergames/sof.md` | `/3-servergames/sof/` | 森林之子：serverconfig、ownerswhitelist（SteamID）、端口 | partial |
| `docs/3-servergames/ror2.md` | `/3-servergames/ror2/` | 雨中冒险2：server.cfg 端口、sv_custom_tags | partial |
| `docs/3-servergames/humanitz.md` | `/3-servergames/humanitz/` | 人性末日：通用开服骨架 | template |
| `docs/3-servergames/conan.md` | `/3-servergames/conan/` | 流放者柯南：通用开服骨架 | template |
| `docs/3-servergames/factorio.md` | `/3-servergames/factorio/` | 异星工场：通用开服骨架 | template |
| `docs/3-servergames/abioticfactor.md` | `/3-servergames/abioticfactor/` | 非生物因素：通用开服骨架 | template |
| `docs/3-servergames/satisfactory.md` | `/3-servergames/satisfactory/` | 幸福工厂：通用开服骨架 | template |
| `docs/3-servergames/amongus.md` | `/3-servergames/amongus/` | 太空狼人杀：通用开服骨架 | template |
| `docs/3-servergames/arma3.md` | `/3-servergames/arma3/` | 武装突袭3：通用开服骨架 | template |
| `docs/3-servergames/scpsl.md` | `/3-servergames/scpsl/` | SCP:SL：通用开服骨架 | template |
| `docs/3-servergames/squad.md` | `/3-servergames/squad/` | 战术小队：通用开服骨架 | template |
| `docs/3-servergames/vrising.md` | `/3-servergames/vrising/` | 夜族崛起：通用开服骨架 | template |

### 工具页（纯静态单文件，可深链）

| URL | 用途 |
|---|---|
| `/tools/quick_server_selector.html` | 配置推荐器：按人数/玩法推荐 CPU/内存 |
| `/tools/fast_version_search.html` | 快速版本查询（MC 手动指定版本时用；一键安装已内置版本列表） |
| `/tools/guochan_metadata.html` | 国产整合包列表与元数据 |
| `/tools/dst_mod_setup.html` | 饥荒 MOD 下载配置生成器（生成 `dedicated_server_mods_setup.lua`） |
| `/tools/dst_mod_edit.html` | 饥荒 Mod 配置编辑器（可视化改 `modoverrides.lua`） |

### 站外固定出口

| 目标 | URL | 适用 |
|---|---|---|
| 官网下单 / 续费 / 账户 | `https://mlsg.mr-leaves.com` | 购买、续费、升级、发票、工单 |
| 提交工单 | `https://mlsg.mr-leaves.com/store/submitticket.php` | 需人工处理、最长 48h |
| 管理后台 | `https://panel.mr-leaves.com` | 登录面板、开服操作 |
| 淘宝店铺 | `https://caiyezi.world.taobao.com` | 淘宝购买的订单相关 |
| Discord | `https://discord.gg/8Zs5m9v6` | 玩家互助、开服交流 |

---

## 2. 关键词映射表（多对 1）

约定：一行 = 一个 target；`关键词` 列内用 `、` 分隔，命中任意一个即映射到该 `URL`；`#` 开头为锚点深链。
关键词里保留**口语说法、简称、英文名、常见错写**，便于模糊命中。

### 2.1 后台基本操作（`/1-serverbasics/`）

| URL | 内容 | 关键词（多对 1） |
|---|---|---|
| `/1-serverbasics/` | 后台基本操作总页 | 后台, 面板, 管理后台, 后台怎么用, 基本操作, 新手, 教程入口, 操作页面, 左侧菜单, 导航 |
| `/1-serverbasics/#1` | 仪表盘：服务器列表 | 仪表盘, 服务器列表, 我的服务器, 找不到我的服务器, 服务器卡片, 进入服务器, 服务器没出现 |
| `/1-serverbasics/#21` | 控制台：开关机/日志/命令 | 控制台, 开机, 关机, 启动服务器, 停止服务器, 重启服务器, 重启, 实时日志, 看日志, 在线人数, CPU占用, 内存占用, 服务器卡 |
| `/1-serverbasics/#22` | 游戏参数：启动命令与变量 | 游戏参数, 变量, 环境变量, 启动命令, 改启动参数, 变量怎么改, 参数说明, 变量图标, 改人数上限, 改服务器名, 改端口参数, 变量被一键安装改写了, 参数被覆盖, 一键安装后参数变了 |
| `/1-serverbasics/#23` | 文件管理：在线浏览/上传/编辑 | 文件管理, 上传文件, 在线编辑, 改配置文件, 文件管理器, 编辑文件, 上传不了, 文件太大, 100M, 上传数量限制 |
| `/1-serverbasics/#24` | 数据备份：创建/还原 | 数据备份, 备份, 创建备份, 还原备份, 恢复备份, 回档, 存档备份, 备份在哪里, 备份要关机吗 |
| `/1-serverbasics/#25` | 网络端口：查看可用端口 | 网络端口, 端口, 端口怎么看, 主端口, 连接端口, 查询端口, 端口被占用, 加端口, 端口不够 |
| `/1-serverbasics/#26` | 计划任务：定时指令/备份/重启 | 计划任务, 定时任务, 定时重启, 每天重启, 自动备份, 定时执行命令, 定时关服 |
| `/1-serverbasics/#27` | 高级设置：SFTP 信息、重装入口 | 高级设置, SFTP信息, SFTP地址, 重装按钮, 重新安装服务器, 设置页面, 端口分配, 改服务器配置 |
| `/1-serverbasics/#28` | 邀请用户：多人共同管理 | 邀请用户, 邀请子用户, 子用户, 加管理员, 给朋友权限, 多人管理, 一起管理, 子账号, 邀请邮件, 2FA, 双重验证 |
| `/1-serverbasics/#29` | 操作记录：谁做了什么 | 操作记录, 活动日志, 谁改的, 谁重启的, 操作历史, 查记录 |
| `/1-serverbasics/#210` | 系统日志：安装/启动/关机/模组日志 | 系统日志, 安装日志, 启动日志, 关机日志, 模组日志, 开服失败, 启动失败看日志, 模组下载失败, 报错日志, 日志在哪 |

### 2.2 进阶操作（`/2-serveradvanced/`）

| URL | 内容 | 关键词（多对 1） |
|---|---|---|
| `/2-serveradvanced/` | 进阶操作索引 | 进阶操作, 进阶功能, 高级功能, 高级教程, Debug, 管理员教程 |
| `/2-serveradvanced/upgrade/#_2` | 官网自助升级（按天补差） | 升级配置, 配置升级, 加内存, 加CPU, 扩容, 升配, 补差价, 按天补, 官网升级, 自助升级, 升级要多久, 升级会掉存档吗, 到期日不变 |
| `/2-serveradvanced/upgrade/#i` | 客服人工升级（按整月补差） | 客服升级, 人工升级, 找客服升级配置, 按月份补差价, 整月补差, 人工补差价, 为什么要补一个月 |
| `/2-serveradvanced/subuser/` | 邀请子用户总页 | 子用户教程, 邀请子用户教程, 权限分配, 协作者 |
| `/2-serveradvanced/subuser/#1` | 打开邀请用户界面 | 邀请用户在哪, 子用户在哪, 邀请入口 |
| `/2-serveradvanced/subuser/#2` | 邀请并填权限 | 邀请填权限, 子用户权限, 给什么权限, 邀请失败, 收不到邀请 |
| `/2-serveradvanced/subuser/#3` | 子用户登录后台 | 子用户登录, 子账号登录, 子用户进不去, 设置密码, 邮件链接 |
| `/2-serveradvanced/reinstall/` | 重装服务器总页 | 重装, 重装服务器, 重新安装, 重置服务器, 清空重装, 换版本重装, 装坏了, 安装卡住 |
| `/2-serveradvanced/reinstall/#1` | 关闭服务器 | 重装前要关机吗, 重装先关服 |
| `/2-serveradvanced/reinstall/#2` | 删除所有文件 | 重装删数据吗, 安装脚本会删文件吗, 重装前备份, 存档会没吗 |
| `/2-serveradvanced/reinstall/#3` | 重新安装按钮 | 重新安装按钮, 重装按钮在哪 |
| `/2-serveradvanced/reinstall/#4` | 等待安装完成 | 安装要多久, 安装完成邮件, 装完没反应 |
| `/2-serveradvanced/plan/` | 创建计划任务 | 计划任务怎么建, 创建计划, 定时任务教程 |
| `/2-serveradvanced/plan/#2` | 触发时间 | 触发时间, cron表达式, 时间规律, 时间不要设太近 |
| `/2-serveradvanced/plan/#3` | 添加任务与偏移 | 任务偏移, 时间偏移, 任务顺序, 多个任务 |
| `/2-serveradvanced/filetransfer/` | SFTP 传大文件 | SFTP, sftp怎么用, FileZilla, filezilla下载, 大文件, 传大文件, 上传大文件, 传文件夹, 文件夹传不上去, 超过100M, 批量上传, SFTP连不上 |
| `/2-serveradvanced/filetransfer/#1filezilla` | 下载安装 FileZilla | FileZilla安装, filezilla官网 |
| `/2-serveradvanced/filetransfer/#2` | 后台找连接信息 | SFTP账号密码, SFTP端口, 连接信息在哪 |
| `/2-serveradvanced/filetransfer/#3` | 连接并拖拽传输 | FileZilla连接, 拖拽上传, 传不上去怎么办 |
| `/2-serveradvanced/steamcheck/` | Steam 公开检查 | Steam公开检查, 服务器公开了吗, 查服务器是否公开, 服务器列表搜不到, curl检查, 端口有没有通 |
| `/2-serveradvanced/steamcheck/#1curl` | 用在线 curl | 在线curl, reqbin |
| `/2-serveradvanced/steamcheck/#2ip` | 确认服务器 IP | 服务器IP, 域名解析IP, dnschecker |
| `/2-serveradvanced/steamcheck/#4` | 看返回结果 | 返回结果怎么看, 查询不到结果 |

### 2.3 游戏教程（`/3-servergames/`）

| URL | 内容 | 关键词（多对 1） |
|---|---|---|
| `/3-servergames/` | 游戏索引 | 游戏教程, 有哪些游戏, 支持什么游戏, 游戏列表, 能开什么服, 配置推荐, 选配置, 推荐配置工具 |
| `/3-servergames/minecraft/` | 我的世界总页 | 我的世界, minecraft, MC, mc开服, 开MC服务器, 我的世界开服教程, MC服, 服务器类型, 后台简介 |
| `/3-servergames/minecraft/#31` | 一键安装（推荐） | 一键安装, MC一键安装, 装核心, 装整合包, 安装核心, 版本选择, 核心快切 |
| `/3-servergames/minecraft/#32java` | Java 版本 | java版本, jdk版本, java选哪个, java21, java17, 版本不兼容java |
| `/3-servergames/minecraft/#33vanilla` | Vanilla 原版 | vanilla, 原版, 原版服务器, 原版优化 |
| `/3-servergames/minecraft/#34paper` | Paper 插件服 | paper, papermc, 插件服, 装插件, spigot, bukkit |
| `/3-servergames/minecraft/#35neoforge` | Neo/Forge 模组服 | forge, neoforge, 模组服, mod服, 装forge |
| `/3-servergames/minecraft/#36fabric` | Fabric 模组服 | fabric, fabric服务端 |
| `/3-servergames/minecraft/#37curseforge` | CurseForge 整合包 | curseforge, CF包, CF整合包, 整合包自动安装, modpack |
| `/3-servergames/minecraft/#38guochan` | GuoChan 国产包 | 国产包, guochan, 国产整合包, 国内整合包, 国产包列表 |
| `/3-servergames/minecraft/#41` | 安装模组 | MC装模组, 加mod, mod放哪, mods文件夹, 客户端模组 |
| `/3-servergames/minecraft/#42` | 模组上手 | 模组服推荐, 新手模组, 模组包推荐 |
| `/3-servergames/minecraft/#5` | 地图载入/生成速度 | 地图加载慢, 地图生成慢, 加载卡, 内存不够, 倍速飞行 |
| `/3-servergames/minecraft/#6` | 游戏指令和权限 | op, 管理员指令, 快捷指令, 给op, 玩家权限, 白名单 |
| `/3-servergames/minecraft/#7` | server.properties | server.properties, 服务器属性, 改难度, 改游戏模式, 正版验证, online-mode |
| `/3-servergames/minecraft/#8` | 快速版本查询器 | 版本查询, 查版本号, 版本列表 |
| `/3-servergames/palworld/` | 幻兽帕鲁总页 | 幻兽帕鲁, palworld, 帕鲁, 帕鲁开服, 帕鲁服务器 |
| `/3-servergames/palworld/#21` | 参数修改 | 帕鲁参数, 帕鲁改倍率, 经验倍率, 捕捉倍率, 帕鲁设置 |
| `/3-servergames/palworld/#22` | 其他参数 | 帕鲁隐藏参数, 帕鲁高级参数, 帕鲁配置文件 |
| `/3-servergames/palworld/#3` | 管理指令 | 帕鲁管理指令, adminpassword, 帕鲁管理员, 帕鲁作弊指令 |
| `/3-servergames/palworld/#4` | 加入游戏 | 帕鲁怎么进服, 帕鲁加入服务器, 帕鲁联机 |
| `/3-servergames/palworld/#5` | 安装模组 | 帕鲁模组, 帕鲁装mod, 帕鲁创意工坊 |
| `/3-servergames/palworld/#6bug` | 已知BUG | 帕鲁BUG, 帕鲁丢档, 存档损坏 |
| `/3-servergames/palworld/#7` | 存档位置 | 帕鲁存档在哪, Pal/Saved, 存档路径 |
| `/3-servergames/palworld/#8` | 存档转换 | 帕鲁存档转换, 四人存档转服务器, windows存档转linux, 存档不通用 |
| `/3-servergames/dontstarve/` | 饥荒联机版总页 | 饥荒, 饥荒联机, 饥荒联机版, dont starve, DST, dst开服, 饥荒开服 |
| `/3-servergames/dontstarve/#21token` | 生成服务器 Token | 饥荒token, 服务器token, klei token, 令牌, 获取token |
| `/3-servergames/dontstarve/#22token` | 填入 Token | token填哪, 填token, token没生效, 刷不进文件 |
| `/3-servergames/dontstarve/#23` | 世界设置（推荐） | 饥荒世界设置, 世界参数, 资源丰富度, 洞穴设置, caves, master, 改世界生成 |
| `/3-servergames/dontstarve/#24` | 模组安装（推荐） | 饥荒装模组, 饥荒模组安装, 饥荒创意工坊, 搜模组 |
| `/3-servergames/dontstarve/#25` | 模组管理（推荐） | 饥荒模组管理, 改模组参数, 模组配置, 模组不生效 |
| `/3-servergames/dontstarve/#26` | 世界生成（手动） | worldgenoverride, 世界生成文件, 手动世界设置 |
| `/3-servergames/dontstarve/#27mod` | 配置 MOD（手动） | modoverrides.lua, 手动配模组, 模组配置文件 |
| `/3-servergames/dontstarve/#28mod` | 下载 MOD（手动） | dedicated_server_mods_setup, 模组下载文件, 模组自动下载 |
| `/3-servergames/dontstarve/#5` | 服务器指令（作弊） | 饥荒指令, 饥荒作弊, c_give, c_spawn, 控制台指令, remote |
| `/3-servergames/dontstarve/#6` | 模组配置器（高级） | 饥荒模组配置器, 模组编辑器, dst_mod_edit |
| `/3-servergames/dontstarve/#4` | 重置服务器（世界） | 饥荒重置世界, 重开世界, c_regenerateworld, 换新世界, 重新生成世界 |
| `/3-servergames/dayz/` | DayZ 总页 | DayZ, dayz, 僵尸末日, dayz开服, 末世服 |
| `/3-servergames/dayz/#21` | 服务器参数 | dayz参数, dayz游戏参数, 启动命令, 预设 |
| `/3-servergames/dayz/#22` | 参数说明表 | dayz参数说明, 时间倍率, 夜间倍率, 最大玩家, 查询端口, rcon端口 |
| `/3-servergames/dayz/#23` | 安装模组（启动器导出） | dayz模组, dayz装mod, modlist.html, 模组列表, 启动器导出模组 |
| `/3-servergames/dayz/#24` | 开服后检查 | dayz开服检查, dayz启动失败 |
| `/3-servergames/dayz/#3` | 管理指令 | dayz管理指令, dayz管理员, dayz指令 |
| `/3-servergames/dayz/#4` | 加入游戏 | dayz进服, dayz搜不到服务器, dayz联机 |
| `/3-servergames/dayz/#5` | 备份与存档 | dayz备份, dayz存档 |
| `/3-servergames/dayz/#6` | 常见问题排查 | dayz报错, dayz闪退, dayz连不上 |
| `/3-servergames/pz/` | 僵尸毁灭工程 | 僵尸毁灭工程, 僵毁, Project Zomboid, PZ, pz开服, 僵尸毁灭工程开服 |
| `/3-servergames/pz/#21` | 订阅模组/地图 | pz订阅mod, pz创意工坊订阅 |
| `/3-servergames/pz/#23` | 添加模组/地图 | pz加mod, pz地图 |
| `/3-servergames/pz/#25` | 上传配置文件 | pz配置文件, Server ini, 上传ini |
| `/3-servergames/pz/#51bug` | 已知BUG | pz启动失败, .Cache过大, BackupsOnStart |
| `/3-servergames/pz/#52` | 其他注意 | pz lobby看不到, pz设Public |
| `/3-servergames/rust/` | Rust 腐蚀 | 腐蚀, rust, Rust腐蚀, 部落, rust开服, 腐蚀开服 |
| `/3-servergames/rust/#21` | 后台和端口配置 | rust端口, rust4个端口, rust端口配置 |
| `/3-servergames/rust/#22mod` | 安装 Mod/插件 | rust插件, oxide, umod, rust装插件 |
| `/3-servergames/rust/#23` | 权限与命令 | rust指令, rust权限, oxide命令 |
| `/3-servergames/rust/#25` | 设置管理员 | rust管理员, moderatorid, ownerid |
| `/3-servergames/rust/#26` | 保存服务器设置 | server.writecfg, rust保存配置 |
| `/3-servergames/rust/#32` | 区域锁与封禁 | rust锁区, rust列表搜不到, rust封禁风险 |
| `/3-servergames/7dtd/` | 七日杀 | 七日杀, 7 days to die, 7dtd, 七日杀开服 |
| `/3-servergames/7dtd/#21` | 基础设置（后台） | 七日杀基础设置, 七日杀难度, 玩家数量 |
| `/3-servergames/7dtd/#22` | serverconfig.xml | serverconfig.xml, 七日杀配置文件, 七日杀参数 |
| `/3-servergames/7dtd/#23` | 服务器常用命令 | 七日杀后台命令, 七日杀指令表 |
| `/3-servergames/7dtd/#24debug` | Debug/创造模式 | 七日杀创造模式, 七日杀debug, cm dm, F1 |
| `/3-servergames/ark/` | 方舟 | 方舟, ARK, 方舟进化, 方舟飞升, ark开服 |
| `/3-servergames/ark/#21` | 服务器配置文件 | GameUserSettings.ini, ark配置, 方舟配置文件 |
| `/3-servergames/ark/#22ark` | ARK 服务器管理器 | 方舟多通, 集群, ark server manager, 多地图 |
| `/3-servergames/ark/#32` | 其他注意（rcon 关机） | 方舟关服, ark rcon, ark保存存档, ark关机 :q |
| `/3-servergames/cs/` | 反恐精英 | 反恐精英, CS, CSGO, CS2, cs2开服, 起源 |
| `/3-servergames/cs/#21` | 生成服务器令牌 | cs令牌, GSLT, 服务器令牌 |
| `/3-servergames/cs/#22wapi` | WAPI 密钥 | WAPI, steam api key, 创意工坊密钥 |
| `/3-servergames/cs/#23` | 选择地图 | cs地图, cs2地图, 地图文件夹 |
| `/3-servergames/cs/#24` | 选择创意工坊 | cs创意工坊, 工坊地图, workshop |
| `/3-servergames/cs/#26` | 启动创意工坊 | cs加载工坊, 启动创意工坊 |
| `/3-servergames/cs/#27` | 连接游戏服务器 | cs进服, connect指令 |
| `/3-servergames/valheim/` | 英灵神殿 | 英灵神殿, valheim, 维京, valheim开服 |
| `/3-servergames/valheim/#3` | 注意事项（模组管理） | valheim模组, thunderstore, 英灵神殿mod |
| `/3-servergames/sof/` | 森林之子 | 森林, 森林之子, Sons of the Forest, SOF, 森林开服 |
| `/3-servergames/sof/#22` | 设置服务器所有者 | ownerswhitelist, 森林所有者, steamid白名单 |
| `/3-servergames/sof/#23` | 端口设置 | 森林之子端口, GamePort, Blob Query |
| `/3-servergames/ror2/` | 雨中冒险2 | 雨中冒险2, Risk of Rain 2, ror2, 雨中冒险开服 |
| `/3-servergames/ror2/#21` | 端口设置 | ror2端口, server.cfg |
| `/3-servergames/ror2/#22` | 额外设置 | sv_custom_tags, ror2标签 |
| `/3-servergames/humanitz/` | 人性末日（模板） | 人性末日, HumanitZ |
| `/3-servergames/conan/` | 流放者柯南（模板） | 流放者柯南, Conan Exiles, 柯南 |
| `/3-servergames/factorio/` | 异星工场（模板） | 异星工场, factorio, 异星工厂 |
| `/3-servergames/abioticfactor/` | 非生物因素（模板） | 非生物因素, Abiotic Factor |
| `/3-servergames/satisfactory/` | 幸福工厂（模板） | 幸福工厂, satisfactory |
| `/3-servergames/amongus/` | 太空狼人杀（模板） | 太空狼人杀, Among Us, 狼人杀开服 |
| `/3-servergames/arma3/` | 武装突袭3（模板） | 武装突袭, arma3, arma |
| `/3-servergames/scpsl/` | SCP:SL（模板） | SCP, SCP秘密实验室, scpsl |
| `/3-servergames/squad/` | 战术小队（模板） | 战术小队, squad |
| `/3-servergames/vrising/` | 夜族崛起（模板） | 夜族崛起, V Rising, v rising |

### 2.4 FAQ / 客服 / 站点

| URL | 内容 | 关键词（多对 1） |
|---|---|---|
| `/faq/` | 常见问题总页 | 常见问题, FAQ, 问答, 报错怎么办 |
| `/faq/#1` | 文件夹/大文件传不上去 | 传不上去, 上传失败, 文件夹上传, 大文件上传, 传一半断了 |
| `/faq/#2` | 怎么样重新生成世界 | 重新生成世界, 重置世界, 世界重置, 新开世界, 清空世界, 换地图 |
| `/faq/#3` | 如何切换同类型其他游戏 | 切换游戏, 换游戏, 切换预设, 换服务器类型, 想玩别的游戏, 同一台机器换游戏 |
| `/faq/#4` | 性能不足/经常崩溃 | 服务器卡, 掉帧, 崩服, 经常崩溃, 内存不够, 性能不足, 升级配置值得吗 |
| `/faq/#5` | 无法启动/启动后崩溃 | 启动不了, 起不来, 启动后崩溃, 开服失败, 一直显示安装中, 卡在启动 |
| `/contact/` | 联系客服总页 | 客服, 联系客服, 人工, 找客服, 技术支持 |
| `/contact/#1` | 提交工单（48h） | 工单, 提交工单, 提工单在哪, 48小时 |
| `/contact/#2` | 技术客服微信（72h） | 微信客服, 加微信, 客服微信号, mlsg-qiubao, 一对一, 技术支持价格 |
| `/contact/#3` | 淘宝客服（72h） | 淘宝客服, 淘宝买的, 淘宝订单 |
| `/contact/#4discord` | 官方 Discord | discord, DC, 玩家群, 交流群 |
| `/about/` | 关于我们 | 关于我们, MLSG, 菜菜云, 公司, 你们是谁 |
| `/` | 首页 | 首页, 手册首页, 目录, 全部教程 |
| `https://mlsg.mr-leaves.com` | 官网（购买/续费） | 购买, 下单, 买服务器, 价格, 续费, 发票, 账户, 登录官网 |
| `https://panel.mr-leaves.com` | 管理后台入口 | 后台地址, 面板地址, 登录后台, 后台链接, 控制面板 |
| `https://mlsg.mr-leaves.com/store/submitticket.php` | 工单直达 | 提工单链接, 工单入口 |

### 2.5 工具页

| URL | 关键词（多对 1） |
|---|---|
| `/tools/quick_server_selector.html` | 配置推荐, 选配置, 多少人用什么配置, 配置计算器, 该买多大内存 |
| `/tools/fast_version_search.html` | 版本查询, 版本号查询, 查MC版本 |
| `/tools/guochan_metadata.html` | 国产包, 国产整合包列表, 国产包有哪些 |
| `/tools/dst_mod_setup.html` | 饥荒模组生成器, 模组下载配置生成, dedicated_server_mods_setup 生成 |
| `/tools/dst_mod_edit.html` | 饥荒模组编辑器, modoverrides 编辑, 饥荒模组参数编辑 |

---

## 3. 锚点全量表（深链用）

格式：`#锚点` 标题。**必须原样使用**，不要自行转换中文。

### `/1-serverbasics/`
`#1` 1.仪表盘 ｜ `#2` 2.操作页面 ｜ `#21` 2.1.控制台 ｜ `#22` 2.2.游戏参数 ｜ `#23` 2.3.文件管理 ｜ `#24` 2.4.数据备份 ｜ `#25` 2.5.网络端口 ｜ `#26` 2.6.计划任务 ｜ `#27` 2.7.高级设置 ｜ `#28` 2.8.邀请用户 ｜ `#29` 2.9.操作记录 ｜ `#210` 2.10.系统日志

### `/2-serveradvanced/`
`/` `#1` 1.快速索引 ｜ `#2` 2.官方文档 ｜ `#3` 3.更多教程
`upgrade/` `#1` 1.官网自助升级（推荐）｜ `#_2` ✅按天数补差价 ｜ `#2-` 2.联系客服 - 人工升级 ｜ `#i` ℹ️按月份补差价
`subuser/` `#1` 1.打开邀请用户界面 ｜ `#2` 2.邀请并填入权限 ｜ `#3` 3.子用户登录后台
`reinstall/` `#1` 1.关闭服务器 ｜ `#2` 2.删除所有文件 ｜ `#3` 3.重新安装按钮 ｜ `#4` 4.等待安装完成
`plan/` `#1` 1.创建计划 ｜ `#2` 2.触发时间 ｜ `#3` 3.添加任务
`filetransfer/` `#1filezilla` 1.下载并安装FileZilla ｜ `#2` 2.在服务器后台找到连接信息 ｜ `#3` 3.填入连接信息并连接
`steamcheck/` `#1curl` 1.使用在线CURL ｜ `#2ip` 2.确认服务器IP ｜ `#3` 3.修改标准指令 ｜ `#4` 4.检查返回结果

### `/3-servergames/`
`/` `#1` 1.快速索引 ｜ `#2` 2.配置选择 ｜ `#3` 3.更多教程
`minecraft/` `#1` 推荐配置 ｜ `#2` 后台简介 ｜ `#3` 开服教程 ｜ `#31` 一键安装 ｜ `#32java` Java版本 ｜ `#33vanilla` Vanilla ｜ `#34paper` Paper ｜ `#35neoforge` Neo/Forge ｜ `#36fabric` Fabric ｜ `#37curseforge` CurseForge ｜ `#38guochan` GuoChan ｜ `#4` 模组相关 ｜ `#41` 安装模组 ｜ `#42` 模组上手 ｜ `#5` 地图载入速度 ｜ `#6` 指令和权限 ｜ `#7` server.properties ｜ `#8` 版本查询器
`palworld/` `#1` 推荐配置 ｜ `#2` 开服教程 ｜ `#21` 参数修改 ｜ `#22` 其他参数 ｜ `#3` 管理指令 ｜ `#4` 加入游戏 ｜ `#5` 安装模组 ｜ `#6bug` 已知BUG ｜ `#7` 存档位置 ｜ `#8` 存档转换
`dontstarve/` `#1` 推荐配置 ｜ `#2` 开服教程 ｜ `#21token` 生成Token ｜ `#22token` 填入Token ｜ `#23` 世界设置 ｜ `#24` 模组安装 ｜ `#25` 模组管理 ｜ `#26` 世界生成（手动）｜ `#27mod` 配置MOD（手动）｜ `#28mod` 下载MOD（手动）｜ `#31bug` 已知BUG ｜ `#32mod` 弃用MOD ｜ `#4` 重置服务器 ｜ `#5` 服务器指令 ｜ `#6` 模组配置器
`dayz/` `#1` 推荐配置 ｜ `#2` 开服教程 ｜ `#21` 服务器参数 ｜ `#22` 参数说明 ｜ `#23` 安装模组 ｜ `#24` 开服后检查 ｜ `#3` 管理指令 ｜ `#4` 加入游戏 ｜ `#5` 备份与存档 ｜ `#6` 常见问题排查
`pz/` `#21` 订阅模组/地图 ｜ `#22` 生成配置文件 ｜ `#23` 添加模组/地图 ｜ `#24` 设置世界参数 ｜ `#25` 上传配置文件 ｜ `#26` 手动修改配置 ｜ `#3` 加入游戏 ｜ `#4` 管理员功能 ｜ `#51bug` 已知BUG ｜ `#52` 其他注意
`rust/` `#21` 后台和端口配置 ｜ `#22mod` 安装设置Mod/插件 ｜ `#23` 权限与命令 ｜ `#24` 查看与管理玩家组 ｜ `#25` 设置管理员 ｜ `#26` 保存服务器设置 ｜ `#31` 服务器同步与区域 ｜ `#32` 区域锁与封禁风险
`7dtd/` `#21` 基础设置 ｜ `#22` 高级设置（游戏文件）｜ `#23` 服务器常用命令 ｜ `#24debug` Debug菜单
`ark/` `#21` 服务器配置文件 ｜ `#22ark` ARK服务器管理器 ｜ `#31bug` 已知BUG ｜ `#32` 其他注意
`cs/` `#21` 生成服务器令牌 ｜ `#22wapi` 生成WAPI密钥 ｜ `#23` 选择地图 ｜ `#24` 选择创意工坊 ｜ `#25` 设置游戏模式 ｜ `#26` 启动创意工坊 ｜ `#27` 连接游戏服务器 ｜ `#31bug` 已知BUG ｜ `#4` 教程链接
`valheim/` `#1` 推荐配置 ｜ `#2` 开服教程 ｜ `#3` 注意事项
`sof/` `#21` 设置游戏配置 ｜ `#22` 设置服务器所有者 ｜ `#23` 端口设置
`ror2/` `#21` 端口设置 ｜ `#22` 额外的设置 ｜ `#3` 注意事项
模板页（humanitz / conan / factorio / abioticfactor / satisfactory / amongus / arma3 / scpsl / squad / vrising）结构统一：`#1` 推荐配置 ｜ `#2` 开服前准备 ｜ `#3` 开服流程 ｜ `#4`…`#7` 建议/问题 ｜ 最后一节「后续可补充内容」

### `/faq/` `/contact/` `/about/`
`/faq/` `#1` 大文件传不上去 ｜ `#2` 重新生成世界 ｜ `#3` 切换同类型游戏 ｜ `#4` 性能不足/崩溃 ｜ `#5` 无法启动/崩溃
`/contact/` `#1` 后台提交工单 ｜ `#2` 技术客服微信 ｜ `#3` 淘宝网店客服 ｜ `#4discord` 官方Discord
`/about/` `#_2` 手册简介 ｜ `#_3` 公司简介 ｜ `#_4` 联系我们

---

## 4. 兜底与禁止事项

### 4.1 兜底策略

| 情形 | 回复动作 |
|---|---|
| 命中 `template` 页 | 「该游戏教程还在整理，先看后台基本操作 + 对应 FAQ」，给 `/1-serverbasics/` 与 `/faq/` |
| 未命中任何关键词 | 给 `/`（教程首页）+ `/faq/`，并提示可用工单或微信找客服 |
| 问价格 / 订单 / 退款 / 发票 | 给 `https://mlsg.mr-leaves.com`，不要报任何具体价格 |
| 问「能不能帮我开服 / 帮我改配置」 | 给对应游戏页 + 后台地址，不做代操作承诺 |
| 问具体报错原因 | 先给 `#210` 系统日志 与 `/faq/#5`，要求提供日志全文 |

### 4.2 禁止事项

1. **不要编造教程里没有的参数值、命令、价格、时限**；本文件只提供「去哪看」，不提供「答案本身」。
2. **不要自己拼锚点**：锚点以本文件 `§3` 为准（中文标题生成的 id 无常规律）。
3. **不要引用 `template` 页的具体参数**当答案（如人数、内存推荐），它们只是通用骨架。
4. 涉及面板实际功能时，以教程页描述为准；本文件不描述后台实现细节。
5. 回复一律带**完整 URL**，不要只说「见基本操作页」。

---

## 5. 维护说明

- 页面路径、标题、章节号一旦变动，**`§3` 锚点表必须同步重跑**；锚点由标题文字生成，改标题等于改链接。
- 新增页面时：`§1 页面清单` 加一行 + `§2 关键词映射` 加一行（关键词尽量覆盖口语说法）+ `§3` 补该页锚点。
- 本文件不参与构建；如需让外部程序抓取，可从 `https://manual.mr-leaves.com/sitemap.xml` 获取全量页面 URL。
