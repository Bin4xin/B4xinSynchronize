#!/bin/bash

Loading_Percent_Show(){
i=0
str=""
arry=("\\" "|" "/" "-")
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
    printf "[\033[${color};${bg}m%-s\033[0m %3c %c\r" "$str>]" "${arry[$index]}]" 
    sleep 0.05
    let i=i+1
    str+="="
done
echo "task : '$Crontab_task_show_bakUP' DONE..."
echo "task : '$Crontab_task_show_runCron' DONE..."
echo "task : '$Crontab_task_show_addPlan' DONE..."
#echo "task : '$Crontab_task_' DONE..."
echo "over..."
}

Add_CrontabPlan_Main(){
	#crontab scripts command run.
	crontab -l > /tmp/cornconf.bak 
	echo "* * * * * git checkout -f" >> /tmp/cornconf.bak
	crontab /tmp/cornconf.bak
	#set some var.
	Crontab_task_show_bakUP="BAKUP crontab plan"
	Crontab_task_show_addPlan="Add auto Synchronize crontab plan"
	Crontab_task_show_runCron="run crontab scripts"
	echo "plz check your corn plan in  /tmp/cornconf.bak"
}

Run_Main(){
  #source
	Add_CrontabPlan_Main && Loading_Percent_Show 
}
printf "im adding now !!!"
echo
Run_Main