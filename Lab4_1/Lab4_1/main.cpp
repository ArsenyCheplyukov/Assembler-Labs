#include <iostream>

extern "C" int lab_2_3(int n);

int main()
{
	int n = 3;
	int ans = lab_2_3(n);
	std::cout << "n = " << n << std::endl;
	std::cout << "ans = " << ans << std::endl;
	return 0;
}