#!/bin/sh
# 从旁边的 chalklee 仓库同步内置插件和插件模板。它们在那里开发，这里的副本只作示范，不要直接修改。
set -eu
cd "$(dirname "$0")/.."
repo="${1:-../chalklee}"
source="$repo/apps/desktop/src/main/plugins/builtin"
for name in todo calendar; do
  mkdir -p "$name"
  cp "$source/$name/plugin.json" "$source/$name/index.html" "$name/"
done
mkdir -p template
cp -R "$repo/templates/plugin/." template/
echo "已从 $repo 同步待办、日历和插件模板。"
