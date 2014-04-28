// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT81.cpp
// Purpose: Create min() and overload for char, int, and doubles

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * @return If the program ended succesfully
 */
int main() {
	cout << "min('A', 'a')" << "\n";
	cout << "->> " << min('A', 'a') << "\n";
	cout << "min('A', 'C')" << "\n";
	cout << "->> " << min('A', 'C') << "\n";
	cout << "min('A', '!')" << "\n";
	cout << "->> " << min('A', '!') << "\n";
	cout << "min(1, 2)" << "\n";
	cout << "->> " << min(1, 2) << "\n";
	cout << "min(0.454341, 5243.423)" << "\n";
	cout << "->> " << min(0.454341, 5243.423) << "\n";
	cout << "min(0, 0)" << "\n";
	cout << "->> " << min(0, 0) << "\n";
	cout << "min(-1111, 000001111)" << "\n";
	cout << "->> " << min(-1111, 000001111) << "\n";
	return 0;
}
/**
 * Get the smaller of 2 numbers
 * @param arg0 One of the compared numbers
 * @param arg1 The other compared number
 * @return The smaller of the two.
 */
char min(char arg0, char arg1) {
	if(arg0 < arg1) {
		return arg0;
	} else {
		return arg1;
	}
}
/**
 * Get the smaller of 2 numbers
 * @param arg0 One of the compared numbers
 * @param arg1 The other compared number
 * @return The smaller of the two.
 */
int min(int arg0, int arg1) {
	if(arg0 < arg1) {
		return arg0;
	} else {
		return arg1;
	}
}
/**
 * Get the smaller of 2 numbers
 * @param arg0 One of the compared numbers
 * @param arg1 The other compared number
 * @return The smaller of the two.
 */
double min(double arg0, double arg1) {
	if(arg0 < arg1) {
		return arg0;
	} else {
		return arg1;
	}
}
