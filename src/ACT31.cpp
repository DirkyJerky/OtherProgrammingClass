// Geoff Yoerger
#include "stdio.h"
#include <iostream>
using namespace std;

/**
* Convert feet to inches
* @param feet the number of feet
* @return feet * 12
*
*/
double feetToInches(double feet) {
	return (feet * 12);
}

/**
* Convert feet to centimeters
* @param feet the number of feet
* @return feet * 30.5
*
*/
double feetToCM(double
		feet) {
	return (feet * 30.5);
}

int main() {
	double feet;
	cout << "Please enter a number of feet: ";
	cin >> feet;

	double inches;
	inches = feetToInches(feet);

	double centimeters;
	centimeters = feetToCM(feet);

	printf("\nThere are %.2f inches and %.2f centimeters in %.2f feet.",
			inches, centimeters, feet);

	return 0;
}
