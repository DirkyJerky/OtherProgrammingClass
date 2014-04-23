// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT91.cpp
// Purpose: Display numbers from 100 downto 1 using for

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	int count;
	for(count = 100; count >= 1; count--) {
		cout << count << "\n";
	}
	return 0;
}
