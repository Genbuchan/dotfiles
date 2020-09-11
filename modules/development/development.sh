#!/bin/bash

softwares=(
    "vscode"
    "hyper"
    "docker"
    "zsh"
)

softwares_name=(
    "Visual Studio Code"
    "Hyper"
    "Docker"
    "Zsh"
)

softwares_desc=(
    "拡張可能なコードエディタ"
    "JavaScript で拡張できるターミナル"
    "コンテナ型の仮想環境"
    "拡張可能な CLI シェル"
)

function main() {
    ls ../../installer/
    . ../../installer/menu.sh
    menu "softwares" "softwares_name" "softwares_desc"
    for ((i=0; i < ${#menu_selected_items[@]}; i++)); do
        
        if [[ ${menu_selected_items[i]} == "vscode" ]]; then
            echo "Visual Studio Code をインストールしています"
            brew cask install vscode
        fi
        
        if [[ ${menu_selected_items[i]} == "hyper" ]]; then
            echo "Hyper をインストールしています"
            # brew cask install hyper
            cp ./config/.hyper.js ~
        fi
        
        if [[ ${menu_selected_items[i]} == "docker" ]]; then
            echo "Docker をインストールしています"
            brew cask install docker
        fi
        
        if [[ ${menu_selected_items[i]} == "zsh" ]]; then
            echo "Zsh をインストールしています"
            # brew install zsh
            cp ./config/.zshrc ~
        fi
        
    done
}



main
