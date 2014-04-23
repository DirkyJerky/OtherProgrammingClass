// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT62.cpp
// Purpose: Repeatily compute dis / time = rate

#include "stdio.h"
#include <iostream>
using namespace std;

bool doContinue() {
	char response[] = {};
	cout << "Do you want to continue? (Y/N) ";
	cin >> response;
	if(response[0] == 'y' || response[0] == 'Y') {
		return true;
	}
	return false;
}

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	double dist, time;
	do {
		cout << "Please enter your time in hours: ";
		cin >> time;
		cout << "Please enter your distance in miles: ";
		cin >> dist;
		cout << "You need to go " << (dist / time) << " miles/hour" << "\n";
	} while(doContinue());
	return 0;
}
