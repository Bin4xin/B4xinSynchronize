from __future__ import print_function

try:
    import sys
    sys.dont_write_bytecode = True
    try:
        __import__("functions.versionCheck")  # this has to be the first non-standard import
    except ImportError:
        sys.exit("[!] wrong installation detected (missing modules). Visit 'https://github.com/sqlmapproject/sqlmap/#installation' for further details")

        import platform
        import os
        from random import choice
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