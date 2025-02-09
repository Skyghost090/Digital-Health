param1=$1
echo "$(cut --complement -d',' -f$(cat timeout.csv | tr , ' ' | awk -v RS=' ' "/$param1/{print NR; exit}") timeout.csv)" > timeout.csv
