// Author: Geoff Yoerger
// Date: Apr 22, 2014
// Assignment: Activity/Program PROG101
// Purpose: Get&Out the "mode" of 20 inputted integers

#include "stdio.h"
#include <iostream>
using namespace std;

int mode(int integers[20]) {
	int mode, temp;
	int quantityOfMode = 0;
	for(int i = 0; i < 20; i++) {
		temp = 0;
		for(int j = 0; j < 20; j++) {
			if(integers[i] == integers[j]) {
				temp++;
			}
		}
		if(temp > quantityOfMode) {
			mode = integers[i];
			quantityOfMode = temp;
		}
	}
	return mode;
}
/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int twentyNums[20];
	cout << "Please enter 20 numbers" << "\n";
	for (int i = 0; i < 20; i++) {
		cout << i + 1 << ": ";
		cin >> twentyNums[i];
	}
	int theMode = mode(twentyNums);
	cout << "The mode of those numbers is " << theMode << "." << "\n";
	return 0;
}
