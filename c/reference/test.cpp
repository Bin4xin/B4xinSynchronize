//#include <stdio.h>
//#include <stdlib.h>
//
//int main( int argc, char* argv[] )
//{
//	printf("printf() Benchmark \n");
//	printf("\n");
//
//	printf("int printf(const char *format,[argument]);\n");
//	printf("Print formatted data to stdout \n");
//	printf("\n");
//
//	printf("Format prototype: \n");
//	printf("%%[flags][width][.precision][length]specifier \n");
//	printf("\n");
//
//
//	printf("Specifiers:\n");
//	printf("d or i \t Signed decimal integer  \n");
//
//	printf("u \t Unsigned decimal integer\n");
//
//	printf("f \t Decimal floating point, lowercase	\n");
//	printf("F \t Decimal floating point, uppercase \n");
//	printf("e \t Scientific notation (mantissa/exponent), lowercase	\n");
//	printf("E \t Scientific notation (mantissa/exponent) \n");
//	printf("s \t String of characters \n");
//	printf("\n");
//
//
//	printf("The format specifier can also contain sub-specifiers: \n");
//	printf("    flags, width, .precision and modifiers (in that order)\n");
//	printf("\n");
//
//	printf("width  \n");
//	printf("(number)\t Minimum number of characters to be printed. \n");
//	printf("        \t If the value to be printed is shorter than this number, \n");
//	printf("        \t the result is padded with blank spaces. \n");
//	printf("        \t The value is not truncated even if the result is larger. \n");
//	printf("\n");
//
//
//	printf(".precision  \n");
//	printf(".number\t For integer specifiers (d, i, o, u, x, X):   \n");
//	printf("       \t precision specifies the minimum number of digits to be written.\n");
//	printf("       \t If the value to be written is shorter than this number, \n");
//	printf("       \t the result is padded with leading zeros. \n");
//	printf("       \t The value is not truncated even if the result is longer. \n");
//	printf("       \t A precision of 0 means that no character is written for the value 0. \n");
//	printf("       \t For a, A, e, E, f and F specifiers: \n");
//	printf("       \t this is the number of digits to be printed after the decimal point \n");
//	printf("       \t (by default, this is 6). \n");
//
//
//	printf("\n");
//	printf("Characters: %c %c \n", 'a', 65);
//	printf("Decimals: %d %ld\n", 1977, 650000L);
//
//	printf("Some different radices: %d %x %o %#x %#o \n", 100, 100, 100, 100,100);
//	printf("floats: %4.2f %+.0e %E \n", 3.1416, 3.1416, 3.1416);
//	printf("Width trick: %*d \n", 5, 10);
//	printf("\n");
//
//	double value = 123456.123456;
//
//	printf("Testing value = %f \n", value);
//
//	printf("printf(\"%%f\"):%f \n", value);
//	printf("printf(\"%%6.3f\"):%6.3f \n", value);
//	printf("printf(\"%%6.6f\"):%6.6f \n", value);
//	printf("printf(\"%%6.8f\"):%6.8f \n", value);
//	printf("printf(\"%%16.8f\"):%6.8f \n", value);
//
//	printf("printf(\"%%e\"):%E\n", value);
//	printf("\n");
//	printf("Preceding with blanks:  \n");
//	printf("printf(\"%%10d\"):%10d\n", 1977);
//
//	printf("\n");
//	printf("Preceding with zeros:  \n");
//	printf("printf(\"%%010d\"):%010d \n", 1977);
//
//	printf("\n");
//	printf("%s \n", "String Benchmarks");
//	printf("printf(\"%%s\"):%s\n", "Hello, world!");
//	printf("printf(\"%%15s\"):%15s\n", "Hello, world!");
//	printf("printf(\"%%.10s\"):%.10s\n", "Hello, world!");
//	printf("printf(\"%%-10s\"):%-10s\n", "Hello, world!");
//	printf("printf(\"%%-15s\"):%-15s\n", "Hello, world!");
//	printf("printf(\"%%.15s\"):%.15s\n", "Hello, world!");
//	printf("printf(\"%%15.10s\"):%15.10s\n", "Hello, world!");
//	printf("printf(\"%%-15.10s\"):%-15.10s\n", "Hello, world!");
//
//	return 0;
//}
#include <stdio.h>
#include <iostream>
#include <string>
using namespace std;
int test(int a)
{
    return a;
}
int main(int argc, const char * argv[])
{

    int (*fp)(int a);
    fp = test;
    cout<<fp(2)<<endl;
    return 0;
}

//int func(int x)//x是形参
//{
//    //return x*x;
//    //x=x*x;
//    printf("x:%d\n",x);
//
//    //a=a*a;
//}
//int main(void)
//{
//    int a=10;
//    func(a);//a是实参
//    printf("a:%d\n",a);
//    return 0;
//}
