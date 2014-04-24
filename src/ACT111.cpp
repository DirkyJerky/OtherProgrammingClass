// Author: Geoff Yoerger
// Date: Apr 22, 2014
// Assignment: Activity/Program ACT111
// Purpose: Turn a given integer into its english word equivalent

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	char numbers[][11] = {"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};
	int num = 0;
	cout << "Please enter a number 0 through 9" << "\n";
	cin >> num;
	if(num < 0 || num > 9) {
		cout << num << " is not between 0 and 9." << "\n";
	} else {
		cout << num << " = \"" << numbers[num] << "\"." << "\n";
	}
	return 0;
}
