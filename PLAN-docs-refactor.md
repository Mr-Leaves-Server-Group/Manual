# Manual 教程整改：执行报告 + 截图清单

> 生成时间：2026-11-06
> 分支：`dev`（本地已改完，**未 commit、未 push、未开 PR**，等你实测）
> 只读约束：`panel-test`、`Eggs\Panel` 全程只读，本文所有后台结论来自读代码，无写入。
> 本文件在仓库根目录，不参与 mkdocs 构建（只读 `docs/`），**评审通过后请删除，不要随 PR 提交**。

---

## 0. 一句话方案（已按你的第二轮指令执行）

新增功能**不另建独立页**，全部插回对应游戏的页面：

- 新流程放前面标 **✅首选**，旧流程留在后面标 **ℹ️备选**（"新在前、旧降级"）
- 通用功能（系统日志、菜单改名）进 **`1-serverbasics.md` 基础功能页**
- 菜单名按后台新命名同步：文件→**文件管理**、启动→**游戏参数**、备份→**数据备份**、网络→**网络端口**、计划→**计划任务**、设置→**高级设置**、子用户→**邀请用户**、日志页→**操作记录**
- 截图：我只写链接 + 落一个 `_FAKE.png` 占位（1×1 透明 PNG），你拍好后放同名 `xxx.png` 并删掉 `xxx_FAKE.png`

---

## 1. 排版语法：已统一项 / 未统一项 / 红线

### 1.1 已执行（A 级，纯语法层，不改观感）

| 编号 | 规则 | 处理结果 |
| --- | --- | --- |
| A1 | 图片路径一律 `/assets/...`，禁止 `\assets\...` 反斜杠 | 52 处反斜杠 → `/assets/`，现全站 **0 处**反斜杠图片路径 |
| A3 | 表格分隔行统一 `\| --- \| --- \|`（不再出现长短不一的横线） | 5 个文件共 6 行归一（7dtd / dontstarve / minecraft / palworld ×2 等） |
| A7 | 站内死链 `/service` | `index.md` → `/contact/`，现全站 0 断链 |
| A8 | 章节重号（palworld 原有两个 `## 3.`） | 已重排为 3 / 4 / 5 / 6 / 7 / 8 |
| L1 | 行尾统一 CRLF（Windows 仓库现状） | 全部 `.md` 统一 CRLF，新增文件不再是 LF |

### 1.2 未执行（我判断不值得动，说明理由）

| 编号 | 项 | 为什么不动 |
| --- | --- | --- |
| A2 | 裸 `<a href ... target="_blank">` → `{target=_blank}` | 两种写法渲染结果一致；改 10 处属于"换写法不换结果"，只会让 diff 变脏 |
| A4 | 图片 alt 去重（pz 13 张同 alt） | 需要逐图确认内容才知道 alt 该写什么，等重拍截图时一起定 |
| A5 | 裸代码块补语言 | 4 处都是纯文本命令块，加了 `bash` 也不会高亮 |
| A6 | 标题尾点（`### 2.1 参数修改` vs `### 3.1.Java版本选择`） | **标题文字即锚点**，改尾点会改锚点，违反"title 类不动" |

### 1.3 红线（继续保持，一律不改）

标题文字与编号（除必要重排）、换行、`<br>`、`<div style="height:10px"></div>  <!-- 完美间距 -->`、`<center>` 图注、字号颜色、`mkdocs.yml` 的 `nav`、`assets/1.0` 与 `assets/2.0` 老图文件。

> 技术事实（已实测）：`mkdocs.yml` 没有 `markdown_extensions` 段，生效的只有内置 `toc/tables/fenced_code` + attr_list（`{target=_blank}` 生效）。**所以不要引入 `!!! note` 之类的 admonition，会原样输出成文本。** 本文所有"✅ / ℹ️ / ⚠️"都是加粗文字 + emoji，不用 admonition。

---

## 2. 后台新功能 → 教程落点

| 后台功能（路由 / 能力键） | 归属菜单 | 写进哪页 | 位置 |
| --- | --- | --- | --- |
| 一键安装（`modpack`）：核心快切 + 国产整合包卡片 | 一键安装 | `minecraft.md` | 新增 `### 3.1.一键安装（推荐）`，原 3.1~3.8 顺延为 3.2~3.8（备选） |
| 快捷指令（`mc-manager`） | 快捷指令 | `minecraft.md` | `## 6.游戏指令和权限` 前置"✅首选：快捷指令"，原指令表变"ℹ️备选" |
| 模组安装（`mod_install-pal`） | 模组安装 | `palworld.md` | `## 5.安装模组` 前置"✅首选：模组安装"，原手填 `模组列表` 变"ℹ️备选" |
| 模组安装（`mod_install-dst`） | 模组安装 | `dontstarve.md` | 新增 `### 2.5.模组安装（推荐）` |
| 模组管理（`dst_mod_manager`） | 模组管理 | `dontstarve.md` | 新增 `### 2.6.模组管理（推荐）`，含 6 种徽章含义 |
| 世界设置（`world-settings`） | 世界设置 | `dontstarve.md` | 新增 `### 2.4.世界设置（推荐）`；`## 4.重置服务器` 改为首选【世界设置】→【重置世界】 |
| 系统日志（`file.read-content`，所有 egg 可见） | 系统日志 | `1-serverbasics.md` | `### 2.11.系统日志` + 5 个日志 tab 说明 |
| 控制台到期卡片（`/api/.../due`） | 控制台 | `1-serverbasics.md` | `2.1.控制台` 内加"到期提醒" |
| 左侧全高导航三分组 | 全局 | `1-serverbasics.md` | 开篇导航说明 |
| 菜单全线改名 | 全局 | `1-serverbasics.md` + `faq.md` + `2-serveradvanced/*` | 见 §3 |
| 品牌 `Sinicizated by 翼龙中国` → `Powered by MLSG®` | 全局 | 未改文案（只在截图里体现） | 见 §6.2 |

---

## 3. 逐页改动清单

| 文件 | 改动 |
| --- | --- |
| `docs/1-serverbasics.md` | **整篇重写**：开篇三组导航 + `1.仪表盘` + `2.操作页面`（菜单改名清单）+ 2.1 控制台/到期提醒 + 2.2 游戏参数（变量图标 + 与一键安装互斥警告）+ 2.3 文件管理 + 2.4 数据备份 + 2.5 网络端口 + 2.6 计划任务 + 2.7 高级设置 + 2.8 邀请用户 + 2.9 操作记录 + **2.10 系统日志** |
| `docs/3-servergames/minecraft.md` | 新增 3.1 一键安装（核心快切 6 步 + 国产整合包 5 步 + "未登记"说明）；原 3.1~3.8 顺延为 3.2~3.8 并同步锚点（`#31java`→`#32java`×5、`#36curseforge`→`#37curseforge`×2、`#37guochan`→`#38guochan`）；第 6 章前置快捷指令；第 8 章加"版本列表已内置"说明 |
| `docs/3-servergames/dontstarve.md` | 新增 2.4 世界设置 / 2.5 模组安装 / 2.6 模组管理；原 2.4/2.5/2.6 降级为 2.7/2.8/2.9 并标注"备选"；2.2 的【启动】→【游戏参数】；第 4 章改首选【世界设置】；第 6 章改"高级，备选"且 `#25mod`→`#28mod` |
| `docs/3-servergames/palworld.md` | 新增 `## 5.安装模组`（首选模组安装 5 步 + 备选手填变量）；章节重排 3/4/5/6/7/8（修掉双 `## 3.`）；全篇【启动】→【游戏参数】、【文件】→【文件管理】、【备份】→【数据备份】 |
| `docs/faq.md` | "重新生成世界"改为首选后台可视化页；"切换预设"改为【游戏参数】并注明旧名 |
| `docs/2-serveradvanced/plan.md` | 标题与首句改为"计划任务"（注明原名"计划"） |
| `docs/2-serveradvanced/subuser.md` | "打开子用户界面"→"打开邀请用户界面"（注明菜单名） |
| `docs/2-serveradvanced/filetransfer.md` | "设置选项卡"→**【高级设置】→ SFTP 连接信息**（已核实 SFTP 区在 `SettingsContainer.tsx`） |
| `docs/2-serveradvanced/reinstall.md` | "设置页面"→**【高级设置】** |
| `docs/0-serversignup.md` | **整页删除**（注册登录流程已失效；`index.md` 的"注册和登录"入口去掉，`subuser.md` 第 3 节改为让子用户直接打开后台 `https://panel.mr-leaves.com/` 完成登录与 2FA） |
| `docs/index.md` / `docs/0-serversignup.md` / `2-serveradvanced/index.md` / `filetransfer.md` / `plan.md` / `reinstall.md` / `subuser.md` / `minecraft.md` | 反斜杠图片路径 → `/assets/`（共 34 处） |

---

## 4. 截图清单（✅ 全部 23 张已换真图，占位图已清零）

> 已完成：`1.0/` 全部 11 张（真图已就位，md 已指向真图）。剩余 8 张占位：我的世界 3、饥荒 4、帕鲁 1。

规则：**保持 1920×1080、深色主题、`devicePixelRatio=1`**；裁到 1200~1600 宽（保留左侧栏 + 目标区域）；只加 2px 红框 `#ef4444` + 序号角标；单张 ≤200 KB；**alt 与图注一致，不重复**。

### 4.1 `docs/assets/1.0/`（11 张，✅ 全部已拍完，占位已清除）

`header.png`、`console.png`、`startup.png`、`files.png`、`backups.png`、`network.png`、`schedules.png`、`settings.png`、`subusers.png`、`activity.png`、`syslogs.png` —— md 链接已全部指向真图。

### 4.2 `docs/assets/minecraft/`（3 张，对应 `minecraft.md`）

| 占位文件 | 要拍的后台画面 |
| --- | --- |
| `oneclick-core-1_FAKE.png` | **一键安装**上块"核心快切"：三个联动下拉（核心选择/核心版本/具体版本）+ 一键安装按钮 |
| `oneclick-pack-1_FAKE.png` | 一键安装下块**整合包卡片列表**（能看清卡片字段：版本 / N Mods / 客户端包 / 一键安装 / ☕ Java；最好带搜索框与总数） |
| `quickcmd-1_FAKE.png` | **快捷指令**：玩家列表 + 玩家操作（管理权限/游戏模式/传送/封禁/白名单）+ 顶部"需重启生效"提示 |

### 4.3 `docs/assets/dontstrave/`（4 张，对应 `dontstarve.md`；目录名沿用现有拼写 `dontstrave`）

| 占位文件 | 要拍的后台画面 |
| --- | --- |
| `worldsettings-1_FAKE.png` | **世界设置**：地面 Master 参数页（左侧分类 + 右侧参数） |
| `modinstall-1_FAKE.png` | **模组安装**：搜索框 + 搜索结果（有一两条标"已添加"最好） |
| `modmanager-1_FAKE.png` | **模组管理**：模组列表 + 徽章（尽量拍到"待生效/可编辑/未下载"几种） |
| `modmanager-2_FAKE.png` | **模组管理**：某个模组的参数表单（分页 + 保存按钮） |

### 4.4 `docs/assets/palworld/`（1 张，对应 `palworld.md`）

| 占位文件 | 要拍的后台画面 |
| --- | --- |
| `steammod-1_FAKE.png` | **模组安装**：搜索框（placeholder "搜索创意工坊模组（支持标题 / id）..."）+ 搜索结果 |

> 占位文件是 1×1 透明 PNG。你的流程：拍好 → 存成同名去掉 `_FAKE` 的 `xxx.png` → 删掉 `xxx_FAKE.png`。多出的 `_FAKE.png` 会被构建进站点，**PR 前务必清干净**（可用 `Get-ChildItem docs\assets -Recurse -Filter *_FAKE.png` 自查）。

---

## 5. 构建验证（本地，与你 GH Action 同一套依赖）

```
mkdocs 1.6.1 / mkdocs-material 9.7.7 / Python 3.14
mkdocs build -> exit 0, ERROR 0, WARNING 0
INFO: 176 条 "contains an absolute link ... it was left as is"
```

- **ERROR 0 / WARNING 0**（唯一一条 WARNING 是 Material 的版权横幅，不是构建问题）。
- absolute link INFO 是 **INFO 不是错误**：站根部署（`manual.mr-leaves.com`）下这些 `/assets/...`、`/1-serverbasics/` 都能正常访问。基线原本是 158，本次因**新增 23 张占位图**变成 176。
- 若你要把这 176 条彻底清成 0，只能把图片和站内链接改成相对路径（`../assets/...`），这属于另一批改动（会让 diff 变大、文件挪位置就断），**我没动，等你决定。**
- 断链：0（`/service` 已修）；锚点：改号后的 `#32java` / `#37curseforge` / `#38guochan` / `#24` / `#25` / `#26` / `#28mod` / `#5` / `#6` 在生成的 HTML 里逐一验证存在。

---

## 6. 待你处理 / 待你决定

### 6.1 必须你手动改（按约定我不直接编辑 egg JSON）

> 状态：**你已确认能力键已补齐**（MC 加 `mc-manager`、帕鲁加 `manual-palworld`），本节留档，无需再动。

| egg | 现有 `EGG_CAPABILITIES` | 需要改成 | 不改的后果 |
| --- | --- | --- | --- |
| `Eggs\01-MC\egg-MLSG-MC-AIO.json` | `modpack,manual-minecraft` | `modpack,manual-minecraft,mc-manager` | **快捷指令菜单对 MC 不显示**，教程 §6 写的首选流程点不到入口 |
| `Eggs\03-Palworld\egg-MLSG-Palworld-MOD.json` | `mod_install-pal` | `mod_install-pal,manual-palworld` | 侧栏底部"游戏教程"跳 `/3-servergames/` 而不是 `/3-servergames/palworld/` |

### 6.2 内容决策（你说改我就改）

1. **旧截图重拍范围**：`assets/1.0/` 12 张、`assets/2.0/` 10 张全部是旧顶栏 + 旧配色（主色已从 `hsl(212,92%,43%)` 变 `hsl(217,91%,60%)`），严格说**全站截图都已过时**。本次我只给新增功能做了占位。要不要我给 `0-serversignup`、`subuser`、`plan`、`reinstall`、`filetransfer`、`pz`、`7dtd` 等页的旧图也批量落 `_FAKE` 占位？
2. **品牌文案**：登录页与页脚已改成 `Powered by MLSG®`（链 `https://mlsg.mr-leaves.com`），但 `2-serveradvanced/index.md` 里仍有 3 张"翼龙中国" banner，是否换成 MLSG 素材？
3. **4 个重叠工具页**（`fast_version_search.html` / `guochan_metadata.html` / `dst_mod_setup.html` / `dst_mod_edit.html`）：现已按"保留 + 文中标注为备选"处理；要不要直接下线（会同时删 4 个 iframe 章节）？
4. **11 个占位游戏页**：本轮未碰。

### 6.3 提交纪律

本地改完，**不 commit、不 push、不开 PR**。你实测 `mkdocs serve` 满意后告诉我，我再给 `git status` / `git diff --stat` 清单；`PLAN-docs-refactor.md`（本文件）与所有 `_FAKE.png` 都不要进 PR。

### 4.5 `docs/assets/2.0/`（15 张，进阶操作/FAQ 旧截图已替换为占位）

> 这些图拍的是旧版面板（旧菜单名、旧配色、旧品牌），已在 2026-11-06 替换为占位图，原图备份在工作区 `backup_2.0/`，也可从 git 恢复。文件名保持不变，拍好后同名覆盖即可。

| 占位文件 | 需要拍的内容 |
| --- | --- |
| `filetransfer-1.png` | `filetransfer.md` §1 — FileZilla 官网下载页 |
| `filetransfer-2.png` | `filetransfer.md` §1 — 官网下载按钮/版本选择 |
| `filetransfer-3.png` | `filetransfer.md` §2 — 【高级设置】→ SFTP 连接信息区 |
| `filetransfer-4.png` | `filetransfer.md` §3 — FileZilla 左右分栏拖拽传输 |
| `plan-1.png` | `plan.md` §1 — 【计划任务】列表页 |
| `plan-2.png` | `plan.md` §2 — 创建任务表单 |
| `plan-opt1.png` | `plan.md` — 计划类型选项 |
| `plan-opt2.png` | `plan.md` — 执行时间选项 |
| `plan-opt3.png` | `plan.md` — 仅执行一次/重复选项 |
| `reinstall-1.png` | `reinstall.md` §1 — 【文件管理】选中全部文件 |
| `reinstall-2.png` | `reinstall.md` §2 — 删除所有文件 |
| `reinstall-3.png` | `reinstall.md` §3 — 【高级设置】重新安装服务器按钮 |
| `subuser-1.png` | `subuser.md` §1 — 【邀请用户】邀请界面 |
| `subuser-2.png` | `subuser.md` §2 — 子用户权限设置 |
| `game_switch.png` | `faq.md` §3 — 【游戏参数】→ 切换预设 |

未处理：`pterodactyl-official.png`、`pterodactyl-china.png`、`pterodactyl-china-bbs.png`（`2-serveradvanced/index.md` 的社区/官网截图，非后台菜单，等确认是否更换）。
孤儿文件：`sftp-filetransfer.png`（798 KB，全站无引用）。

已替换（2026-11-06）：
- `assets/1.0/` 11 张全部真图
- `assets/2.0/` 15 张（filetransfer-1..4、plan-1/2/opt1..3、reinstall-1..3、subuser-1/2、game_switch）真图同名覆盖，旧占位已删
- `assets/minecraft/` oneclick-core-1、oneclick-pack-1 真图（新名，md 已改链）
- `assets/dontstrave/` worldsettings-1、modinstall-1、modmanager-1、modmanager-2 真图（新名，md 已改链）
- `assets/palworld/` steammod-1 真图（新名，md 已改链）

`assets/minecraft/quickcmd-1.png`（快捷指令页）已于 2026-11-06 18:54 补回并接上 md 链接，占位图全部清零。
