// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT72.cpp
// Purpose: Print out all the possible combinations of 3 letters, and total combinations

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	int total = 0;
	cout << "All possible combinations of 3 letters are:" << "\n";
	for(char c1 = 'A'; c1 <= 'Z'; c1++) {
		for(char c2 = 'A'; c2 <= 'Z'; c2++) {
			for(char c3 = 'A'; c3 <= 'Z'; c3++) {
				cout << c1 << c2 << c3 << "\n";
				total++;
			}
		}
	}
	cout << "The total number of combinations is: " << total << "\n";
	return 0;
}
