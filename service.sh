list=$(cat apps.txt)
columnsApps=$(cat apps.txt | grep -o " " | wc -l)
i=$((0))
function main {
    echo "" > times.csv
    for str in ${list[@]}; do
        i=$(($i + 1))
        columns=$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | grep -o " " | wc -l)
        if [[ "$i" == "1" ]]; then
            if [[ "$columns" == "7" ]]; then
                main
            fi
            sed -i " 1 s/.*/&$str/" times.csv
            printf "\n\n" >> times.csv
            case "$columns" in
                "4") sed -i " 2 s/.*/&$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | awk '{print $2, $3}' | tr ' ' :)/" times.csv ;;
                "5") sed -i " 2 s/.*/&$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | awk '{print $1, $2}' | tr ' ' :)/" times.csv ;;
            esac
        else
            sed -i " 1 s/.*/&,$str/" times.csv
            case "$columns" in
                "4") sed -i " 2 s/.*/&,$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | awk '{print $2, $3}' | tr ' ' :)/" times.csv ;;
                "5") sed -i " 2 s/.*/&,$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | awk '{print $1, $2}' | tr ' ' :)/" times.csv ;;
            esac
        fi
    done
    i=$((0))
    for apps in ${list[@]}; do
        ./timeout $apps
    done
    sleep 60
    main
}
main
