// Author: Geoff Yoerger
// Date: Apr 14, 2014
// Assignment: Activity/Program ACT22.cpp
// Purpose: Calculat ethe number of minutes in a year
#include "stdio.h"

int main() {
	double minutes, years;

	double minutesInYear;
	minutesInYear = 365.25 * 24.0 * 60.0;

	years = 1;

	minutes = years * minutesInYear;
	printf("There are %.2f minutes in %.1f years.",
			minutes, years);
	return 0;
}
