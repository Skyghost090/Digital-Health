list=$(cat apps.txt)
first=""

function verify {
    first=""
    for apps in ${list[@]}; do
        ./timeout $apps
    done
}

function main {
    list=$(cat apps.txt)
    echo "" > times.csv
    for str in ${list[@]}; do
        columns=$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | grep -o " " | wc -l)
        if [[ "$first" == "" ]]; then
            if [[ $(($columns)) == $((7)) ]]; then
                echo "7 columns"
            else
                echo first
                sed -i " 1 s/.*/&$str/" times.csv
                printf "\n\n" >> times.csv
                first="."
                case "$columns" in
                    "4") sed -i " 2 s/.*/&$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | awk '{print $2, $3}' | tr ' ' :)/" times.csv ;;
                    "5") sed -i " 2 s/.*/&$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | awk '{print $1, $2}' | tr ' ' :)/" times.csv ;;
                esac
            fi
        else
            if [[ $(($columns)) == $((7)) ]]; then
                echo "7 columns"
            else
                sed -i " 1 s/.*/&,$str/" times.csv
                case "$columns" in
                    "4") sed -i " 2 s/.*/&,$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | awk '{print $2, $3}' | tr ' ' :)/" times.csv ;;
                    "5") sed -i " 2 s/.*/&,$(ps -o etime $(pidof $str) | sed '2!d' | tr :- ' ' | awk '{print $1, $2}' | tr ' ' :)/" times.csv ;;
                esac
            fi
        fi
    done
    verify
    sleep 60
    main
}
main
