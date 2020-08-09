#!/bin/bash

# 変態実装メモ 配列を引数に入れる代わりに、配列を格納した変数の名前を引数に入れる。evalコマンドとechoコマンドを組み合わせ、引数から変数名を出し、それを評価したら配列として使える。
# $(eval echo '${'$1'[@]''}')

#　メニュー
function menu {
    local cursor=0
    
    local selected=()
    for j in $(eval echo '${!'$1'[@]''}'); do
        selected+=("○")
    done
    
    # Enter を押すまでループ
    while true; do
        clear
        local i=0
        # メニューを描画
        for i in $(eval echo '${!'$1'[@]''}'); do
            # カーソルが要素を指しているかどうか
            if [ $cursor == $i ]; then
                # 未選択の要素なら○、選択中なら◉と表示される
                # echo "> ${selected[i]} ${modules[$i]}"
                # printf "> ${selected[i]} ${menu_items_name[i]}\n  ${menu_items_desc[i]}\n\n"
                # echo $(eval echo '${'$3'['0']''}')
                printf "> ${selected[i]} $(eval echo '${'$2'['$i']''}')\n  $(eval echo '${'$3'['$i']''}')\n\n"
            else
                # echo "  ${selected[i]} ${modules[$i]}"
                printf "  ${selected[i]} $(eval echo '${'$2'['$i']''}')\n  $(eval echo '${'$3'['$i']''}')\n\n"
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
                    cursor=$(( $(eval echo '${#'$1'[@]''}')-1 ))
                else
                    let cursor--
                fi
            ;;
            "[B") # 下矢印キー
                if [ $cursor -eq $(( $(eval echo '${#'$1'[@]''}')-1 )) ]; then
                    let cursor=0
                else
                    let cursor++
                fi
            ;;
            "")   # エンターキー
                menu_selected_items=()
                local count=0
                for out in ${selected[@]}; do
                    if [ $out == "◉" ]; then
                        # menu_selected_items+=(${menu_items[count-1]})
                        menu_selected_items+=("$(eval echo '${'$1'[count]''}')")
                    fi
                    let count++
                done
                # echo ${menu_selected_items[@]}
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
