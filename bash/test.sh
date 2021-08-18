#!/bin/bash
source ./functions/color_print_fun.sh

############################################################################################################
##未完成：可以实现运行时加载动画，但是似乎是因为覆盖console的原因导致了在程序输出运行时加载动画同样有闪烁覆盖的效果，暂未解决##
############################################################################################################
# for k in {1..10};do echo -ne "\r1.1.1.1$k\t" && sleep 0.3;done &
# pid=$!

# spin[1]="▁"
# spin[2]="▃"
# spin[3]="▄"
# spin[4]="▅"
# spin[5]="▆"
# spin[6]="▇"
# spin[7]="▆"
# spin[8]="▅"
# spin[9]="▄"
# spin[10]="▃"
# echo -ne "[Running] ${spin[0]}"

# while [ "kill -0 $pid" ]; do
#   for i in "${spin[@]}" ; do
#         echo -ne "\b$i"
#         sleep 0.3
#   done
# done

############################################################################################################
SLEEP_DURATION=${SLEEP_DURATION:=1}  # default to 1 second, use to speed up tests

progress-bar() {
  local duration
  local columns
  local space_available
  local fit_to_screen  
  local space_reserved

  space_reserved=6   # reserved width for the percentage value
  duration=${1}
  columns=$(tput cols)
  space_available=$(( columns-space_reserved ))

  if (( duration < space_available )); then 
  	fit_to_screen=1; 
  else 
    fit_to_screen=$(( duration / space_available )); 
    fit_to_screen=$((fit_to_screen+1)); 
  fi

  already_done() { for ((done=0; done<(elapsed / fit_to_screen) ; done=done+1 )); do printf "▇"; done }
  remaining() { for (( remain=(elapsed/fit_to_screen) ; remain<(duration/fit_to_screen) ; remain=remain+1 )); do printf " "; done }
  percentage() { printf "| %s%%" $(( ((elapsed)*100)/(duration)*100/100 )); }
  clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=duration; elapsed=elapsed+1 )); do
      already_done; remaining; percentage
      sleep "$SLEEP_DURATION"
      clean_line
  done
  clean_line
}

progress-bar
############################################################################################################
## nice progress pinner.
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
# function ProgressBar {
# # Process data
#     let _progress=(${1}*100/${2}*100)/100
#     let _done=(${_progress}*4)/10
#     let _left=40-$_done
# # Build progressbar string lengths
#     _fill=$(printf "%${_done}s")
#     _empty=$(printf "%${_left}s")

# # 1.2 Build progressbar strings and print the ProgressBar line
# # 1.2.1 Output example:                           
# # 1.2.1.1 Progress : [########################################] 100%
# printf "\rProgress : [${_fill// /#}${_empty// /=}] ${_progress}%%"

# }

# # Variables
# _start=1

# # This accounts as the "totalState" variable for the ProgressBar function
# _end=100

# # Proof of concept
# for number in $(seq ${_start} ${_end})
# do
#     sleep 0.1
#     ProgressBar ${number} ${_end}
# done
# printf '\nFinished!\n'
##