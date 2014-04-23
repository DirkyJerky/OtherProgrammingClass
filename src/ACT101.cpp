// Author: Geoff Yoerger
// Date: Apr 22, 2014
// Assignment: Activity/Program ACT101.cpp
// Purpose: Analyze a persons inputted full name

#include "stdio.h"
#include <iostream>
#include "string.h"
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	cout << "First name?" << "\n";
	char firstName[100];
	cin >> firstName;
	cout << "Last name?" << "\n";
	char lastName[100];
	cin >> lastName;
	cout << "\nAnalysis:" << "\n";
	cout << "Your first name is " << firstName << ".\n";
	cout << "Your last name is " << lastName << ".\n";
	cout << "Your first name is " << strlen(firstName) << " characters long." << "\n";;
	cout << "Your last name is " << strlen(lastName) << " characters long." << "\n";
	int comp = strcmp(firstName, lastName);
	if(comp > 0) {
		cout << "Your first name comes before your last name alphabetically." << "\n";
	} else if(comp < 0) {
		cout << "Your last name comes before your first name alphabetically." << "\n";
	} else {
		cout << "Your first and last names are identical alphabetically." << "\n";
	}
	return 0;
}
