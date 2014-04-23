// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT61.cpp
// Purpose: Encode a string

#include "stdio.h"
#include <iostream>
#include "string.h"
using namespace std;

char *encode(char *string) {
	int len = strlen(string);
	char flipAround = string[(int) (len / 2)];
	for(int i = 0; i < len; i++) {
		string[i] = flipAround - (string[i] - flipAround);
		//Make sure its between 32 and 127
		while(string[i] < 32) {
			string[i] += 32;
		}
		while(string[i] >= 127) {
			string[i] -= 32;
		}
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
	cout << "Your encoded string is \"" << encode(encodeMe) << "\".\n";
	return 0;
}
