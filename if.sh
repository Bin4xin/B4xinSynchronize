#!/bin/bash



Install_Main(){
  startTime=`date +%s`
  echo -e "startTime: $startTime"
}

while [ "$go" != 'y' ] && [ "$go" != 'n' ]
do
	read -p "are you sure?(y/n): " go;
done

if [ "$go" == 'n' ];then
	exit;
fi

Install_Main