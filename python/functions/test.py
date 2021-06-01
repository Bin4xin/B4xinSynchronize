from git import Repo
import git
import os


repoDir="/Users/bin4xin/blog/gitee-code/bin4xin/"
baseDir="/Users/bin4xin/blog/SENTRYLAB-WWW-WEB/_site/"
print(repoDir)
print(baseDir)

#  rsync -avpz --delete-before --exclude-from functions/exclue_delete_files.txt $optional_repo_buildPath/ $optional_repo_gitPath/

os.system("rsync -avpz --delete-before --exclude-from /Users/bin4xin/blog/github-code/B4xinSynchronize/bash/functions/exclue_delete_files.txt " + ' ' + baseDir + ' ' + repoDir)
#

dirfile = os.path.abspath('/Users/bin4xin/blog/gitee-code/bin4xin')
# code的文件位置，我默认将其存放在根目录下
repo = Repo(dirfile)
g = repo.git
g.add("--all")
g.commit("-m auto update")
g.push()
print("Successful push!")