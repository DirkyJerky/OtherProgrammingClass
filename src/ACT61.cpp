// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT61.cpp
// Purpose: Encode a string

#include "stdio.h"
#include <iostream>
using namespace std;

char *encode(char *string) {
	int len = strlen(string);
	char flipAround = string[(int) (len / 2)];
	for(int i = 0; i < len; i++) {
		string[i] =  2 + flipAround - (string[i] - flipAround);
	}
	return string;
}

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	char encodeMe[] = "";
	cout << "Please enter a String: ";
	cin >> encodeMe;
	cout << "Your encoded string is " << encode(encodeMe) << ".\n";
	return 0;
}
