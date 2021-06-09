from git import Repo
import git
import click
import re


def config_read():
    for line in open("/Users/bin4xin/blog/github-code/B4xinSynchronize/python/test/functions/user_config.ini"):
        line = line.strip('\n')
        m = re.match('^#', line)
        if m is None:
            # print(line)
            array = (line)
            return array


@click.command()
@click.option('--list', type=str, default='dw', help='Number of greetings.')
def dw(list):
    """Type in [dw --help] to learn more. B4xinSync program [dw running mode] code based on python3. """
    click.echo("running mothod: %s" % list)
    config_read()


@click.command()
@click.option('--list', type=str, default='sw', help='Number of greetings.')
def sw(list):
    """Type in [sw --help] to learn more. B4xinSync program [sw running mode] code based on python3. """
    click.echo("running mothod: %s" % list)
    config_read()


@click.group()
def cli():
    pass


cli.add_command(dw)
cli.add_command(sw)

if __name__ == '__main__':
    cli()

# import os
# repoDir="/Users/bin4xin/blog/gitee-code/bin4xin/"
# baseDir="/Users/bin4xin/blog/SENTRYLAB-WWW-WEB/_site/"
# print(repoDir)
# print(baseDir)
#
#
# inputStr = input("请输入：");
# print ("你输入的内容是: ", inputStr)
# work_dir = os.getcwd() # 获取当前路径
# listdir = os.listdir(work_dir) # 返回path指定的文件夹包含的文件或文件夹的名字的列表
# while (inputStr != "quit" and inputStr != 'q'):
#     for dirName in listdir:
#         file_path = os.path.join(work_dir, dirName) # 拼接完整的路径
#         print(file_path)
#         if os.path.isdir(file_path) : # 判断是否是目录
#             try:
#                 os.chdir(file_path) # 移动到制定的目录下
#                 result = os.popen(inputStr) # 执行输入的命令
#                 print (result.read()) # 打印命令执行的结果
#             except :
#                 print ()
#             finally:
#                 print ()
#     inputStr = input("请输入：")

#  rsync -avpz --delete-before --exclude-from functions/exclue_delete_files.txt $optional_repo_buildPath/ $optional_repo_gitPath/

# os.system("rsync -avpz --delete-before --exclude-from /Users/bin4xin/blog/github-code/B4xinSynchronize/bash/functions/exclue_delete_files.txt " + ' ' + baseDir + ' ' + repoDir)
# #
#
# dirfile = os.path.abspath('/Users/bin4xin/blog/gitee-code/bin4xin')
# # code的文件位置，我默认将其存放在根目录下
# repo = Repo(dirfile)
# g = repo.git
# g.add("--all")
# g.commit("-m auto update")
# g.push()
# print("Successful push!")
