// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program PROG82.cpp
// Purpose: Ask for number of cents (< 100, be smart), make:
// Quarters, dimes, nickels, and pennies

#include "stdio.h"
#include <iostream>
using namespace std;

int toCents(double value) {
	if(value < 1) {
		return value * 100;
	}
	return value;
}

int numCoins(int cents, int coinValue) {
	// Round down to a multple of coinValue
	int rounded = cents - (cents % coinValue);
	// Return the instances of coinValue in the rounded number.
	return rounded / coinValue;
}

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	cout << "Please enter a number of cents." << "\n";
	double response;
	cin >> response;
	int cents = toCents(response);
	int initialCents = cents;
	int quarters, dimes, nickels, pennies;
	int val;

	val = 25;
	quarters = numCoins(cents, val);
	cents -= quarters * val;

	val = 10;
	dimes = numCoins(cents, val);
	cents -= dimes * val;

	val = 5;
	nickels = numCoins(cents, val);
	cents -= nickels * val;

	// Leftover cents "Should" be pennies
	pennies = cents;

	cout << "In " << initialCents << " cents there are:" << "\n";
	if(quarters != 0) cout << quarters << " quarters" << "\n";
	if(dimes != 0) cout << dimes << " dimes" << "\n";
	if(nickels != 0) cout << nickels << " nickels" << "\n";
	if(pennies != 0) cout << pennies << " pennies" << "\n";

	return 0;
}
