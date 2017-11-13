#include <iostream>
using namespace std;
extern "C" int factorial(int);
int main(void)
{
cout << factorial(5) << endl;
}