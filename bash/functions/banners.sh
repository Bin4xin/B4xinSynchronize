#!/bin/bash

banners_show(){
arr=(1 2 3 4)
rand=$[$RANDOM % ${#arr[@]}]
IFS=$'\n'
for line in `cat functions/banner${arr[$rand]}.txt`
do
    echo $line
done
}
banners_show