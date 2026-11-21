# ChalkLee 插件

在 ChalkLee 插件中心使用的小工具。

## 下载和安装

下面的链接总是下载最新版本；各版本见 [Releases](https://github.com/seven0x16/chalklee-plugins/releases)。

| 插件 | 下载 |
|---|---|
| 待办 | [todo.chalkleeplugin](https://github.com/seven0x16/chalklee-plugins/releases/latest/download/todo.chalkleeplugin) |
| 日历 | [calendar.chalkleeplugin](https://github.com/seven0x16/chalklee-plugins/releases/latest/download/calendar.chalkleeplugin) |

1. 点上面的链接下载 `.chalkleeplugin` 文件。不要用页面上的“Code → Download ZIP”，那是源码，不能直接安装。
2. 打开 ChalkLee，进入插件中心，把文件拖进去，或点“导入插件”选择这个文件。
3. 看过名称和权限后点“安装”，马上就能用。同事分享给你的插件文件也这样安装。

不想用了，在插件中心右键这个插件，选“删除”。插件保存的数据会保留，重新安装后恢复。

## 示范

插件是运行在插件中心里的网页小工具，只用 HTML、CSS 和 JS，不需要构建；
格式与接口见 ChalkLee 仓库的[插件文档](https://github.com/seven0x16/chalklee/blob/main/docs/plugin-api.md)。

| 插件 | 文件夹 | 可以参考 |
|---|---|---|
| 待办 | [`todo/`](todo/) | 用 `chalklee.storage` 保存数据；粘贴多行一次添加，从文字中读出日期和重复，删除后可撤销 |
| 日历 | [`calendar/`](calendar/) | 铺满插件页的月历、日期和时间弹层；用 `--chalklee-*` 颜色变量跟随浅色和深色 |

两个插件都不申请权限，也随 ChalkLee 内置。在插件中心删除后，可以在“发现”中找回，也可以导入上面下载的文件；
导入时恢复的是应用自带的那一份，比应用自带的更新的版本需要先更新 ChalkLee。

## 做自己的插件

复制本仓库的 [`template/`](template/)，把 `id` 改成“你的发布者.插件名”（发布者 `chalklee` 留给内置插件）。
也可以直接在 ChalkLee 里请 ChalkLee AI 做一个。

## 维护

`todo/`、`calendar/` 和 `template/` 在 ChalkLee 仓库中开发，这里是同步过来的副本。改动后在本仓库运行：

```bash
./scripts/sync.sh            # 默认从旁边的 ../chalklee 同步
```

不要直接修改这里的副本。

发布新版本前，确认待办和日历的 `plugin.json` 使用相同的版本号，然后在本地打包。

```bash
./scripts/package.sh 0.1.0
```

脚本会输出安装包所在的本地目录。维护者在 GitHub 手动创建相应标签的 Release，上传待办和日历安装包并标为最新版本。每个下载包都带有 MIT 许可证正文。`template/` 不发布。

## 许可证

本仓库使用 [MIT 许可证](LICENSE)。照着示范和模板写的插件可以自选许可证，复用其中的代码时保留原版权和许可声明。
