// Author: Geoff Yoerger
// Date: Apr 22, 2014
// Assignment: Activity/Program ACT102
// Purpose: Pad an inputted string to 60 characters using periods

#include "stdio.h"
#include <iostream>
#include "string.h"
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	char string[61];
	cout << "Please input a string." << "\n";
	cin >> string;
	for(int i = strlen(string); i < 60; i++) {
		string[i] = '.';
	}
	string[60] = '\0';
	cout << "Your padded string is:" << "\n";
	cout << string << "\n";
	return 0;
}
