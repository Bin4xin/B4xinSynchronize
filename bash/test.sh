#!/bin/bash
source ./functions/color_print_fun.sh
#
#exec_mode="different worksace(dw) mode"
#critical $exec_mode
#info $exec_mode
#
#ad="● [CRITICAL] ERROR parameter error"
#tips_info $ad
#
#han_xinxi1="我的奋斗 在人间 我的大学"
#info $han_xinxi1

#critical_flashing "● [Info] [SW] mode ensure. Synchronize copy is running..."
#echo -e "\033[4;31m下划线红字\033[0m"

#闪烁
#echo -e "\033[5;31m红字在闪烁\033[0m"
#反影
#echo -e "\033[8m消隐\033[0m "

#echo -e "\\033[0;31m系统颜色设置代码调试，此颜色为一号颜色 - 红！"
#echo -e "\\033[0;39m"
#echo -e "\\033[0;32m系统颜色设置代码调试，此颜色为二号颜色 - 绿！"
#echo -e "\\033[0;39m"
#echo -e "\\033[0;33m系统颜色设置代码调试，此颜色为三号颜色 - 黄！"
#echo -e "\\033[0;39m"
#echo -e "\\033[0;34m系统颜色设置代码调试，此颜色为四号颜色 - 蓝！"
#echo -e "\\033[0;39m"
#echo -e "\\033[0;35m系统颜色设置代码调试，此颜色为五号颜色 - 紫！"
#echo -e "\\033[0;39m"
#echo -e "\\033[0;36m系统颜色设置代码调试，此颜色为六号颜色 - 青！"
#echo -e "\\033[0;39m"
#echo -e "\\033[0;39m系统颜色设置代码调试，此颜色为九号颜色 - 白！"
#echo -e "\\033[0;39m"
#echo "ip addr add "$"$A"_Dn42_ip/32" peer ${ZIPDN42}/32 dev ${Z}_$ZASN
#eval echo "ip addr add "$"$A"_Dn42_ip/32" peer ${ZIPDN42}/32 dev ${Z}_$ZASN
underline_critical_show "admin"
#从标准输入给变量A传递一个参数



list=`cat $1`
for val in $list
do
   echo $val
done

#echo ${S}


    #现在需要在一行调用变量Z
    ###########ip addr add 123_Dn42_ip/32 peer /32 dev 123_PPL_123_PPL ASN
    ###########ip addr add 123_Dn42_ip/32 peer /32 dev 123_PPL_
    #eval echo "ip addr add "$"$A"_Dn42_ip/32" peer ${ZIPDN42}/32 dev ${Z}_$ZASN"
    #eval echo "ip addr add "$"$A"_Dn42_ip/32" peer ${ZIPDN42}/32 dev ${Z}_$ZASN"