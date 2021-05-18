#!/bin/bash
source ./functions/color_print_fun.sh

underline_critical_show "admin"

optional_msg=$(common_show "Choose your Repos option (default option: 0)[0/1/..] : ")

read -p "$optional_msg" user_option_input
common_show $optional_msg
outstand_info_show $optional_msg
underline_critical_show $optional_msg


optional_repo_gitPath="/Users/bin4xin/blog/github-code/bin4xin.github.io"

check_vaild_gitRepo=$(cd $optional_repo_gitPath && git rev-parse --is-inside-work-tree)

if [ $check_vaild_gitRepo = "true" ]; then
    echo "This is a valid git repository \n(but the current working directory may not be the top level.  Check the output of the git rev-parse command if you care)"
else
    echo "invalid"
fi



#if [ ! -d "$optional_repo_gitPath/.git" ]; then
#  underline_warn_show  "● [Warn] Detected [Repo $user_option_input]:" "${array[user_option_input]} (not git Repos x)"
#  underline_warn_show  "PLZ check your optional git "[${array[user_option_input]}]" path"
#  exit
#elif [ -d "$optional_repo_gitPath/.git" ]; then
#  outstand_info_show  "● [info] Detected [Repo $user_option_input]:" "${array[user_option_input]} (.git Repos √)"
#fi
