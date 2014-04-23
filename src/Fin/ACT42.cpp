// Author: Geoff Yoerger
// Date: Apr 16, 2014
// Assignment: Activity/Program ACT42.cpp
// Purpose: Get the sign of an inputted number

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	float number;
	cout << "Please enter a number:" << "\n";
	cin >> number;
	int sign;
	if(number > 0) {
		sign = 1;
	} else if (number < 0) {
		sign = -1;
	} else {
		sign = 0;
	}
	cout << sign << "\n";
	return 0;
}
