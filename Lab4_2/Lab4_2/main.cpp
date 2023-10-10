#include <iostream>

extern "C" int lab_3_1(int size, int* arr);

int main()
{
    int size = 10;
    int arr[] = [1, 2, 4, 5, 9, 10, 14, 17, 20, 23];
    int s = lab_3_1(5, 3);
    std::cout << "a = " << a << std::endl;
    std::cout << "b = " << b << std::endl;
    std::cout << "sum = " << s << std::endl;
    return 0;
}