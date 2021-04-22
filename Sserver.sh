#!/bin/bash

Loading_Percent_Show(){
i=0
str=""
while [ $i -le 50 ]
do
    let index=i%4
    if [ $i -le 5 ]; then
        let bg=34
    elif [ $i -le 30 ]; then
        let bg=33
    elif [ $i -le 45 ]; then
        let bg=31
    else
        let bg=32
    fi
    printf "[\033[${bg}m%-s\033[0m %3c %c\r" "$str>]"
    sleep 0.01
    let i=i+1
    str+="="
done
sleep 0.3
printf "\n"
echo "备份计划 >> [crontab -l > /tmp/cornconf.bak]..."
printf "%-5s %-15s %-45s\n" []任务: $Crontab_task_show_bakUP "----------> "DONE.....
sleep 0.9
echo "写入计划 >> [/tmp/cornconf.bak]..."
printf "%-5s %-15s %-45s\n" []任务: $Crontab_task_show_addPlan "----------> "DONE.....
sleep 0.9
echo "执行计划 << [/tmp/cornconf.bak]..."
printf "%-5s %-15s %-45s\n" []任务: $Crontab_task_show_runCron "----------> "DONE.....
sleep 0.9
}

Add_CrontabPlan_Main(){
	#crontab scripts command run.
	printf "\033[49;33m$Crontab_Task\033[0m\n"
#	crontab -l > /tmp/cornconf.bak
#	echo "* * * * * git checkout -f" >> /tmp/cornconf.bak
#	crontab /tmp/cornconf.bak
  #set some var.
	echo "plz check your corn plan in  /tmp/cornconf.bak"
}

Print_Auto_Show(){
  Crontab_task_show_bakUP="[Crontab定时计划备份]"
  Crontab_task_show_addPlan="[写入Crontab定时计划]"
  Crontab_task_show_runCron="[执行Crontab定时计划]"
  printf "%-5s %-20s %-20s %-20s\n" 任务进行中: $Crontab_task_show_bakUP $Crontab_task_show_addPlan $Crontab_task_show_runCron
  Crontab_Task=`crontab -l`
  #printf "\033[49;33m$Crontab_Task\033[0m\n"
}
Check_Crontab_list(){
  printf "当前最新计划表为：\n"
  #printf "\033[49;34m$Crontab_Task\033[0m|\n"
  cat /tmp/cornconf.bak|bash draw_table.sh -4
}
Run_Main(){
  Print_Auto_Show
  Add_CrontabPlan_Main && Loading_Percent_Show
  printf "\n"
  Check_Crontab_list
  printf "ALL DONE..."
}

Run_Main