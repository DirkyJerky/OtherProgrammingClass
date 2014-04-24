// Author: Geoff Yoerger
// Date: Apr 22, 2014
// Assignment: Activity/Program ACT112
// Purpose: Count the number of spaces, commans, and periods in a (<=80 long) String (Format --plural)

#include "stdio.h"
#include <iostream>
#include "string.h"
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	char string[81];
	cout << "Please enter a string." << "\n";
	gets(string);

	int commas = 0;
	int periods = 0;
	int spaces = 0;
	for(int i = 0; i < 81; i++) {
		if(string[i] == ' ') {
			spaces++;
		} else if(string[i] == ',') {
			commas++;
		} else if(string[i] == '.') {
			periods++;
		}
	}
	char commaPlural, periodPlural, spacePlural;
	if(commas != 1) commaPlural = 's'; else commaPlural = ' ';
	if(periods != 1) periodPlural = 's'; else periodPlural = ' ';
	if(spaces != 1) spacePlural = 's'; else spacePlural = ' ';
	cout << "In your string there are:" << "\n";
	cout << commas << " comma" << commaPlural << "\n";
	cout << periods << " period" << periodPlural << "\n";
	cout << spaces << " space" << spacePlural << "\n";
	return 0;
}
