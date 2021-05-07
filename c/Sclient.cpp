#include <stdio.h>
#include <iostream>
#include <string>
using namespace std;
//void (*pFunc)(int);
//typedef void (*func)(void);
char platform_type;

int platform_type_judgeMode(int platform_type_judgeMode)
{
    printf("value: %c\n", platform_type_judgeMode);
}

void platform_detector()
{
     int no_os_flag=1;
     #ifdef linux
        no_os_flag=0;
        //char*
        platform_type='l';
        cout<<"It is in Linux OS!"<<endl;
     #endif

     #ifdef _UNIX
        no_os_flag=0;
        ////char*
        platform_type='u';
        cout<<"It is in UNIX OS!"<<endl;
     #endif

     #ifdef __APPLE__
        no_os_flag=0;
        //char*
        platform_type = 'm';
        cout<<"It is in MacOS!"<<endl;
     #endif

     #ifdef __WINDOWS_
        no_os_flag=0;
        //char*
        platform_type='W';
        cout<<"It is in Windows OS!"<<endl;
     #endif

     #ifdef _WIN32
        no_os_flag=0;
        //char*
        platform_type='w';
        cout<<"It is in WIN32 OS!"<<endl;
     #endif

     if(1==no_os_flag){
         cout<<"No OS Defined ,I do not know what the os is!"<<endl;
     }
     printf("value: %c\n", platform_type);
     platform_type_judgeMode(platform_type);
}



int main(void){
    /* func pdfunc = platform_detector;
       pdfunc();
    */
    platform_detector();

}

