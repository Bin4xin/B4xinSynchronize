# B4xinSynchronize：基于C/S架构的双端代码同步脚本

### *注意！ATTENTION PLZ!!!*

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
    - 基于双端**代码同步**脚本；
    - More code , Less git.
- 适用场景
    - 将本地调试完成的代码拷贝到工作目录（如jekyll、github）；
    - 将工作目录的代码push至github仓库或服务端；

- 工作流程图：

<div align=center><img width="280px" height="400px" src="/assets/B4xinSynchronize-workflow.png"/></div>

### 使用方法
- 现有需求：
    - case1.更新github仓库代码；
    - case2.更新个人服务器服务器代码。
    
本地github工作目录[/blog/github-code/B4xinSynchronize/](https://github.com/Bin4xin/B4xinSynchronize)

本地：bash调试构建目录[/tmp/com.ingeek.B4xinSynchronize.Bybin4xin/]()

jekyll博客构建生成目录[/tmp/com.ingeek.B4xinSynchronize.Bybin4xin/_site/]()

- case1.*sw mode:[same workspace]* 不需要对（构建后的）代码进行二次移动，直接可以上传；
    - 运行前请检查git是否进行全局配置：`git config --list`，个人建议先进行全局配置；
        - [参考：起步 - 初次运行 Git 前的配置](https://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-%E5%88%9D%E6%AC%A1%E8%BF%90%E8%A1%8C-Git-%E5%89%8D%E7%9A%84%E9%85%8D%E7%BD%AE)
        - 此处case假设在`/blog/github-code/B4xinSynchronize/`目录下运行`B4xinSynchronize.sh`那么则更新的为`B4xinSynchronize`仓库
    - 同步更新
    
- case2.*dw mode:[different workspace]* 需要对（构建后的）代码进行二次移动，才能上传。
    
    - 根据脚本提示输入待更新目录（Catalog to be updated）、更新参考目录（Update referenced catalog）
        - 此处case则分别输入`/blog/github-code/B4xinSynchronize/{your_Git_serverPATH}/www/` 和`/tmp/com.ingeek.B4xinSynchronize.Bybin4xin/_site/`
    - 同步更新
- 文件夹结构
```
./
├── README.MD                   ────介绍文档
├── Sclient.sh                  ────客户端代码同步脚本 
├── Sserver.sh                  ────服务端
├── assets                      ────静态资源
├── config                      ────配置功能目录
├── draw_table.sh               ────画图函数
├── exclue_delete_files.txt     ────同步删除规则
├── gitWorkspace                ────工作测试目录
├── jekyllWorkspace             ────构建测试目录
└── panel                       ────bash脚本语法参考
```
- bash终端命令
    - client端
    ```
    $ git clone https://github.com/Bin4xin/B4xinSynchronize.git
    $ cd B4xinSynchronize
    $ bash Sclient.sh [dw/sw]
    ● [Info] are you sure?(y/n): y
    ···
    根据提示输入git工作目录和构建目录
    /blog/github-code/B4xinSynchronize/{your_Git_serverPATH}/www/
    /tmp/com.ingeek.B4xinSynchronize.Bybin4xin/_site/
    ···
    ● [Info]Synchronize copy is running... 
    ● [Info]Synchronize update is running...
    To https://github.com/Bin4xin/B4xinSynchronize.git
    * [new branch]      master -> master
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

- ~~具体使用方法待更新...~~
- *Project Log:*
    - 2021年 4月12日 星期一 15时21分49秒 CST 产生想法需求；
    - 2021年 4月16日 星期五 19时53分40秒 CST 完成初版Beta；
    - 2021年 4月19日 星期一 14时45分14秒 CST ：
        - 客户端更新脚本基本功能已完成
        - README 关于脚本基本介绍与用法已完成
    - 2021年 4月20日 星期二 11时36分53秒 CST ：
        - 新增服务端同步脚本：[*Sserver.sh*](https://github.com/Bin4xin/B4xinSynchronize/blob/master/Sserver.sh)
        - 重写`differentWorkspace_mode_fun`函数下的本地文件夹同步功能
            - 使用衍生功能`--delete-before --exclude-from`支持源目录、目标目录的同步增加、同步删除
    - 2021年 4月20日 星期二 22时23分05秒 CST ：
        - [ ] 新增定义记忆函数`Remember_Me_Fun` 及衍生询问函数`Ask_From_Me`用户保存本地目录同步配置
        - less input...
    - 2021年 4月23日 星期五 16时17分54秒 CST ：
        - [x] 新增服务端同步脚本；
        - 服务器自动化同步功能已完成：[用法/usage](#使用方法)


### *B4xinSynchronize v0.1*

[*B4xinSynchronize Version 0.1 beta*](https://github.com/Bin4xin/B4xinSynchronize/blob/master/Sclient.sh)

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

- [*B4xinSynchronize Version 0.1 Release*](https://github.com/Bin4xin/B4xinSynchronize/blob/master/Sclient.sh)
    - [x] 1.计划新增[git server. / jekyll server. / other servers...]等选项更新；
    - [ ] [2.目前部分代码传参数为硬编码形式，计划修改成100%变量形式；](https://github.com/Bin4xin/B4xinSynchronize/blob/master/Sclient.sh)
        - [x] git commit暂时使用时间作为基准参考；
        - [ ] 计划加入其他基准commit；
    - [x] 3.计划新增服务端同步脚本；
    - [ ] 4.目前暂时只测试于`Darwin 20.3.0 Darwin Kernel Version 20.3.0 /RELEASE_X86_64 x86_64`，逐渐测试与其他发行版本；
        - [x] i Darwin 20.3.0 MacOS Big Sur [~~server端~~/client端✅]
        - [ ] ii Ubuntu 18.0/20.0 [server端✅/client端❎]
        - [ ] iii CentOS 7 [server端❎/client端❎]
        - [ ] iiii ...
    - [ ] [5.优化脚本已知问题，欢迎提交issues；](https://github.com/Bin4xin/B4xinSynchronize/issues/new)
    - [x] 6.程序运行等待时，加入加载动画；
    - [ ] 7.计划添加python与c++的版本。
    
以上。
