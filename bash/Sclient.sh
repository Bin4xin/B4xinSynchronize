#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
source ./functions/color_print_fun.sh
##
#use if statement to judge detection working mode
#set type to dw==diferent workspace: your blog (jekyll server) work space different from git workspace;
#such as your jekyll build '_site' dir equals to ~/blog/jekyll/www/_site/ , git(master) dir equals to ~/blog/git/{yourname}.github.io/
#so use {dw}.
##
run_Main(){
  ##Determine the operating mode of the incoming parameters
  ##mode dw to run.
  if [ $run_mode = "dw" ];then
    exec_mode=$(echo 'different worksace(dw) mode')
    typein_gitPath=$(echo -e "\033[32m● [Info] Plz type in your git (local) workspace path: \033[0m")
    typein_buildPath=$(echo -e "\033[32m● [Info] Plz type in your jekyll (build) workspace path: \033[0m")
    echo -e "\033[32m● [Info] Running mode is: ${exec_mode} now \033[0m"
    read -p "$typein_gitPath" gitPath;
    read -p "$typein_buildPath" buildPath;
    echo -e "\033[42;37m$gitPath\033[0m"
    echo -e "\033[42;37m$buildPath\033[0m"
    ## here to exchange modeFunction. Just another Determine
    differentWorkspace_mode_fun
    ##mode sw to run.
  elif [ $run_mode = "sw" ];then
    exec_mode=$(echo 'same worksace(sw) mode')
    echo -e "\033[32m● [Info] Running mode is: ${exec_mode} now \033[0m"
    sameWorkspace_mode_fun
  elif [ $run_mode = "config" ];then
    Remember_Me_Fun
  fi
}
##in beta
Remember_Me_Fun(){
if [ ! -s "./config/user_config.sh" ];then

  touch config/user_config.sh
	echo testPra=$testPra >> config/user_config.sh
	echo testPra1=$testPra >> config/user_config.sh
	echo testPra2=$testPra >> config/user_config.sh

elif [ -s "./config/user_config.sh" ];then
	#statements
	echo "Golbal_Var存在,next."
fi
Ask_From_Me
}
##in beta
Ask_From_Me(){
	source ./config/user_config.sh
	echo "looks you have var files now!"
	array=($(cat config/user_config.sh|grep options_project|awk -F'"' '{i = 1; while (i <= NF) {if ($i ~/=$/) print $(i+1);i++}}'))
#  for(( i=0;i<${#array[@]};i++)) do
#  #${#array[@]}获取数组长度用于循环
#  underline_info_show "[Repo $i]:"${array[i]};
#  done
#  i=0
#  options_projects="dw."${array[i]}
#  echo $options_projects
#  run_mode1='dw'
#  echo ${run_mode1}
#  eval temp=$(echo \$$options_projects)
#  echo $temp
  for i in "${!array[@]}";
  do
      underline_info_show  "● [Info] Detected [Repo $i]:" "${array[$i]}"
      sleep 0.9
  done
  # shellcheck disable=SC2154
  optional_msg=$(echo -e "\033[01mChoose your Repos option (default option: 0)[0/1/..] : \033[0m")
  read -p "$optional_msg" user_option_input;
  echo $run_mode
  optional_projects_gitPath=_dw_${array[user_option_input]}_gitDir
  optional_projects_buildPath=_dw_${array[user_option_input]}_buildDir
  eval optional_repos=$(echo \$$optional_projects)
  #cd $optional_repos && pwd
  if [ ! -d "$optional_repos/.git" ]; then
    underline_warn_show  "● [Warn] Detected [Repo $user_option_input]:" "${array[user_option_input]} (not git Repos x)"
    underline_warn_show  "PLZ check your optional git "[${array[user_option_input]}]" path"
  elif [ -d "$optional_repos/.git" ]; then
    underline_info_show  "Detected [Repo $user_option_input]:" "${array[user_option_input]} (.git Repos √)"
  fi

}

differentWorkspace_mode_fun(){
  if [ $gitPath = $buildPath ];then
    #ensure_msg=$(echo -e '\033[32m● [Info] detected same path put in. Change to sw mode ?(y/n): \033[0m')
    ensure_msg=$(info '● [Info] Detected same path type in. Change to sw mode? (y/n):')
    read -p "$ensure_msg" ensure_ModeChange;
    while [ "$ensure_ModeChange" != 'y' ]&& [ "$ensure_ModeChange" != 'n' ] && [ "$ensure_ModeChange" != '' ]
    do
	    read -p "$warn_msg" ensure_ModeChange;
    done
    if [ "$ensure_ModeChange" == 'n' ]; then
        underline_warn_show "● [Warn] Detected user input [no]. \nQuit!"
        sleep 1
        exit;
    fi
  fi
  ##start to use rsync(update & delete) all dir excpet '--exclude0-from'
  ##rsync -avpz --delete-before --exclude-from functions/exclue_delete_files.txt $buildPath/ $gitPath/
  ##bash func test mode.
  underline_info_show "● [Info] [SW] mode ensure. Synchronize copy is running..."
  sameWorkspace_mode_fun
  sleep 1
}

sameWorkspace_mode_fun(){
  info "● [Info] Directly jumping to Synchronize update..."
  cd $whereAmI && Synchronize_update_fun
}
Synchronize_update_fun(){
#if git,then
  echo 'update!' && info "● [Info] Synchronize update is running in $whereAmI"
#  update_commit=`date -R`
#  echo -e "\033[32m● [Info] Synchronize update is running... \033[0m"
#  git add .
#  git commit -m "$update_commit commit by B4xinSynchronize."
#  git push
#  sleep 1
#  exit
}

##Define Incoming running mode parameters exchange to galbol para.
##firstly to run this program. Read user input to ensure.
run_mode="$1"
read_msg=$(echo -e "\033[32m● [Info] Are you sure?(y/n): \033[0m")
warn_msg=$(echo -e "\033[33m● [Warn] PLZ type in (y/n): \033[0m")
whereAmI=$(pwd)

if [ "$run_mode" != 'dw' ] && [ "$run_mode" != 'sw' ] && [ "$run_mode" != 'config' ];then
  underline_critical_show "● [CRITICAL] ERROR INPUT! \ntype in parameter error \nUsage: bash Sclient.sh [ config | dw/sw ]"
  exit;
fi

read -p "$read_msg" go;
while [ "$go" != 'y' ] && [ "$go" != 'n' ] && [ "$go" != '' ]
do
	read -p "$warn_msg" go;
done

if [ "$go" == 'n' ];then
  underline_warn_show "● [Warn] Detected user input [no]. \nQuit!"
  sleep 0.9;
	exit;
fi
##Determine whether the incoming parameters are recognized by the program
##otherwise the program will exit abnormally, let the program judge by itself.

##so,what i want to show you exactly is:
##Clear program framework and running status, good code style will make work easier
run_Main
##redirect to main func , and main func defined what program will do next one by one or run Concurrently.