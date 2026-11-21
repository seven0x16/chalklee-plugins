#!/bin/sh
# 将当前版本的插件打包到本地临时目录，跳过插件模板。
set -eu
cd "$(dirname "$0")/.."
version="${1:?用法：scripts/package.sh 0.1.0}"
dist=$(mktemp -d "${TMPDIR:-/tmp}/chalklee-plugins.XXXXXX")
trap 'rm -rf "$dist"' EXIT
for manifest in */plugin.json; do
  folder=$(dirname "$manifest")
  [ "$folder" = template ] && continue
  actual=$(node -p "require('./$manifest').version")
  if [ "$actual" != "$version" ]; then echo "${manifest} 的版本是 ${actual}，不是 ${version}。" >&2; exit 1; fi
  archive="$dist/$folder.chalkleeplugin"
  zip -q -X "$archive" LICENSE
  (cd "$folder" && zip -q -X -r "$archive" . -x '.*' '*/.*')
done
trap - EXIT
printf '%s\n' "$dist"
