// Geoff Yoerger
// Activity 3.1
// AHEAD
// Convert feet to inches and centimeters
#include "stdio.h"
#include "iostream.h"

/**
* Convert feet to inches
* @param feet the number of feet
* @return feet * 12
*
*/
int inches(int feet) {
	return (feet * 12);
}

/**
* Convert feet to centimeters
* @param feet the number of feet
* @return feet * 30.5
*
*/
double centimeters(int feet) {
	return (feet * 30.5);
}

int main() {
	int feet;
	cout << "Please enter a number of feet: ";
	cin >> feet;

	int inches;
	inches = inches(feet);

	double centimeters;
	centimeters = centimeters(feet);

	printf("\n\n There are %d inches and %.1f centimeters in %d feet.",
			inches, centimeters, feet);

	return 0;
}