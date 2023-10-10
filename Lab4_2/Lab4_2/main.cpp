#include <iostream>

extern "C" int lab_3_1(const int size, int* arr);

int main()
{
    const int size = 10;
    int arr[size]{ 1, 2, 4, 5, 9, 10, 14, 17, 20, 23 };
    int s = lab_3_1(5, arr);
    std::cout << "size = " << size << std::endl;

    std::cout << "Arrray = [";
    for (size_t i = 0; i < size-1; ++i) {
        std::cout << arr[i] << ", ";
    }
    std::cout << arr[size - 1] << "]\n";

    std::cout << "sum = " << s << std::endl;
    return 0;
}