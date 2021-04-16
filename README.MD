# B4xinSynchronize：基于C/S架构的双端代码同步脚本

### v1.0 BETA 

[*B4xinSynchronize Version 0.1 beta*](https://github.com/Bin4xin/B4xinSynchronize/blob/master/main.sh)

- 基于C/S架构的双端代码同步脚本，由bin4xin编码和开源；
- *Dual-end code synchronization script based on C/S architecture.*
    - 1.对用户输入进行`while:do`循环判断，不会因错误的用户输入导致程序异常终止，保障程序代码的健壮性；
    - 2.定义了程序运行环境下的环境变量，保障程序在不同Linux发行版下运行的稳定性、美观性；
    - 3.调用了BASH语法的转义功能，增强程序用户体验和交互能力；
- 参考：
    - [*BT panel*](https://github.com/Bin4xin/B4xinSynchronize/tree/master/panel)


### 使用方法
- bash终端命令
```
$ curl -o B4xinSynchronize.sh https://raw.githubusercontent.com/Bin4xin/B4xinSynchronize/master/main.sh
$ bash B4xinSynchronize.sh [dw/sw]
···
·[*Info]Synchronize copy is running... 
·[*Info]Synchronize update is running... 
To https://github.com/Bin4xin/B4xinSynchronize.git
* [new branch]      master -> master
```
- 2021年 4月16日 星期五 19时53分40秒 CST完成初版Beta
- 具体使用方法待更新...

*And It's Done!What's NEXT?*

### 下一步计划

- [*B4xinSynchronize Version 0.1 Release*](https://github.com/Bin4xin/B4xinSynchronize/blob/master/main.sh)
    - [ ] 1.计划新增[git server. / jekyll server. / other servers...]等选项更新
    - [ ] [2.目前部分代码传参数为硬编码形式，计划修改成100%变量形式](https://github.com/Bin4xin/B4xinSynchronize/blob/master/main.sh)
    - [ ] 3.计划新增服务端同步脚本
    - [ ] 4.目前暂时只测试于`Darwin 20.3.0 Darwin Kernel Version 20.3.0 /RELEASE_X86_64 x86_64`，逐渐测试与其他发行版本
        - [x] i Darwin 20.3.0 MACos Big Sur
        - [ ] ii Ubuntu 18.0/20.0
        - [ ] iii CentOS 7
        - [ ] iiii ...
    - [ ] [5.优化脚本已知问题，欢迎提交issues。](https://github.com/Bin4xin/B4xinSynchronize/issues/new)
  
以上。

---