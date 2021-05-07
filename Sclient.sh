#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
##use if statement to judge detection working mode
#set type to dw==diferent workspace: your blog (jekyll server) work space different from git workspace;
#such as your jekyll build '_site' dir equals to ~/blog/jekyll/www/_site/ , git(master) dir equals to ~/blog/git/{yourname}.github.io/
#so use {dw}.
run_Main(){
  #Determine the operating mode of the incoming parameters
  #mode dw to run.
  if [ $run_mode = "dw" ];then
    exec_mode=$(echo 'different worksace(dw) mode')
    echo -e "● [Info] Running mode is :${exec_mode} mode now"
    read -p "● [Info] Plz type in your git (local) workspace path:" gitPath;
    read -p "● [Info] Plz type in your jekyll (build) workspace path:" buildPath;
    #cd $path && pwd && touch test.txt
    echo -e $gitPath
    echo -e $buildPath
    ##here to exchange modeFunction.Just another Determine
    differentWorkspace_mode_fun
  ##mode sw to run.
  elif [ $run_mode = "sw" ];then
    exec_mode=$(echo 'same worksace(sw) mode')
    echo -e "mode:${exec_mode}"
    sameWorkspace_mode_fun
  fi
}
##in beta
Remember_Me_Fun(){
if [ -s "Golbal_Var.sh" ];then
	source ./Golbal_Var.sh
	echo "Golbal_Var存在,next."
	#Ask_From_Me
elif [ ! -s "Golbal_Var.sh" ];then
	#statements
	echo "error! start to echo var to files;)"
	echo testPra=$testPra >> config/Golbal_Var.sh
	echo testPra1=$testPra >> config/Golbal_Var.sh
	echo testPra2=$testPra >> config/Golbal_Var.sh
fi
Ask_From_Me
}
##in beta
Ask_From_Me(){
	source ./Golbal_Var.sh
	echo "looks you have var files now!"
	echo $testPra
	echo $testPra1
	echo $testPra2
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
	    read -p "● [Warn]: PLZ type in (y/n): " ensure_ModeChange;
    done
    if [ "$ensure_ModeChange" == 'n' ];then
      echo "● [Info]: your chioce is no.so stop this program..."
      sleep 1
      exit;
    fi
    sameWorkspace_mode_fun
  fi
  ##start to use rsync(update & delete) all dir excpet '--exclude0-from'
  rsync -avpz --delete-before --exclude-from exclue_delete_files.txt $buildPath/ $gitPath/
  echo -e "\033[34m● [Info]Synchronize copy is running... \033[0m"
  sleep 1
  cd $gitPath/ && Synchronize_update_fun
}

sameWorkspace_mode_fun(){
  echo "im here(in sameWorkspace_mode_fun now!)"
  whereAmI=`pwd`
  cd $whereAmI && Synchronize_update_fun
  #echo -e "--------------------------------------------"

}
Synchronize_update_fun(){
  #echo $whereIam
  #if git,then
  update=`date -R`
  echo -e "\033[34m● [Info]Synchronize update is running... \033[0m"
  git add .
  git commit -m "$update commit by B4xinSynchronize."
  git push
  sleep 1
  exit
}

##Define Incoming running mode parameters exchange to galbol para.
run_mode="$1"

##firstly to run this program. Read user input to ensure.
read -p "● [Info] Are you sure?(y/n): " go;
while [ "$go" != 'y' ] && [ "$go" != 'n' ]
do
	read -p "● [Warn]: PLZ type in (y/n): " go;
done

if [ "$go" == 'n' ];then
	exit;
fi
##Determine whether the incoming parameters are recognized by the program
##otherwise the program will exit abnormally, let the program judge by itself.
if [ "$run_mode" != 'dw' ] && [ "$run_mode" != 'sw' ];then
  echo -e "\033[31m● [Warn]ERROR: parameter error; \033[0m"
  echo -e "\033[34m● [Info]Usage: bash Sclient.sh [dw/sw] \033[0m"
  exit;
fi
##so,what i want to show you exactly is:
##Clear program framework and running status, good code style will make work easier
run_Main
##redirect to main func , and main func defined what program will do next one by one or run Concurrently.