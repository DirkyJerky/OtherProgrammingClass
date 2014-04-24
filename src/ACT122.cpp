// Author: Geoff Yoerger
// Date: Apr 22, 2014
// Assignment: Activity/Program ACT122
// Purpose: Ask for 5 floats, ints, strings; Output padded (10 width, [3 precistion])

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	float floats;
	for (int i = 0; i < 5; i++) {
		cout << "Please enter a float" << "\n";
		cin >> floats;
		printf("Your padded float: \"%10.3f\" \n", floats);
	}
	int ints;
	for (int i = 0; i < 5; i++) {
		cout << "Please enter a int" << "\n";
		cin >> ints;
		printf("Your padded int: \"%.10d\" \n", ints);
	}
	char strings[10][5];
	for (int i = 0; i < 5; i++) {
		cout << "Please enter a string" << "\n";
		cin >> strings[i];
		printf("Your padded string: \"%.10s\" \n", strings[i]);
	}
	return 0;
}
