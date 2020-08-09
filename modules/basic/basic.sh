#!/bin/bash

function main() {
    install_brew
}

function install_brew() {
    echo "Homebrew をインストールしています…"
    curl -L "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash
}

main
