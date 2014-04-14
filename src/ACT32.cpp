// Author: Geoff Yoerger
// Date: Apr 14, 2014
// Assignment: Activity/Program ACT32.cpp
// Purpose: Write a mail label outputter

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * Print my contact information
 */
void printContactLabel() {
	cout << "Geoff Yoerger" << "\n";
	cout << "6831 North Francis Drive" << "\n";
	cout << "Evansville, WI - 53536" << "\n";
	cout << "(608) 882-6078" << "\n";
}
/**
 *
 * @return If the program ended succesfully
 */
int main() {
	printContactLabel();
	return 0;
}
