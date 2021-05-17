#!/bin/bash

## blue to echo
function blue(){
    printf "\033[35m[ $1 ]\033[0m"
    echo
}


## green to echo
function green(){
    printf "\033[32m $1 \033[0m"
    echo
}

## Error to warning with blink
function bred(){
    printf "\033[31m\033[01m\033[05m[ $1 ]\033[0m"
    echo
}

#green aaaa