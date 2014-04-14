// Author: Geoff Yoerger
// Date: Apr 14, 2014
// Assignment: Activity/Program ACT33.cpp
// Purpose: Take a food order and print the reciept

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * @param burgers The number of burgers ordered
 * @param fries The number of fries ordered
 * @param cokes The number of cokes ordered
 */
void printRecipt(int burgers, int fries, int cokes) {
	cout << "You ordered:" << "\n";
	cout << burgers << " burgers" << "\n";
	cout << fries << " fries" << "\n";
	cout << cokes << " cokes" << "\n";
}



/**
 *
 * @return If the program ended succesfully
 */
int main() {
	int burgers, fries, cokes;

	cout << "How many burgers?\n";
	cin >> burgers;
	cout << "How many fries?\n";
	cin >> fries;
	cout << "How many cokes?" << "\n";
	cin >> cokes;
	cout << "    Thank you!" << "\n";

	printRecipt(burgers, fries, cokes);

	return 0;
}
