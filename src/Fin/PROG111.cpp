// Author: Geoff Yoerger
// Date: Apr 22, 2014
// Assignment: Activity/Program PROG111
// Purpose: Repeatitivly get (<=40) Strings (terminate via "quit" or "QUIT") and analyze all

#include "stdio.h"
#include <iostream>
#include "string.h"
using namespace std;
int longestIndex(char Strings[20][41], int arrlen) {
	unsigned int len = 0;
	int loc = 0;
	for(int i = 0; i < arrlen; i++) {
		if(strlen(Strings[i]) > len) {
			loc = i;
			len = strlen(Strings[i]);
		}
	}
	return loc;
}
void printInfo(int total, char longestString[41], int longestLen, char first[41], char last[41]) {
	cout << "You entered " << total << " Strings.\n";
	cout << "The longest string was " << longestString << ".\n";
	cout << "It was " << longestLen << " chars long.\n";
	cout << "The first string was " << first << ".\n";
	cout << "The last string was " << last << ".\n";
}

/**
 *
 * @return If the program ended succesfully
 */
int main() {
	char allStrings[20][41];
	int j = 0;
	bool doCont = true;
	cout << "Please enter < 20 strings, enter quit to quit." << "\n";
	while(doCont && j < 20) {
			cout << "String?" << "\n";
			cin >> allStrings[j];
			if(strcmp(allStrings[j],"QUIT") == 0) {
				doCont = false;
			} else if (strcmp(allStrings[j],"quit") == 0) {
				doCont = false;
			}
			j++;
	}
	// Total strings; Length of longest string
	int total, longest;
	// Index of: first string; last string; and longest string
	unsigned int first, last, longestS;


	total = j - 1;
	longestS = longestIndex(allStrings, total);
	longest = strlen(allStrings[longestS]);
	first = 0;
	last = total - 1;

	printInfo(total, allStrings[longestS], longest, allStrings[first], allStrings[last]);

	return 0;
}
