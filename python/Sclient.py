import sys
import platform
import os
import colorama
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
# 2、运行banner

def Check_Run_Mode():
    if str(argv) == "['dw']":
        differentWorkspace_mode_func()
    elif str(argv) == "['sw']":
        sameWorkspace_mode_func()
    elif str(argv) == "['-h']" or str(argv) == "['--help']":
        print('help')
        exit()
    else:
        print('\033[1;31m● [Critical] help Usage : python3 Sclient.py [-h/--help] \033[0m')
        print('\033[1;31m   how to run : python3 Sclient.py [sw/dw] \033[0m')
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


# def Synchronize_update_fun():


# def plantform_detector():
#     sysstr = platform.system()
#     if sysstr == "Windows":
#         print("Windows")
#     elif sysstr == "Linux":
#         print("Linux")
#     elif sysstr == "Darwin":
#         print("Mac")
#     else:
#         print("Others")


if __name__ == "__main__":
    argv = sys.argv[1:]
    Check_Run_Mode()
    # plantform_detector()
