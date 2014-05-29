// Author: Geoff Yoerger
// Date: May 29, 2014
// Assignment: Activity/Program EC43
// Purpose: Determine the number of boxes needed.

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int pots;
	cout << "How many flower pots do you need to be shipped?" << "\n";
	cin >> pots;
	pots = (pots < 0) ? 0 : pots; // Set to zero if its less than zero

	int big, med;
	big = (pots - (pots % 9))/9;
	pots -= (big * 9);
	med = (pots - (pots % 4))/4;
	pots -= (med * 4);
//	sml = pots; // pots is the number of small boxes atm

	cout << "You will need..." << "\n";
	cout << "    " << big << " big boxes," << "\n";
	cout << "    " << med << " medium boxes," << "\n";
	cout << "    " << pots << " small boxes." << "\n";
	cout << "Thank you for your order!" << "\n";


	return 0;
}
