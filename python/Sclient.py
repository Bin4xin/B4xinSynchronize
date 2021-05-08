import sys
import platform
import os
# import git
# import functions.platformDetecter as pf

# print(os.getcwd())
# s = 'Hello'
# x = str(argv)
# print("The length of %s is %s" % (argv,x))
# print(argv)
# print(str(argv))
# command = os.system("cd 'os.getcwd()'")
argv = sys.argv[1:]


def Check_Run_Mode():
    if str(argv) == "['dw']":
        print('dw!')
        differentWorkspace_mode_fun()
    elif str(argv) == "['sw']":
        print('sw!')
        sameWorkspace_mode_fun()
    else:
        print('Usage : python Sclient.py [sw/dw]')
        exit()


def sameWorkspace_mode_fun():
    print('GOGO')


def differentWorkspace_mode_fun():
    print('YIYI')
    git_dir = input("● [Info] Plz type in your git (local) workspace path:")
    sync_dir = input("● [Info] Plz type in your jekyll (build) workspace path:")
    os.system('cd ' + git_dir + ' && pwd')
    os.system('cd ' + sync_dir + ' && pwd')


def plantform_detector():
    sysstr = platform.system()
    if sysstr == "Windows":
        print("Windows")
    elif sysstr == "Linux":
        print("Linux")
    elif sysstr == "Darwin":
        print("Mac")
    else:
        print("Others")


if __name__ == "__main__":

    Check_Run_Mode()
    plantform_detector()