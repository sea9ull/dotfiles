#!/usr/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOTFILES_DIR=$SCRIPT_DIR
REPOSITORY=$DOTFILES_DIR/repository
HOST_NAME=$(uname -n)
HOST_DIR=$DOTFILES_DIR/hosts/$HOST_NAME
XDG_CONFIG_HOME=$HOME/.config

# ホスト別の active_list.txt があればそちらを優先する
if [ -f "$HOST_DIR/active_list.txt" ]; then
    APPS=$HOST_DIR/active_list.txt
else
    APPS=$DOTFILES_DIR/active_list.txt
fi

if [ ! -d "$XDG_CONFIG_HOME" ]; then
    mkdir -p "$XDG_CONFIG_HOME"
fi

# $1 以下のツリーを $2 以下へミラーしてシンボリックリンクを張る
# - 隠しファイル・隠しディレクトリ (.dest 等のメタデータ) は対象外
# - ファイル名先頭の `_` は `.` に読み替える (例: _vimrc -> .vimrc)
#   ただし `__init__.py` のような `__` 始まりはそのまま
function link_tree() {
    src="$1"
    dest="$2"
    find "$src" -name '.*' -prune -o -type f -print | while read -r file; do
        rel="${file#$src/}"
        dest_dir=$(dirname "$dest/$rel")
        name=$(basename "$file")
        if [ "${name:0:1}" = "_" ] && [ "${name:0:2}" != "__" ]; then
            name=".${name:1}"
        fi
        mkdir -p "$dest_dir"
        echo "[bind] $file ==> $dest_dir/$name"
        ln -sfn "$file" "$dest_dir/$name"
    done
}

# アプリの転送先を決める: .dest ファイルがあればその内容 (環境変数可)、
# なければ $XDG_CONFIG_HOME/<アプリ名>
function app_dest() {
    app="$1"
    if [ -f "$REPOSITORY/$app/.dest" ]; then
        eval echo "$(cat "$REPOSITORY/$app/.dest")"
    elif [ -f "$HOST_DIR/$app/.dest" ]; then
        eval echo "$(cat "$HOST_DIR/$app/.dest")"
    else
        echo "$XDG_CONFIG_HOME/$app"
    fi
}

# 空行と # コメントを除いた各行がアプリ名
grep -v -e '^[[:space:]]*#' -e '^[[:space:]]*$' "$APPS" | while read -r app; do
    if [ ! -d "$REPOSITORY/$app" ] && [ ! -d "$HOST_DIR/$app" ]; then
        echo "[skip] no such app : $app"
        continue
    fi
    dest=$(app_dest "$app")
    # 共通設定
    if [ -d "$REPOSITORY/$app" ]; then
        link_tree "$REPOSITORY/$app" "$dest"
    fi
    # ホスト別オーバーライド (同名ファイルを後から上書きリンク)
    if [ -d "$HOST_DIR/$app" ]; then
        link_tree "$HOST_DIR/$app" "$dest"
    fi
done
