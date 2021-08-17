#!/bin/bash
source ./functions/color_print_fun.sh
# spin[1]="←"
# spin[2]="↖"
# spin[3]="↑"
# spin[4]="↗"
# spin[5]="→"
# spin[6]="↘"
# spin[7]="↓"
# spin[8]="↙"

startSpin(){
spin[1]="⣾"
spin[2]="⣽"
spin[3]="⣻"
spin[4]="⢿"
spin[5]="⡿"
spin[6]="⣟"
spin[7]="⣯"
spin[8]="⣷"
echo -n "${spin[0]}"
while true
do
  for i in "${spin[@]}"
  do
    echo -ne "\b$i"
    sleep 0.1
  done
done
}

endSpin(){
    printf '\r%s\n' "$*"
    sleep 0.1
}

flag(){
	echo "flag func!"
	echo $flag
	echo -ne "\r"

}

for k in {1..10};do 
	echo 192.168.1.$k &&sleep 0.2  

done

info_show "[`date +%Y/%m/%d/%T`] [Info] ALL DONE"
echo $flag
flag

until [ "$k" -lt 9 ]; do  
	startSpin
done


# echo  "[备份计划] >> [crontab -l > config/golbal_var.sh.]..."
# info_show "● [Info]任务1: $Crontab_task_show_bakUP ----------> DONE....."
# sleep 0.9
# echo "[写入计划] >> [config/golbal_var.sh]..."
# info_show "● [Info]任务2: $Crontab_task_show_addPlan ----------> DONE....."
# sleep 0.9
# echo "[执行计划] << [config/golbal_var.sh]..."
# info_show "● [Info]任务3: $Crontab_task_show_runCron ----------> DONE....."
# sleep 0.9


# whereAmI=`pwd`
# source $whereAmI/functions/banners.sh

# commit_author=`git config --global --list|grep user.name|awk -F"=" '{print $2}'`


# while true; do
# 	echo "[`date +%Y/%m/%d/%T`]: commit by $commit_author."
# 	sleep 1
# done

