#!/bin/bash

softwares=(
    "adobe creative cloud"
    "blender"
    "figma"
)

softwares_name=(
    "Adobe Creative Cloud"
    "Blender"
    "Figma"
)

softwares_desc=(
    "創造力を形にする Adobe のツール"
    "オープンソースの 3DCG ソフトウェア"
    "Web ベースのプロトタイピングツール"
)

function main() {
    ls ../../installer/
    . ../../installer/menu.sh
    menu "softwares" "softwares_name" "softwares_desc"
    for ((i=0; i < ${#menu_selected_items[@]}; i++)); do
        
        if [[ ${menu_selected_items[i]} == "adobe creative cloud" ]]; then
            echo "Adobe Creative Cloud をインストールしています"
            brew cask install adobe-creative-cloud
        fi
        
        if [[ ${menu_selected_items[i]} == "blender" ]]; then
            echo "Blender をインストールしています"
            brew cask install blender
        fi
        
        if [[ ${menu_selected_items[i]} == "figma" ]]; then
            echo "Figma をインストールしています"
            brew cask install figma
        fi
        
    done
}



main
