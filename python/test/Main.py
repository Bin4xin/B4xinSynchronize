from __future__ import print_function
from functions.common import scripts
import view.banner

# -*- coding: utf-8 -*-
# @code by Bin4xin.
# @File  : Sclient.py
# @Date  : 2021/5/09
# @Author: Bin4xin - chihou.pro@gmail.com - https://benchmarkhub.com/Bin4xin

try:
    import sys
    sys.dont_write_bytecode = True
    try:
        __import__("functions.versionCheck")  # this has to be the first non-standard import
    except ImportError:
        sys.exit("[!] wrong installation detected (missing modules). Visit 'https://github.com/sqlmapproject/sqlmap/#installation' for further details")
        import os
        import colorama
        warnings.filterwarnings(action="ignore", message="Python 2 is no longer supported")
        warnings.filterwarnings(action="ignore", message=".*was already imported", category=UserWarning)
        warnings.filterwarnings(action="ignore", message=".*using a very old release", category=UserWarning)
        warnings.filterwarnings(action="ignore", message=".*default buffer size will be used", category=RuntimeWarning)
        warnings.filterwarnings(action="ignore", category=DeprecationWarning)
        warnings.filterwarnings(action="ignore", category=UserWarning, module="psycopg2")
except KeyboardInterrupt:
    errMsg = "user aborted"

    if "logger" in globals():
        logger.critical(errMsg)
        raise SystemExit
    else:
        import time
        sys.exit("\r[%s] [CRITICAL] %s" % (time.strftime("%X"), errMsg))


if __name__ == "__main__":
    if len(sys.argv)<2:
        errMsg = "\033[1;31m ● [Critical] wrong number of parameters passed in \n\033[0m"
        errMsg += "\033[1;31m running usage : python3 Sclient.py [sw / dw]\n\033[0m"
        errMsg += "\033[1;31m help usage : python3 Sclient.py [-h / --help]\033[0m"
        print(errMsg)
    else:
        run_mode = sys.argv[1]
        print(run_mode)
        scripts(run_mode)