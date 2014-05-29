// Author: Geoff Yoerger
// Date: May 29, 2014
// Assignment: Activity/Program EC42
// Purpose: Determine the type of a triangle

#define sidesGet 3
#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int sides[sidesGet];
	cout << "Please enter the three side lengths of your triangle:" << "\n";
	for(int i = 0; i < sidesGet; i++) {
		cout << (i + 1) << ": ";
		cin >> sides[i];
	}
	for(int i = 0; i < (sidesGet - 1); i++) {
		for(int j = 0; j < (sidesGet - 1); j++) {
			if(sides[j] < sides[j + 1]) {
				int temp = sides[j];
				sides[j] = sides[j + 1];
				sides[j + 1] = temp;
			}
		}
	}

	bool leftEq = (sides[0] == sides[1]);
	bool rightEq = (sides[1] == sides[2]);

	cout << "Your triangle is ";
	if(leftEq && rightEq) {
		cout << "an equilateral";
	} else if (leftEq || rightEq) {
		cout << "an isosceles";
	} else {
		cout << "a scalene";
	}
	cout << "." << "\n";

	return 0;
}
