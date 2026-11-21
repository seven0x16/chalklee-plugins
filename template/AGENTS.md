# ChalkLee 插件开发约定

这是一个 ChalkLee 插件。使用者是老师，界面文字用中文，不出现技术术语。

- 接口和权限以 ChalkLee 仓库的 `docs/plugin-api.md` 为准，不要使用其中没有的接口。
- 只写不用构建的 HTML、CSS、JS，代码保持可读，不压缩、不混淆，所有文件都放在插件里。
- 插件不能联网，不能加载外部脚本、图片或字体，也不能打开外部链接。
- 数据用 `chalklee.storage` 保存，不要用 `localStorage`，它在插件里不可用。
- 导出文件用 `chalklee.files.save`，在老师点击按钮时调用；下载链接在插件里无效。
- 只申请确实用到的权限，写在 `plugin.json` 的 `permissions` 里。
- `plugin.json` 只能用 Schema 里有的字段；`id` 写成“发布者.插件名”，发布后不再改动。
- 颜色用 `--chalklee-*` 变量，这样能跟随浅色和深色。
- 样例数据只用虚构内容，不放真实的学生姓名、成绩或教学资料。
- 改完运行 `npm run plugin -- check <插件文件夹>`，把报告的问题全部解决。
