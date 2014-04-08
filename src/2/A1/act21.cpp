#include "stdio.h"

/**
* Convert from dollars to pounds
* @param dollars The number of dollars
* @return The dollars converted to pounds
*/
float pounds(float dollars) {
	return dollars * 2;
}
/**
* Convert from dollars to cents
* @param dollars The number of dollars
* @return the dollars converted to  cents
*/
int cents(float dollars) {
	return (int) (dollars * 100);
}
int main() {
	float dollars;

	printf("Please enter a dollar amount: ");
	scanf("%f", &dollars);
	printf("\n");
	printf("$%.2f equals %.2f pounds.\n", dollars, pounds(dollars));
	printf("$%.2f equals %d cents.\n", dollars, cents(dollars));


	return 0;
}
