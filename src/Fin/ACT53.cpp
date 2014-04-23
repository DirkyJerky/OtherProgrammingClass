// Author: Geoff Yoerger
// Date: Apr 16, 2014
// Assignment: Activity/Program ACT53.cpp
// Purpose: Sum up all the numbers from input-num to 2*input-num

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int n;
	cout << "Please enter a number: ";
	cin >> n;
	int n1, n2;
	if(n > 0) {
		n1 = n;
		n2 = n * 2;
	} else {
		n1 = n * 2;
		n2 = n;
	}
	int sum = 0;
	for(int i = n1; i <= n2; i++) {
		sum += i;
	}
	cout << "The sum of all the numbers from "
			<< n1 << " to " << n2 << " is " << sum << "\n";
	return 0;
}
