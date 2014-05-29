// Author: Geoff Yoerger
// Date: May 29, 2014
// Assignment: Activity/Program EC41
// Purpose: Get the largest of 3 numbers

#define numsGet 3
#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int nums[numsGet];
	cout << "Please enter 3 numbers:" << "\n";
	for(int i = 0; i < numsGet; i++) {
		cout << (i + 1) << ": ";
		cin >> nums[i];
	}
	for(int i = 0; i < (numsGet - 1); i++) {
		for(int j = 0; j < (numsGet - 1); j++) {
			if(nums[j] < nums[j + 1]) {
				int temp = nums[j];
				nums[j] = nums[j + 1];
				nums[j + 1] = temp;
			}
		}
	}
	cout << "The largest of those three numbers is: " << nums[0] << ".\n";
	return 0;
}
