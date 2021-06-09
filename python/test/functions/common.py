import colorama
import sys
import os
from functions.platformDetecter import platformSysType
# -*- coding: utf-8 -*-
"""
 @code by Bin4xin.
 @File  : Sclient.py
 @Date  : 2021/5/09
 @Author: Bin4xin - chihou.pro@gmail.com

 Define related variables for running under WINDOWS, reference source :
 - https://blog.csdn.net/uiop_uiop_uiop/article/details/108243897
 - https://www.cnblogs.com/ibingshan/p/11214175.html
"""
colorama.init(autoreset=True)
sysType = platformSysType()


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


warnMsg = "\033[1;33m ● [Warning]\n\033[0m"
warnMsg += "\033[1;33m [-o-] I feel stupid for you to use python instead of bash on [ Darwin/Linux ] Please use Bash scripts in Darwin/Linux\n\033[0m"
warnMsg += "\033[4;33m visit 'https://github.com/Bin4xin/B4xinSynchronize/blob/master/README.MD'\033[0m"
def sameWorkMode(sysType):
    print(sysType)
    if sysType == "Windows":
        os.system('@echo off')
        input_ = input
        print("● [Info] Windows run mode")
        benchmark_dir = input_(to936(u'\033[1;32m● [Info] Plz type in your benchmark (local) workspace path : \033[0m'))
        benchmark_dir = toUtf8(benchmark_dir)
        #os.system('test.bat')
    elif sysType == "Linux" or sysType == "Darwin":
        print(warnMsg)
        exit()
    print('GOGO:' + benchmark_dir)


def diffWorkMode(sysType):
    print(sysType)
    if sysType == "Windows":
        os.system('@echo off')
        input_ = input
        print("● [Info] Windows run mode")
        benchmark_dir = input_(to936(u'\033[1;32m● [Info] Plz type in your benchmark (local) workspace path : \033[0m'))
        benchmark_dir = toUtf8(benchmark_dir)
        #os.system('test.bat')
    elif sysType == "Linux" or sysType == "Darwin":
        print(warnMsg)
        exit()
    print('YIYI:' + benchmark_dir)


def scripts(run_mode):
    #print(run_mode)
    if str(run_mode) == "dw":
        print("jump tp differentWorkspace_mode_func()")
        diffWorkMode(sysType)
    elif str(run_mode) == "sw":
        print("jump tp sameWorkspace_mode_func()")
        sameWorkMode(sysType)
    elif str(run_mode) == "-h" or str(run_mode) == "--help":
        print('help')
        exit()
    else:
        errMsg = "\033[1;31m ● [Critical] excepted paras type in:\n\033[0m"
        errMsg += "\033[1;31m help usage : python3 Sclient.py [-h / --help]\n\033[0m"
        errMsg += "\033[1;31m running usage : python3 Sclient.py [sw / dw]\033[0m"
        print(errMsg)
        exit()
