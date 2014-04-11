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
int feetToInches(int feet) {
	return (feet * 12);
}

/**
* Convert feet to centimeters
* @param feet the number of feet
* @return feet * 30.5
*
*/
double feetToCM(int feet) {
	return (feet * 30.5);
}

int main() {
	int feet;
	cout << "Please enter a number of feet: ";
	cin >> feet;

	int inches;
	inches = feetToInches(feet);

	double centimeters;
	centimeters = feetToCM(feet);

	printf("\nThere are %d inches and %.1f centimeters in %d feet.",
			inches, centimeters, feet);

	return 0;
}
