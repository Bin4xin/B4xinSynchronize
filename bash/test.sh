#!/bin/bash

whereAmI=`pwd`
source $whereAmI/functions/banners.sh

commit_author=`git config --global --list|grep user.name|awk -F"=" '{print $2}'`


while true; do
	echo "[`date +%Y/%m/%d/%T`]: commit by $commit_author."
	sleep 1
done