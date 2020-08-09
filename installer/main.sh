#!/bin/bash

: << MODULES

Mac 向けセットアップ
1. 基本モジュール: Homebrew の導入など、基本的なセットアップ

アプリケーション
2. 開発者モジュール: VSCode、Hyper、Docker などのセットアップ
3. ネットワークモジュール: Tailscale などのセットアップ
4. インターネットモジュール: Google Chrome、Firefox、Discord、LINE などのセットアップ
5. クリエイティブモジュール: Adobe CC、Figma、Blender、Firefox DE などのセットアップ
6. タスク管理モジュール: Notion などのセットアップ

コマンドラインツール
6. zsh: Powerlevel10k などのセットアップ
7. Python: pyenv、Python 3 などのセットアップ
8. Node.js: nvm、node.js、npm、yarn などのセットアップ
9. Java: jEnv、AdoptOpenJDK 11 などのセットアップ

MODULES

modules=()
modules_name=()
modules_desc=()
modules_dir=`ls ./modules`
module_meta=("module_name" "module_desc" "module_platform" "module_init")

clear

# メニュー項目
IFS_TMP=$IFS

for module in ${modules_dir[@]}; do
    # module.sh (メタデータ) の有無を確認
    if [ -e ./modules/$module/module.sh ]; then
        # メタデータを読み込み
        . ./modules/$module/module.sh
        
        let i++
        modules+=("$module")
        modules_name+=("$module_name")
        modules_desc+=("$module_desc")
        
        # modules_desc+=( $(echo \"${module_desc}\") )
        
        # modules_name+=(${MODULE_INFO["platform"]})
        # 安全にモジュールのディレクトリに移動し、初期化スクリプトを実行
        # bash -c "cd ./modules/$module && cat ${MODULE_INFO["init"]} | bash"
        # 一時的に格納したメタデータを削除し、次のモジュールを安全に実行できるようにする
        for module_meta_item in ${module_meta[@]}; do
            unset $module_meta_item
        done
    fi
done
IFS=$IFS_TMP
unset $IFS_TMP

. ./installer/menu.sh
# menu "${modules[*]}" "${modules_name[*]}" "${modules_desc[*]}"

menu "modules" "modules_name" "modules_desc"

for workflow in ${menu_selected_items[@]}; do
    . ./modules/$workflow/module.sh
    bash -c "cd ./modules/$workflow && ./$module_init"
    for module_meta_item in ${module_meta[@]}; do
        unset $module_meta_item
    done
done
