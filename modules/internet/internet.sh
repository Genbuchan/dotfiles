#!/bin/bash

softwares=(
    "google chrome"
    "firefox developer edition"
    "discord"
    "zoomus"
)

softwares_name=(
    "Google Chrome"
    "Firefox Developer Edition"
    "Discord"
    "Zoom"
)

softwares_desc=(
    "Google が開発した、インターネットブラウザ"
    "オープンなブラウザの開発者向けエディション。"
    "コミュニケーションを1つのツールで"
    "大規模な会議に対応するミーティングツール"
)

function main() {
    ls ../../installer/
    . ../../installer/menu.sh
    menu "softwares" "softwares_name" "softwares_desc"
    for ((i=0; i < ${#menu_selected_items[@]}; i++)); do
        
        if [[ ${menu_selected_items[i]} == "google chrome" ]]; then
            echo "Google Chrome をインストールしています"
            brew install --cask google-chrome
        fi
        
        if [[ ${menu_selected_items[i]} == "firefox developer edition" ]]; then
            echo "Firefox Developer Edition をインストールしています"
            brew install --cask firefox-developer-edition
        fi
        
        if [[ ${menu_selected_items[i]} == "discord" ]]; then
            echo "Discord をインストールしています"
            brew install --cask discord
        fi
        
        if [[ ${menu_selected_items[i]} == "zoomus" ]]; then
            echo "Zoom をインストールしています"
            brew install --cask zoomus
        fi
        
    done
}



main
