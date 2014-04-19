// Author: Geoff Yoerger
// Date: Apr 16, 2014
// Assignment: Activity/Program ACT51.cpp
// Purpose: 

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int num;
	cout << "Please enter a number: ";
	cin >> num;
	int digits;
	if((num >= 10000) || (num <= -10000)) {
		digits = 5;
	} else if ((num >= 1000) || (num <= -1000)) {
		digits = 4;
	} else if ((num >= 100) || (num <= -100)) {
		digits = 3;
	} else if ((num >= 10) || (num <= -10)) {
		digits = 2;
	} else if ((num >= 1) || (num <= -1)) {
		digits = 1;
	} else {
		digits = 0;
	}
	cout << num << " has " << digits << " digit";
	if(digits == 1) {
		cout << ".";
	} else {
	    cout << "s."; // Grammar!
	}
	return 0;
}
