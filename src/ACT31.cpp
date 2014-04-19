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
<<<<<<< HEAD
	return (feet * 12);
=======
	return (feet * 12.0);
>>>>>>> ec62347aca28adff52ef9124403bb7133c9fe1fa
}

/**
* Convert feet to centimeters
* @param feet the number of feet
* @return feet * 30.5
*/
<<<<<<< HEAD
double feetToCM(double
		feet) {
=======
double feetToCM(double feet) {
>>>>>>> ec62347aca28adff52ef9124403bb7133c9fe1fa
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
