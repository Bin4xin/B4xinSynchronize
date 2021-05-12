#include <stdio.h>
#include <iostream>
#include <string>
#include <string.h>
using namespace std;
/*
1、编译系统判断-->完成；
2、根据系统跳转函数-->完成；
3、根据传入参数跳转函数-->完成。
*/
int platform_type;

int platform_type_judgeMode(int platform_type_judgeMode)
{
    /*传入platform_detector(platform_type)
    * 行参为platform_type_judgeMode
    * 进而来判断系统
    */
    printf("platform_type_judgeMode value is: %c\n", platform_type_judgeMode);
    if ((platform_type_judgeMode == 'l') || (platform_type_judgeMode == 'u') || (platform_type_judgeMode == 'm')){
        cout<<"jump to unix_func"<<endl;
        }
    else if ((platform_type_judgeMode == 'w') || (platform_type_judgeMode == 'W')){
        cout<<"jump to windows_func"<<endl;
        }
    else{
        cout<<"wrong !!!"<<endl;
        }
    return 0;
}

int sameWorkspace_mode_fun(){
    cout<<"GOGO"<<endl;
    return 0;
}
int differentWorkspace_mode_fun(){
    cout<<"YIYI"<<endl;
    return 0;
}

void platform_detector()
{
     int no_os_flag=1;
     #ifdef linux
        no_os_flag=0;
        platform_type='l';
        cout<<"It is in Linux OS!"<<endl;
     #endif

     #ifdef _UNIX
        no_os_flag=0;
        platform_type='u';
        cout<<"It is in UNIX OS!"<<endl;
     #endif

     #ifdef __APPLE__
        no_os_flag=0;
        platform_type = 'm';
        cout<<"It is in MacOS!"<<endl;
     #endif

     #ifdef __WINDOWS_
        no_os_flag=0;
        platform_type='W';
        cout<<"It is in Windows OS!"<<endl;
     #endif

     #ifdef _WIN32
        no_os_flag=0;
        platform_type='w';
        cout<<"It is in WIN32 OS!"<<endl;
     #endif

     if(1==no_os_flag){
         cout<<"No OS Defined ,I do not know what the os is!"<<endl;
     }
     platform_type_judgeMode(platform_type);
}


typedef void (*func)(void);
int main(int argc, const char * argv[]){

    if((2 == argc) && (0 == strcmp(argv[1],"dw"))){
          printf("The argument supplied is %s\n", argv[1]);
          //cout << typeid(argv[1]).name() << endl;
          platform_detector();
          sameWorkspace_mode_fun();
          }
        else if((2 == argc) && (0 == strcmp(argv[1],"sw"))){
          printf("The argument supplied is %s\n", argv[1]);
          platform_detector();
          differentWorkspace_mode_fun();
          }
       else if( argc > 2 ){
          printf("Too many arguments supplied. Usage: ./Sclient [dw/sw]\n");
          return -1;
       }else{
          printf("One argument expected. Usage: ./Sclient [dw/sw]\n");
          return -1;
       }

}
