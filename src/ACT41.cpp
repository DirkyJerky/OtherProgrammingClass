// Author: Geoff Yoerger
// Date: Apr 15, 2014
// Assignment: Activity/Program ACT41.cpp
// Purpose: Add or subtract two integers

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	cout << "Do you want to add or subract 2 integers? (+ or -)" << "\n";
	char response;
	cin >> response;
	cout << "Please enter 2 integers:" << "\n";
	int num1, num2;
	cin >> num1 >> num2;
	if(response == 'm' || response == '-') {
		response = '-';
	} else {
		response = '+';
	}
	int answer;
	if(response == '+') {
		answer = num1 + num2;
	} else {
		answer = num1 - num2;
	}
	cout << num1 << ' ' << response << ' ' << num2 << " = " << answer << "\n";
	return 0;
}
