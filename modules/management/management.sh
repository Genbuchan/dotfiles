#!/bin/bash

softwares=(
    "notion"
)

softwares_name=(
    "Notion"
)

softwares_desc=(
    "ノートもスケジュールも、これ１つで"
)

function main() {
    ls ../../installer/
    . ../../installer/menu.sh
    menu "softwares" "softwares_name" "softwares_desc"
    for ((i=0; i < ${#menu_selected_items[@]}; i++)); do
        
        if [[ ${menu_selected_items[i]} == "notion" ]]; then
            echo "Notion をインストールしています"
            brew cask install notion
        fi
        
    done
}



main
