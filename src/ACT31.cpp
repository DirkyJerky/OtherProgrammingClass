// Geoff Yoerger
#include "stdio.h"
#include <iostream>
using namespace std;

/**
* Convert feet to inches
* @param feet the number of feet
* @return feet * 12
*/
double feetToInches(double feet) {
	return (feet * 12.0);
}

/**
* Convert feet to centimeters
* @param feet the number of feet
* @return feet * 30.5
*/
double feetToCM(double feet) {
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

	printf("\nThere are %.10g inches and %.10g centimeters in %.10g feet.",
			inches, centimeters, feet);

	return 0;
}
