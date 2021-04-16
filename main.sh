#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

##Incoming running mode parameters exchange to galbol para.
run_mode="$1"
##use if statement to judge detection working mode
#set type to dw==diferent workspace: your blog (jekyll server) work space different from git workspace;
#such as your jekyll build '_site' dir equals to ~/blog/jekyll/www/_site/ , git(master) dir equals to ~/blog/git/{yourname}.github.io/
#so use {dw}.
run_Main(){
  if [ $run_mode = "dw" ];then
    exec_mode=$(echo 'different worksace(dw) mode')
    echo -e "mode:${exec_mode}"
    read -p "your git (local) workspace path:" gitPath;
    read -p "your jekyll (build) workspace path:" buildPath;
    #cd $path && pwd && touch test.txt
    echo -e $gitPath
    echo -e $buildPath
    differentWorkspace_mode_fun

  elif [ $run_mode = "sw" ];then
    exec_mode=$(echo 'same worksace(sw) mode')
    echo -e "mode:${exec_mode}"
    sameWorkspace_mode_fun
  fi
}


differentWorkspace_mode_fun(){
  echo -e "+----------------------------------------------+"
  echo    "|-im here(in differentWorkspace_mode_fun now!)-|"
  echo -e "+----------------------------------------------+"
  #cd $gitPath && pwd
  #cd $buildPath && pwd
  if [ $gitPath = $buildPath ];then
    read -p "same path?change to sw mode?(y/n):" ensure_ModeChange;
    while [ "$ensure_ModeChange" != 'y' ]&& [ "$ensure_ModeChange" != 'n' ]
    do
	    read -p "·[*Warn]: PLZ type in (y/n): " ensure_ModeChange;
    done
    if [ "$ensure_ModeChange" == 'n' ];then
      echo "·[*Info]: your chioce is no.so stop this program..."
      sleep 1
      exit;
    fi
    sameWorkspace_mode_fun
  fi
  #mkdir $buildPath/_site/ && touch $buildPath/_site/create_by_bash.sh
  #mkdir $gitPath/_site/
  cd $buildPath/ && cp -R ./* $gitPath/
  #cd $buildPath && pwd
  echo -e "\033[34m·[*Info]Synchronize copy is running... \033[0m"
  sleep 1
  Synchronize_update_fun
}

sameWorkspace_mode_fun(){
  echo "im here(in sameWorkspace_mode_fun now!)"
  #echo -e "--------------------------------------------"
}
Synchronize_update_fun(){
  #if git,then
  echo -e "\033[34m·[*Info]Synchronize update is running... \033[0m"
  cd $gitPath && git add .
  cd $gitPath && git commit -m "B4xinSynchronize 1st commit"
  cd $gitPath && git push
  sleep 1
  exit
}

read -p "·[*Info] are you sure?(y/n): " go;
while [ "$go" != 'y' ] && [ "$go" != 'n' ]
do
	read -p "·[*Warn]: PLZ type in (y/n): " go;
done

if [ "$go" == 'n' ];then
	exit;
fi

##
if [ "$run_mode" != 'dw' ] && [ "$run_mode" != 'sw' ];then
  echo -e "\033[31m·[*Warn]ERROR: parameter error; \033[0m"
  echo -e "\033[34m·[*Info]Usage: bash main.sh [dw/sw] \033[0m"
  exit;
fi
run_Main