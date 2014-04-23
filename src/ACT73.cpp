// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT73.cpp
// Purpose: Add a list of positive numbers; neg number terminates

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	cout << "Enter a list of positive numbers. Enter a negative to quit." << "\n";
	double total = 0.0;
	double num;
	do {
		cin >> num;
		if(num > 0) {
			total += num;
		}
	} while(num >= 0);
	cout << "The total of your numbers is " << total << "\n";
	return 0;
}
