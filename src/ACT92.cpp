// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT92.cpp
// Purpose: Print tenths between 1 and 5 (using type casting to int)

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	for(double num = 1; ((int) num) <= (5 - 1); num += 0.1 ) {
		cout << num << "\n";
	}
	return 0;
}
