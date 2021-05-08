#include <stdio.h>
#include <iostream>
#include <string>
using namespace std;
/*
1、编译系统判断-->完成；
2、根据系统跳转函数-->待完成；
3、根据传入参数跳转函数-->待完成。
*/
char platform_type;

int platform_type_judgeMode(int platform_type_judgeMode)
{
    //char mode;
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
//int sameWorkspace_mode_fun(){
//    //printf("run mode in sw fun:%s\n", run_mode);
//    cout<<"GOGO"<<endl;
//    return 0;
//}
//int differentWorkspace_mode_fun(){
//    //printf("run mode in dw fun:%s\n", run_mode);
//    cout<<"YIYI"<<endl;
//    return 0;
//}

void platform_detector()
{
     cout<<">>>>>>进入编译平台监测函数..."<<endl;
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

     printf("value: %c\n", platform_type);
     platform_type_judgeMode(platform_type);
}


typedef void (*func)(void);

int main(int argc, const char * argv[]){
    /*
    func pdfunc = platform_detector;
    pdfunc();
    */
//    int (*sw_func)(int argv[1]);
//    sw_func = sameWorkspace_mode_fun();
//    int (*dw_func)(int argv[1]);
//    dw_func = differentWorkspace_mode_fun();
    //int var = argv[1];
    if(argc == 2){
          printf("The argument supplied is %s\n", argv[1]);
          }
//        sameWorkspace_mode_fun();
//        else if((argc == 2) && (argv[1] = "dw")){
//          printf("The argument supplied is %s\n", argv[1]);
//        differentWorkspace_mode_fun();}
       else if( argc > 2 ){
          printf("Too many arguments supplied. Usage: ./Sclient [dw/sw]\n");
          return -1;
       }else{
          printf("One argument expected. Usage: ./Sclient [dw/sw]\n");
          return -1;
       }

    platform_detector();
    //return 0;
}

//void main(int argc, char ** argv){
//    if (argc!=2){
//    std::cout << "Wrong input" << std::endl;
//    return -1;
//    }
//char * var1=argv[1];
//
//}