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
