import platform
# -*- coding: utf-8 -*-
"""
# @code by Bin4xin.
# @File  : platformDetecter.py
# @Date  : 2021/5/21
# @Author: Bin4xin - chihou.pro@gmail.com

# Actually I prefer to import functions from every module:
# What you have to know is that this shows the running logic of the code very well.
# It is a good code style even don't have lot's code in files, more of a programming style that i want to practice
"""


def platformSysType():
    sysType = platform.system()
    return sysType
    # if sysType == "windows":
    #     print("windows")
    # elif sysType == "Linux" or sysType == "Darwin":
    #     print("linux unix")
