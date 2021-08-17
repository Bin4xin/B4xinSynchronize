#!/bin/bash
##import color_print_func. use print func to echo to console.
source ./functions/color_print_fun.sh

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
echo  "[备份计划] >> [crontab -l > config/golbal_var.sh.]..."
info_show "● [Info]任务1: $Crontab_task_show_bakUP ----------> DONE....."
sleep 0.9
echo "[写入计划] >> [config/golbal_var.sh]..."
info_show "● [Info]任务2: $Crontab_task_show_addPlan ----------> DONE....."
sleep 0.9
echo "[执行计划] << [config/golbal_var.sh]..."
info_show "● [Info]任务3: $Crontab_task_show_runCron ----------> DONE....."
sleep 0.9
}

CrontabPlan_Main(){
	#bakup crontab plan to files(in this progarm:config/golbal_var.sh)
	printf "\033[49;33m备份您的当前的Crontab计划\033[0m\n"
	crontab -l >> config/golbal_var.sh && crontab -l >> config/golbal_var.bak
	##
  cat >$work_path/.git/hooks/HOOK_B4xinSynchronize<<EOF
#!/bin/bash
PATH=$PATH:/usr/bin
cd $work_path && git checkout -f
EOF

	##
	#add new plan >> config/golbal_var.sh
	cat >>config/golbal_var.sh<<EOF
* * * * * bash $work_path/.git/hooks/HOOK_B4xinSynchronize
EOF
  #exec newest cron plan
  printf "\033[49;33m执行添加最新的Crontab计划\033[0m\n"
  crontab config/golbal_var.sh
}

Print_Auto_Show(){
  Crontab_task_show_bakUP="[Crontab定时计划备份]"
  Crontab_task_show_addPlan="[写入Crontab定时计划]"
  Crontab_task_show_runCron="[执行Crontab定时计划]"
  printf "%-5s %-20s %-20s %-20s\n" 任务进行中: $Crontab_task_show_bakUP $Crontab_task_show_addPlan $Crontab_task_show_runCron
}
Check_Crontab_list(){
  info_show "[`date +%Y/%m/%d/%T`] [Info] 当前最新Crontab计划表为："
 # printf "\033[49;33m当前最新Crontab计划表为：\033[0m\n"
  crontab -l |bash functions/draw_table.sh -4
}
Run_Main(){
  info_show "[`date +%Y/%m/%d/%T`] [Info] 运行中..." && Print_Auto_Show
  CrontabPlan_Main && Loading_Percent_Show
  printf "\n"
  Check_Crontab_list
  info_show "[`date +%Y/%m/%d/%T`] [Info] ALL DONE..."
  echo
}

work_path="$1"
if [ ! -n "$work_path" ];then
  info_show "[`date +%Y/%m/%d/%T`] [Info] Usage: bash Sserver.sh <path/to/git_workSpace/>"
  critical "[`date +%Y/%m/%d/%T`] [CRITICAL] ERROR: parameter error"
  exit;
fi
Run_Main