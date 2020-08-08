#!/bin/bash

cursor=0

#　メニュー
menu() {
    local selected=()
    for j in ${!modules[@]}; do
        selected+=("○")
    done
    
    # Enter を押すまでループ
    while true; do
        clear
        local i=0
        # メニューを描画
        for i in "${!modules[@]}"; do
            # カーソルが要素を指しているかどうか
            if [ $cursor == $i ]; then
                # 未選択の要素なら○、選択中なら◉と表示される
                # echo "> ${selected[i]} ${modules[$i]}"
                printf "> ${selected[i]} ${modules_name[i]}\n  ${modules_desc[i]}\n\n"
            else
                # echo "  ${selected[i]} ${modules[$i]}"
                printf "  ${selected[i]} ${modules_name[i]}\n  ${modules_desc[i]}\n\n"
            fi
        done
        
        # キー入力を取得
        local key=""
        IFS= read -rsn1 key
        # エスケープ文字を含むキーを判定
        if [ "$key" == $'\x1b' ]; then
            read -rsn2 key
        fi
        case $key in
            "[A") # 上矢印キー
                
                if [ $cursor == 0 ]; then
                    cursor=$(( ${#modules[@]}-1 ))
                else
                    let cursor--
                fi
            ;;
            "[B") # 下矢印キー
                if [ $cursor -eq $(( ${#modules[@]}-1 )) ]; then
                    let cursor=0
                else
                    let cursor++
                fi
            ;;
            "")   # エンターキー
                setup_selected=()
                local count=0
                for out in ${selected[@]}; do
                    let count++
                    if [ $out == "◉" ]; then
                        setup_selected+=(${modules[count-1]})
                    fi
                done
                return
            ;;
            " ")  # スペースキー
                if [ "${selected[cursor]}" == "◉" ]; then
                    selected[cursor]="○"
                else
                    selected[cursor]="◉"
                fi
            ;;
        esac
    done
}
