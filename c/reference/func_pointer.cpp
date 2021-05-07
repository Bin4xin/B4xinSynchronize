#include<iostream>
using namespace std;

/**
 * @brief 定义了一个变量pFun，这个变量是个指针，指向返回值和参
 * 数都是空的函数的指针！
 */
//void (*pFun)(int);
typedef void (*func)(void);
/**
 * @brief 代表一种新类型，不是变量！所以与上述的pFun不一样！
 */

void myfunc(void)
{
    //cout<<"asda"<<endl;
    int no_os_flag=0;
    //cout<<"no_os_flag";
    printf("%u\n",no_os_flag);
}

//void glFun(int a){ cout<<a<<endl;}

int main(){
    func pfun = myfunc;/*赋值*/
    pfun();/*调用*/
    //pFun = glFun;
    //(*pFun)(2);

}