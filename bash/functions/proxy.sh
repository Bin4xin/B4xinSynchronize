#!/bin/bash
source ./functions/color_print_fun.sh

proxy_set(){
  set_command="export http_proxy='http://127.0.0.1:8082'; export HTTP_PROXY='http://127.0.0.1:8082'; export https_proxy='http://127.0.0.1:8082'; export HTTPS_PROXY='http://127.0.0.1:8082'"
  read_msg=$(echo -e "\033[33m● [Warn] set proxy to $set_command? (y/n): \033[0m")
  warn_msg=$(echo -e "\033[33m● [Warn] PLZ type in (y/n): \033[0m")
  read -p "$read_msg" ready
  while [ "$ready" != 'y' ] && [ "$ready" != 'n' ] && [ "$ready" != '' ]; do
    read -p "$warn_msg" ready
  done
  echo "while ok!"
  if [ "$ready" == 'n' ]; then
    underline_warn_show "● [Warn] Detected user input [no]. \nQuit!"
    sleep 0.9
  fi
  export
}

proxy_unset(){
#  warn_show "● [Warn] ready to unset Http Proxy Shell. "
#  unset_command=$(unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY)
  read_msg=$(echo -e "\033[33m● [Warn] ready to unset Http Proxy Shell? (y/n): \033[0m")
  warn_msg=$(echo -e "\033[33m● [Warn] PLZ type in (y/n): \033[0m")
  read -p "$read_msg" ready
  while [ "$ready" != 'y' ] && [ "$ready" != 'n' ] && [ "$ready" != '' ]; do
    read -p "$warn_msg" ready
  done
  echo "while ok!"
  if [ "$ready" == 'n' ]; then
    underline_warn_show "● [Warn] Detected user input [no]. \nQuit!"
    sleep 0.9
    exit
  fi
  echo "if ok!"
  unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY
  echo "ok!"
  export
}

proxy_main(){
detected_proxy=`export |grep http`
bool=`echo $?`
if [ $bool == 0 ]; then
  info_show "● [Info] Detected proxy export this shell"
elif [ $bool == 1 ]; then
  info_show "● [Info] Detected no proxy export this shell. setting Http Proxy Shell Export Line..."
  proxy_set
elif [ $bool != 1 ] && [ $bool != 0 ]; then
  warn_show "● [Warn] unknown detected. check/set shell proxy yourself if you need."
fi
}

