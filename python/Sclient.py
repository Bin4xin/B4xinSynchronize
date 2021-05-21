import sys
import platform
import os
from random import choice
import colorama
import random
# from view.banner import print

# -*- coding: utf-8 -*-
# @code by Bin4xin.
# @File  : Sclient.py
# @Date  : 2021/5/09
# @Author: Bin4xin - chihou.pro@gmail.com - https://benchmarkhub.com/Bin4xin

# Define related variables for running under WINDOWS, reference source :
# - https://blog.csdn.net/uiop_uiop_uiop/article/details/108243897
# - https://www.cnblogs.com/ibingshan/p/11214175.html
colorama.init(autoreset=True)


def to936(utf8):
    zh_coding = 'cp936'
    if sys.version_info.major < 3:
        utf8 = utf8.decode().encode(zh_coding)
    return utf8


def toUtf8(zh936):
    utf_8 = 'utf-8'
    if sys.version_info.major < 3:
        zh936 = zh936.decode(zh_coding).encode(utf_8)
    return zh936


# Declare the running program to pass in the parameter variable argv, judge the running mode
# and jump to the function, and make a judgment on the soundness of the program
# 待完成：
# 1、python对齐格式化输出
# 2、运行banner（已完成）

def Check_Run_Mode():
    if str(argv) == "['dw']":
        differentWorkspace_mode_func()
    elif str(argv) == "['sw']":
        sameWorkspace_mode_func()
    elif str(argv) == "['-h']" or str(argv) == "['--help']":
        print('help')
        exit()
    else:
        text = "\033[1;31m ● [Critical]\033[0m"
        text1 = "\033[1;31m help Usage :1 python3 Sclient.py [-h/--help] \033[0m"
        text2 = "\033[1;31m how to run : python3 Sclient.py [sw/dw] \033[0m"
        print(text, end='')
        print(text1)
        print(text2)
        exit()


def sameWorkspace_mode_func():
    print('GOGO')


def differentWorkspace_mode_func():
    sysstr = platform.system()
    if sysstr == "Windows":
        os.system('@echo off')
        input_ = input
        print("● [Info] Windows run mode")
        benchmark_dir = input_(to936(u'\033[1;32m● [Info] Plz type in your benchmark (local) workspace path : \033[0m'))
        benchmark_dir = toUtf8(benchmark_dir)
        os.system('test.bat')
    elif sysstr == "Linux":
        print('\033[1;33m● [-o-] I feel stupid for you to use python instead of bash on [ Darwin/Linux ]\033[0m')
    elif sysstr == "Darwin":
        print('\033[1;33m● [-o-] I feel stupid for you to use python instead of bash on [ Darwin/Linux ]\033[0m')



banners = [
    r'''
    .------..------..------..------..------..------..------..------..------.
    |B.--. ||4.--. ||X.--. ||i.--. ||n.--. ||S.--. ||y.--. ||n.--. ||c.--. |
    | :(): || :/\: || :/\: || (\/) || :(): || :/\: || (\/) || :(): || :/\: |
    | ()() || :\/: || (__) || :\/: || ()() || :\/: || :\/: || ()() || :\/: |
    | '--'B|| '--'4|| '--'X|| '--'i|| '--'n|| '--'s|| '--'y|| '--'n|| '--'c|
    `------'`------'`------'`------'`------'`------'`------'`------'`------'
                                                                Code by Bin4xin
    ''',
    r'''
                                       ..                                                        
    `7MM"""Yp,                       .Bin.               .A"Xin\                                 
      MM    Yb        _                                ,MI    ""Y                                 
      MM    dP      ,AM   `7M'   `MF'`7MM  `7MMpMMMb.  `MMb.     `7M'   `MF'`7MMpMMMb.   ,p6"bo  
      MM"""bg.     AVMM     `VA ,V'    MM    MM    MM    `YMMNq.   VA   ,V    MM    MM  6M'  OO  
      MM    `Y   ,W' MM       XMX      MM    MM    MM  .     `MM    VA ,V     MM    MM  8M       
      MM    ,9 ,W'   MM     ,V' VA.    MM    MM    MM  Mb     dM     VVV      MM    MM  YM.    , 
    .JMMmmmd9  AmmmmmMMmm .AM.   .MA..JMML..JMML  JMML.P"Ybmmd"      ,V     .JMML  JMML. YMbmd'  
                     MM                                             ,V                           
                     MM                                          OOb"                            
                                                                Code by Bin4xin
    ''',
    r'''
     _______  _   ___  __   __  ___   __    _  _______  __   __  __    _  _______ 
    |  _    || | |   ||  |_|  ||   | |  |  | ||       ||  | |  ||  |  | ||       |
    | |_|   || |_|   ||       ||   | |   |_| ||  _____||  |_|  ||   |_| ||       |
    |       ||       ||       ||   | |       || |_____ |       ||       ||       |
    |  _   | |___    | |     | |   | |  _    ||_____  ||_     _||  _    ||      _|
    | |_|   |    |   ||   _   ||   | | | |   | _____| |  |   |  | | |   ||     |_ 
    |_______|    |___||__| |__||___| |_|  |__||_______|  |___|  |_|  |__||_______|
                                                                Code by Bin4xin
    ''',
    r'''
       ____    _  _      __  __        ___        _   _       ____       __   __   _   _        ____  
    U | __")u | ||"|     \ \/"/       |_"_|      | \ |"|     / __"| u    \ \ / /  | \ |"|    U /"___| 
     \|  _ \/ | || |_    /\  /\        | |      <|  \| |>   <\___ \/      \ V /  <|  \| |>   \| | u   
      | |_) | |__   _|  U /  \ u       | |      U| |\  |u    u___) |     U_|"|_u U| |\  |u    | |/__  
      |____/    /|_|\    /_/\_\      U/| |\u     |_| \_|     |____/>>      |_|    |_| \_|      \____| 
     _|| \\_   u_|||_u ,-,>> \\_  .-,_|___|_,-.  ||   \\,-.   )(  (__) .-,//|(_   ||   \\,-.  _// \\  
    (__) (__)  (__)__)  \_)  (__)  \_)-' '-(_/   (_")  (_/   (__)       \_) (__)  (_")  (_/  (__)(__) 
                                                                Code by Bin4xin
    '''
]

if __name__ == "__main__":
    print(choice(banners))
    # function(print)
    argv = sys.argv[1:]
    Check_Run_Mode()
    # plantform_detector()
