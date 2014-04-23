// Author: Geoff Yoerger
// Date: Apr 16, 2014
// Assignment: Activity/Program ACT52.cpp
// Purpose: Print all the perfect squares between 1 and the inputted number

#include "stdio.h"
#include <iostream>

using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int n;
	cout << "Please enter a number: ";
	cin >> n;
	cout << "The perfect squares between 1 and " << n << " are:" << "\n";
	for(int i = 1; i * i <= n; i++) {
		cout << i * i << "\n";
	}
	return 0;
}
