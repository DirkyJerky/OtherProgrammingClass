// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT74.cpp
// Purpose: Print odd numbers from 1 to 100 (using continue to skip evens)

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	for(int i = 0; i <= 100; i++) {
		if(!(i%2)) {
			continue;
		}
		cout << i << "\n";
	}
	return 0;
}
