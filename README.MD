# B4xinSynchronize：基于C/S架构的双端代码同步脚本

## ***请注意!!!ATTENTION PLZ!!!***

您若下载并使用该开源代码应充分认知并理解：
    
- 1.数据无价，在您未完全理解代码用途前，使用脚本请先备份您的数据；
- 2.由于第三方（人、平台）传播、二次开发、脚本滥用等行为而造成的任何直接或者间接的后果及损失跟作者无关，均由使用者本人负责，本文作者不为此承担任何责任。
- 3.尊重个人劳动成果，**禁止用作商业用途**并个人使用请申明出处： [B4xinSynchronize](https://github.com/Bin4xin/B4xinSynchronize)


If you download and use the open source code, you should fully recognize and understand:

- i.Data is priceless. Before you fully understand the purpose of the code, please back up your data ;
- ii.Any direct or indirect consequences and losses caused by third-party (person, platform) dissemination, secondary development, script abuse, etc. have nothing to do with the author and are the responsibility of the user himself, and the author of this article does not bear any responsibility for this.
- iii.Respect personal labor results, prohibit commercial use . Personal use please state the source: [B4xinSynchronize](https://github.com/Bin4xin/B4xinSynchronize)

### 什么是*B4xinSynchronize*

- 功能
    - 基于双端**代码同步**脚本，让您的git仅是或否
    - *Let your git only yes or no*
- 适用场景
    - 将本地调试完成的代码拷贝到工作目录（如jekyll、github）；
    - 将工作目录的代码push至github仓库或服务端；

- 工作流程图：

![](/assets/B4xinSynchronize-workflow.png)

<details>
<summary><em>点击以展开 *Project Log: </em></summary>

- 2021年 4月12日 星期一 15时21分49秒 CST 产生想法需求；
- 2021年 4月16日 星期五 19时53分40秒 CST 完成初版Beta；
- 2021年 4月19日 星期一 14时45分14秒 CST ：
    - 客户端更新脚本基本功能已完成
    - README 关于脚本基本介绍与用法已完成
- 2021年 4月20日 星期二 11时36分53秒 CST ：
    - 新增服务端同步脚本：[*Sserver.sh*](https://github.com/Bin4xin/B4xinSynchronize/blob/master/bash/Sserver.sh)
    - 重写`differentWorkspace_mode_fun`函数下的本地文件夹同步功能
        - 考虑到基准目录和同步目录下存在`.git`等文件、文件夹，故使用rsync时加入衍生功能`--delete-before --exclude-from`支持源目录、目标目录的同步增加、同步删除
        - `--exclude-from`定义同步规则，若存在参数下的文件，则不对该文件夹进行操作
- 2021年 4月20日 星期二 22时23分05秒 CST ：
    - [x] 2021年 5月18日 星期二 23时37分52秒 CST：新增定义记忆函数`Remember_Me_Fun` 及衍生询问函数`Ask_From_Me`用户保存本地目录同步配置
    - less input...
- 2021年 4月23日 星期五 16时17分54秒 CST ：
    - [x] 新增服务端同步脚本；[表格美化*by banemon*仓库地址](https://gitee.com/banemon/linux_sh_script)
        - [您也可以点击此处查看具体实现代码](https://github.com/Bin4xin/B4xinSynchronize/blob/master/bash/functions/draw_table.sh)
    - [x] 服务器自动化同步功能已完成：[用法/usage](#使用方法)
- 2021年 5月 7日 星期五 13时46分03秒 CST ：
    - [ ] python相关代码编写中...
    - [ ] C++相关代码编写中...
- 2021年 8月17日 星期二 09时48分23秒 CST ：
    - 修改程序workflow的图片流程；
</details>

### 使用方法
- 现有需求：
    - case1.更新github仓库代码；
    - case2.更新个人服务器服务器代码。

- case1.*sw mode:[same workspace]* 不需要对（构建后的）代码进行二次移动，直接可以上传；
    - 运行前请检查git是否进行全局配置：`git config --list`，个人建议先进行全局配置；
        - [参考：起步 - 初次运行 Git 前的配置](https://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-%E5%88%9D%E6%AC%A1%E8%BF%90%E8%A1%8C-Git-%E5%89%8D%E7%9A%84%E9%85%8D%E7%BD%AE)
        - Github自8/13开始弃用密码凭证解决[remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.](https://stackoverflow.com/questions/68775869/support-for-password-authentication-was-removed-please-use-a-personal-access-to)
        - 此处case假设在`/blog/github-code/B4xinSynchronize/`目录下运行`B4xinSynchronize.sh`那么则更新的为`B4xinSynchronize`仓库
    - 同步更新
    
- case2.*dw mode:[different workspace]* 需要对（构建后的）代码进行二次移动，才能上传。
    
    - 根据脚本提示输入待更新目录（Catalog to be updated）、更新参考目录（Update referenced catalog）
        - 此处case则分别输入`/blog/github-code/B4xinSynchronize/{your_Git_serverPATH}/www/` 和`/tmp/com.ingeek.B4xinSynchronize.Bybin4xin/_site/`
    - 同步更新

- 点击以获取<bash | <del>python | C++</del>>[*B4xinSynchronize* code](https://github.com/Bin4xin/B4xinSynchronize/releases)
- ~~具体使用方法待更新...~~

<details>
<summary><em>点击以展开 *bash终端使用: </em></summary>

修改 `B4xinSynchronize/bash/config/user_config.sh`，注意事项：

- `options_project_{i}`的值连接符为下划线，{i}自定义
- dw模式目录需加入`gitPath、buildPath`，否则会报`Invalid`，sw模式同理

```bash
##project : $your_repo_name
options_$your_repo_name_{i}="your_repo_name"
_${run_mode}_$your_repo_name_gitPath="/path/to/your/repo/name"
_${run_mode}_$your_repo_name_buildPath"/path/to/your/build/project/"

##example:

## dw mode project 0: bin4xin_github_io options
options_project_0="bin4xin_github_io"
_dw_bin4xin_github_io_gitPath="/Users/bin4xin/blog/github-code/bin4xin.github.io"
_dw_bin4xin_github_io_buildPath="/Users/bin4xin/blog/SENTRYLAB-WWW-WEB/_site"
# sw mode project 4: B4xinSynchronize options
options_project_4="B4xinSynchronize"
_sw_B4xinSynchronize_gitPath="/Users/bin4xin/blog/github-code/B4xinSynchronize"
```


- client端

```
$ brew install gawk
$ git clone https://github.com/Bin4xin/B4xinSynchronize.git
$ cd B4xinSynchronize/bash
$ bash Sclient.sh sw
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
[2021/08/17/10:35:58] [Info] Are you sure?(y/n):
[2021/08/17/10:36:01] [Info] Detected proxy export this shell
[2021/08/17/10:36:01] [Info] Running mode is: sw mode now
Detected user's conf files in ./config/user_config.sh
[2021/08/17/10:36:01] [Info] Detected :
[Repo 0] : bin4xin_github_io
[Repo 1] : bin4xin_gitee_io
[Repo 2] : sentrylab_tokyo_www
[Repo 3] : sentrylab_tokyo_about
[Repo 4] : B4xinSynchronize
[Repo 5] : sweet_ysoserial
[Repo 6] : Bin4xin
[Repo 7] : bigger_than_bigger
[Repo 8] : Industrial_Control_Wiki_Record
Choose your Repos option (default option: 0)[0/1/..] : 4
[2021/08/17/10:36:02] /Users/bin4xin/blog/github-code/develop/B4xinSynchronize is a valid git repository.
 But the current working directory may not be the top level. Check the output of the git rev-parse command if you care)
[2021/08/17/10:36:02] [Info] Directly jumping to Synchronize update...
[2021/08/17/10:36:02] [Info] Synchronize update is running in /Users/bin4xin/blog/github-code/develop/B4xinSynchronize
[2021/08/17/10:36:03] [Info] Synchronize update is running.
[master 7d3615d] [2021/08/17/10:36:03] B4xinSync: commit by bin4xin.
 1 file changed, 3 insertions(+), 3 deletions(-)
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 8 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 463 bytes | 463.00 KiB/s, done.
Total 4 (delta 3), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/Bin4xin/B4xinSynchronize.git
   10f27cf..7d3615d  master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
[2021/08/17/10:36:05] [Warn] ready to unset Http Proxy Shell? (y/n):
```

- server端

```
$ bash Sserver.sh [/path/to/git/workspace/]
 ● 运行中... 
任务进行中: [Crontab定时计划备份] [写入Crontab定时计划] [执行Crontab定时计划]
备份您的当前的Crontab计划
执行添加最新的Crontab计划：
[==================================================>]    
[备份计划] >> [crontab -l > config/golbal_var.sh.]...
 ● [Info]任务1: [Crontab定时计划备份] ----------> DONE..... 
[写入计划] >> [config/golbal_var.sh]...
 ● [Info]任务2: [写入Crontab定时计划] ----------> DONE..... 
[执行计划] << [config/golbal_var.sh]...
 ● [Info]任务3: [执行Crontab定时计划] ----------> DONE..... 

当前最新Crontab计划表为：
╔═══════════════════════════════╗
║   * * * * * git checkout -f   ║
╚═══════════════════════════════╝
ALL DONE...
```

</details>

- 文件夹结构
```
./
├── README.MD ──────────────────────────────────────────────────────>介绍文档
├── assets/ ────────────────────────────────────────────────────────>静态资源目录
├── gitWorkspace/ ──────────────────────────────────────────────────>工作测试目录
├── jekyllWorkspace/ ───────────────────────────────────────────────>构建测试目录
├── panel/ ─────────────────────────────────────────────────────────>bash脚本语法参考
├── c/ ─────────────────────────────────────────────────────────────>C++版代码目录
├── bash/ ──────────────────────────────────────────────────────────>Bash版代码目录
│   ├── Sclient.sh ─────────────────────────────────────────────────>客户端代码同步脚本 
│   ├── Sserver.sh ─────────────────────────────────────────────────>服务端代码同步脚本
│   ├── functions/ ─────────────────────────────────────────────────>Bash代码配置功能目录
│   │   ├── color_print_fun.sh ─────────────────────────────────────>颜色函数
│   │   ├── draw_table.sh ──────────────────────────────────────────>画图函数
│   │   └── exclue_delete_files.txt ────────────────────────────────>同步约束规则
│   └── config/ ────────────────────────────────────────────────────>Bash代码功能目录
│   │   ├── user_config.sh ─────────────────────────────────────────>Bash本地配置保存信息
│   │   ├── golbal_var.bak ─────────────────────────────────────────>cron备份文件
│   │   └── golbal_var.txt ─────────────────────────────────────────>写入cron计划信息
└── python/ ────────────────────────────────────────────────────────>PY版代码目录
    ├── cwRsync_5.4.1/ ─────────────────────────────────────────────>sync.exe
    ├── functions/ ─────────────────────────────────────────────────>PY版功能代码目录
    │   └── platformDetecter.py
    └── view/ ──────────────────────────────────────────────────────>PY展示目录
```




### *B4xinSynchronize v0.1*

[*B4xinSynchronize Version 0.1 beta*](https://github.com/Bin4xin/B4xinSynchronize/blob/master/bash/Sclient.sh)

- 基于C/S架构的双端代码同步脚本，由bin4xin编码和开源；
- *Dual-end code synchronization script based on C/S architecture.*
    - 1.对用户输入进行`while:do`循环判断，不会因错误的用户输入导致程序异常终止，保障程序代码的健壮性；
    - 2.定义了程序运行环境下的环境变量，保障程序在不同Linux发行版下运行的稳定性、美观性；
    - 3.调用了BASH语法的转义功能，增强程序用户体验和交互能力；
- 参考：
    - [*BT panel*](https://github.com/Bin4xin/B4xinSynchronize/tree/master/panel)

---
*And It's Done!What's NEXT?*

### 下一步计划

<details>
<summary><em>点击以展开 *下一步计划: </em></summary>

- [~~*B4xinSynchronize Version 0.1 Release*~~](https://github.com/Bin4xin/B4xinSynchronize/blob/master/bash/Sclient.sh)
- [*B4xinSynchronize Version 0.2 Release*](https://github.com/Bin4xin/B4xinSynchronize/blob/master/bash/Sclient.sh)
    - [x] 1.计划新增[git server. / jekyll server. / other servers...]等选项更新；
    - [ ] [2.目前部分代码传参数为硬编码形式，计划修改成100%变量形式；](https://github.com/Bin4xin/B4xinSynchronize/blob/master/Sclient.sh)
        - [x] git commit暂时使用时间作为基准参考；
        - [x] 计划加入其他基准commit；读取文件名称输出
        - [ ] 由于bash脚本特殊性，正常输出特殊字符出行报错现象，banner输出暂时使用文件读取输出，有更好的办法欢迎讨论。
    - [x] 3.计划新增服务端同步脚本；
    - [ ] 4.目前暂时只测试于`Darwin 20.3.0 Darwin Kernel Version 20.3.0 /RELEASE_X86_64 x86_64`，逐渐测试与其他发行版本；
        - [x] i Darwin 20.3.0 MacOS Big Sur [~~server端~~/client端✅]
        - [ ] ii Ubuntu 18.0/20.0 [server端✅/client端✅]
        - [ ] iii CentOS 7 [server端❎/client端❎]
        - [ ] iv ...
    - [ ] [5.优化脚本已知问题，欢迎提交issues；](https://github.com/Bin4xin/B4xinSynchronize/issues/new)
    - [x] 6.程序运行等待时，加入加载动画；
    - [ ] 7.计划添加python与c++的版本。
        - [ ] python coding...
        - [ ] c++ coding...
        
</details>

### 其他

- logo生成 ASCII Art Library For Python - (art PYPI docs)[https://pypi.org/project/art/]

```
$ python3 -m pip install art
$ python3
>>> from art import *
>>> tprint("bin4xin","rand")
.%%%%%...%%%%%%..%%..%%......%%..%%..%%..%%%%%%..%%..%%.
.%%..%%....%%....%%%.%%..%%..%%...%%%%.....%%....%%%.%%.
.%%%%%.....%%....%%.%%%..%%%%%%....%%......%%....%%.%%%.
.%%..%%....%%....%%..%%......%%...%%%%.....%%....%%..%%.
.%%%%%...%%%%%%..%%..%%......%%..%%..%%..%%%%%%..%%..%%.
........................................................

>>> tprint("bin4xin","rand")
 ____  ____  _  _   __   _  _  ____  _  _
(  _ \(_  _)( \( ) /. | ( \/ )(_  _)( \( )
 ) _ < _)(_  )  ( (_  _) )  (  _)(_  )  (
(____/(____)(_)\_)  (_) (_/\_)(____)(_)\_)

>>> tprint("bin4xin","rand")
O))
O))       O)               O))             O)
O))         O)) O))      O O))   O))   O))   O)) O))
O)) O))  O)) O))  O))   O) O))     O) O)) O)) O))  O))
O))   O))O)) O))  O)) O))  O))      O)    O)) O))  O))
O))   O))O)) O))  O))O)))) O) O)) O)  O)) O)) O))  O))
O)) O))  O))O)))  O))      O))   O))   O))O))O)))  O))
```

---

以上。