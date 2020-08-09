#!/bin/bash

softwares=("google chrome" "discord")
softwares_name=("Google Chrome" "Discord")
softwares_desc=("Google が開発した、インターネットブラウザ" "話せる、あなたの居場所")

function main() {
    ls ../../installer/
    . ../../installer/menu.sh
    menu "softwares" "softwares_name" "softwares_desc"
    for ((i=0; i < ${#menu_selected_items[@]}; i++)); do
        
        if [[ ${menu_selected_items[i]} == "google chrome" ]]; then
            echo "Google Chrome をインストールしています"
            brew cask install google-chrome
        fi
        
        if [[ ${menu_selected_items[i]} == "discord" ]]; then
            echo "Discord をインストールしています"
            brew cask install discord
        fi
        
    done
}



main
