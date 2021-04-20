#!/bin/bash

Loading_Percent_Show(){
i=0
str=""
arry=("\\" "|" "/" "-")
while [ $i -le 50 ]
do
    let index=i%4
    if [ $i -le 5 ]; then
        #let color=44
        let bg=34
    elif [ $i -le 30 ]; then
        #let color=43
        let bg=33
    elif [ $i -le 45 ]; then
        #let color=41
        let bg=31
    else
        #let color=42
        let bg=32
    fi
    printf "[\033[${color};${bg}m%-s\033[0m %3c %c\r" "$str>]" "${arry[$index]}]" 
    sleep 0.05
    let i=i+1
    str+="="
done
echo "task : '$Crontab_task_show_runCron' DONE..."
echo "over"
}

Add_CrontabPlan_Main(){
	
	#crontab scripts command run.
	crontab -l > /tmp/cornconf.bak 
	echo "* * * * * hostname >> /tmp/tmp_bash.txt" >> /tmp/cornconf.bak 
	crontab /tmp/cornconf.bak
	#set
	Crontab_task_show_bakUP="bakup crontab plan"
	Crontab_task_show_addPlan="Add auto Synchronize crontab plan"
	Crontab_task_show_runCron="run crontab scripts"
	
	echo "plz check your corn plan in  /tmp/cornconf.bak"
	#echo "task : '$Crontab_task_show_runCron' DONE..."
	 
}

Run_Main(){
	Add_CrontabPlan_Main && Loading_Percent_Show 
}
#echo "---------"
#foo="id && whoami"
#foo=id
#echo $foo
#$foo
#$($foo)
#echo "---------"
printf "im adding now !!!"
Run_Main