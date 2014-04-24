// Author: Geoff Yoerger
// Date: Apr 22, 2014
// Assignment: Activity/Program ACT121
// Purpose: Repetitvly generate 10 random numbers

#include "stdio.h"
#include "stdlib.h"
#include <iostream>
#include "time.h"
using namespace std;

/**
 * Prompt the user if they want to continue looping or not
 * @return If they want to continue
 */
bool shouldContinue() {
	cout << "Do you want to continue? (y/n) ";
	char response[5];
	cin >> response;
	return (response[0] == 'Y' || response[0] == 'y');
}

/**
 * @return If the program ended succesfully
 */
int main() {
	srand(time(NULL));
	do {
		for (int i = 0; i < 10; ++i) {
			cout << rand() << "\n";
		}
	} while(shouldContinue());
	return 0;
}
