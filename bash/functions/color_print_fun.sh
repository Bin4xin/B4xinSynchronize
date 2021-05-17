#!/bin/bash
#\033[05m -> 33 red color
#\033[01m more wide
############critical show###########
## print message to critical color##
####################################
function critical() {
  # shellcheck disable=SC2059
  printf "\033[31m$*\033[0m"
  echo
}
## print message to critical_flashing background color
function critical_flashing() {
  # shellcheck disable=SC2059
  printf "\033[31m\033[01m\033[05m$*\033[4m"
  echo
}
function underline_critical_show() {
  # shellcheck disable=SC2059
  printf "\033[4;31m\033[01m$*\033[0m"
  #printf "\033[4;31m\033[01m\033[05m $* \033[0m"
  #underline and flashing!
  echo
}
############info show###########
## print message to info color##
################################
function tips_info() {
  # shellcheck disable=SC2059
  printf "\033[31m$1\033[0m \033[31m$2\033[0m \033[31m$3\033[0m \033[31m$4\033[0m \033[32m$5\033[0m"
  echo
}
## print message to info color
function info() {
  # shellcheck disable=SC2059
  printf "\033[32m$*\033[0m"
  echo
}
function underline_info_show() {
  # shellcheck disable=SC2059
  printf "\033[4;32m\033[01m$*\033[0m"
  #printf "\033[4;32m\033[01m\033[05m $* \033[0m"
  echo
}
############warning show###########
## print message to warning color##
###################################
function underline_warn_show() {
  # shellcheck disable=SC2059
  printf "\033[4;33m\033[01m$*\033[0m"
  #printf "\033[4;33m\033[01m\033[05m $* \033[0m"
  echo
}
function tips_warnshow() {
  # shellcheck disable=SC2059
  printf "\033[33m$*\033[0m \n"
  echo
}
## print message to warn color
function warn() {
  # shellcheck disable=SC2059
  printf "\033[33m$*\033[0m"
  echo
}



