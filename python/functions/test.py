# -*- coding: utf-8-*-

import sys
import os

input_ = input
zh_coding = 'cp936'
utf_8 = 'utf-8'

# before other codes
if sys.version_info.major < 3:
    reload(sys)
    sys.setdefaultencoding(utf_8)

    input_ = raw_input

# begin your code

def to936(utf8):
    if sys.version_info.major < 3:
        utf8 = utf8.decode().encode(zh_coding)
    return utf8

def toUtf8(zh936):
    if sys.version_info.major < 3:
        zh936 = zh936.decode(zh_coding).encode(utf_8)
    return zh936

os.system('@echo off')
# 转换cmd窗口的编码集，不管cmd窗口的默认值是什么都显示正确
os.system('chcp 936 >nul')

print(to936(u'中文简体(encoding)'))
print(to936(u'中文繁體(encoding)'))

# 在 cmd 窗口 的默认值的默认代码页不是 936 的情况下会报错。
# 如果是 936，通过双击 .bat 运行是正常的，
# 如果在其它 py 中通过 os.startfile(), subprocess, os.system()
# 等模块来运行那个bat,会显示乱码
try:
    print(u'中文简体(not encoding)')
    print(u'中文繁體(not encoding)')
except Exception as e:
    os.system(to936(u'echo 解码错误'))
    print(e)

i = input_(to936(u'输入你的中文名字:'))
i = toUtf8(i)
msg = to936(u'你的中文名字是：%s' % i)
print(msg)

os.system('pause && exit')