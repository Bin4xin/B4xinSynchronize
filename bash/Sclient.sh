#!/bin/bash
whereAmI=$(pwd)
source ./functions/color_print_fun.sh
source ./functions/banners.sh
source ./functions/proxy.sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

##
#use if statement to judge detection working mode
#set type to dw==diferent workspace: your blog (jekyll server) work space different from git workspace;
#such as your jekyll build '_site' dir equals to ~/blog/jekyll/www/_site/ , git(master) dir equals to ~/blog/git/{yourname}.github.io/
#so use {dw}.
##

run_Main() {
  proxy_main
  ##Determine the operating mode of the incoming parameters
  ##mode dw to run.
  if [ $run_mode = "dw" ]; then
    info_show "[`date +%Y/%m/%d/%T`] [Info] Running mode is: $run_mode mode now"
    differentWorkspace_mode_fun
  ##mode sw to run.
  elif [ $run_mode = "sw" ]; then
    info_show "[`date +%Y/%m/%d/%T`] [Info] Running mode is: $run_mode mode now"
    sameWorkspace_mode_fun
  ##
  elif [ $run_mode = "config" ]; then
    Remember_Me_Fun
  fi
}
##~in beta~ Wed, 19 May 2021 10:38:03 +0800
# It looks running good
Remember_Me_Fun() {
  if [ ! -s "./config/user_config.sh" ]; then
    touch config/user_config.sh
    echo testPra=$testPra >>config/user_config.sh
    echo testPra1=$testPra >>config/user_config.sh
    echo testPra2=$testPra >>config/user_config.sh

  elif [ -s "./config/user_config.sh" ]; then
    #statements
    echo "user_config存在."
  fi
  Ask_From_Me
}
##~in beta~ Wed, 19 May 2021 10:38:17 +0800
##ask_from_me() : to detected user config info. detected user's config quickly.
Ask_From_Me() {
  source ./config/user_config.sh
  # shellcheck disable=SC2154
  common_show "Detected user's conf files in ./config/user_config.sh"
  array=($(cat ./config/user_config.sh | grep options_project | awk -F'"' '{i = 1; while (i <= NF) {if ($i ~/=$/) print $(i+1);i++}}'))
  info_show "[`date +%Y/%m/%d/%T`] [Info] Detected :"
  for i in "${!array[@]}"; do
    common_show "[Repo $i] : ${array[$i]}"
    sleep 0.1
  done

}
differentWorkspace_mode_fun() {
  Ask_From_Me
  optional_msg=$(common_show "Choose your Repos option (default option: 0)[0/1/..] : ")
  read -p "$optional_msg" user_option_input
  optional_projects_gitPath=_dw_${array[user_option_input]}_gitPath
  optional_projects_buildPath=_dw_${array[user_option_input]}_buildPath
  eval optional_repo_gitPath=$(echo \$$optional_projects_gitPath)
  eval optional_repo_buildPath=$(echo \$$optional_projects_buildPath)
  ##start to use rsync(update & delete) all dir excpet '--exclude0-from'
  ##bash func test mode.
  git_valid_check
  info_show "[`date +%Y/%m/%d/%T`] [Info] running Synchronize update from $optional_repo_buildPath to $optional_repo_gitPath"
  rsync -avpz --delete-before --exclude-from functions/exclue_delete_files.txt $optional_repo_buildPath/ $optional_repo_gitPath/
  cd $optional_repo_gitPath && Synchronize_update_fun
}

sameWorkspace_mode_fun() {
  Ask_From_Me
  optional_msg=$(common_show "Choose your Repos option (default option: 0)[0/1/..] : ")
  read -p "$optional_msg" user_option_input
  optional_projects_gitPath=_sw_${array[user_option_input]}_gitPath
  eval optional_repo_gitPath=$(echo \$$optional_projects_gitPath)
  git_valid_check
  info_show "[`date +%Y/%m/%d/%T`] [Info] Directly jumping to Synchronize update..."
  cd $optional_repo_gitPath && Synchronize_update_fun
}

git_valid_check() {
  check_vaild_gitRepo=$(cd $optional_repo_gitPath && git rev-parse --is-inside-work-tree)
  if [ $check_vaild_gitRepo = "true" ]; then
    common_show "[`date +%Y/%m/%d/%T`] $optional_repo_gitPath is a valid git repository. \n But the current working directory may not be the top level. Check the output of the git rev-parse command if you care)"
  else
    underline_critical_show "Invalid git repository!!"
    exit
  fi
}

Synchronize_update_fun() {
  #if git,then
  info_show "[`date +%Y/%m/%d/%T`] [Info] Synchronize update is running in $optional_repo_gitPath"
  # i want to add commit names Distinguish by every different files (git files name) here
  # such as :
  # README.MD  README.MD file Mon, 31 May 2021 22:54:09 +0800 commit by B4xinSynchronize.
  # but exactly: This feature has not yet been implemented
  #
  # git_commit_filename=`git log --pretty=format:"" --name-only  -1`
  commit_author=`git config --global --list|grep user.name|awk -F"=" '{print $2}'`
  echo -e "\033[32m[`date +%Y/%m/%d/%T`] [Info] Synchronize update is running. \033[0m"
  git add .
  git commit -m "[`date +%Y/%m/%d/%T`] B4xinSync: commit by $commit_author."
  git push -u origin master
  sleep 1
  proxy_unset
  exit
}

##Define Incoming running mode parameters exchange to galbol para.
##firstly to run this program. Read user input to ensure.
run_mode="$1"
read_msg=$(echo -e "\033[32m[`date +%Y/%m/%d/%T`] [Info] Are you sure?(y/n): \033[0m")
warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")


if [ "$run_mode" != 'dw' ] && [ "$run_mode" != 'sw' ] && [ "$run_mode" != 'config' ]; then
  underline_critical_show "[`date +%Y/%m/%d/%T`] [CRITICAL] ERROR INPUT! \ntype in parameter error \nUsage: bash Sclient.sh [ config|dw|sw ]"
  exit
fi

read -p "$read_msg" go
while [ "$go" != 'y' ] && [ "$go" != 'n' ] && [ "$go" != '' ]; do
  read -p "$warn_msg" go
done

if [ "$go" == 'n' ]; then
  underline_warn_show "[`date +%Y/%m/%d/%T`] [Warn] Detected user input [no]. \nQuit!"
  sleep 0.9
  exit
fi
##Determine whether the incoming parameters are recognized by the program
##otherwise the program will exit abnormally, let the program judge by itself.

##so,what i want to show you exactly is:
##Clear program framework and running status, good code style will make work easier
run_Main
##redirect to main func , and main func defined what program will do next one by one or run Concurrently.
