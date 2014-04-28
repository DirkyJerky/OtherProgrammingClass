// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT82.cpp
// Purpose: Determine if 3 numbers can be sides of a triangle

#include "stdio.h"
#include <iostream>
using namespace std;

/*
 * Pointer for #min(double, double, double)
 */
int min(int arg0, int arg1, int arg2) {
	return (int) min(arg0, arg1, arg2);
}
/*
 * Pointer for #mid(double, double, double)
 */
int mid(int arg0, int arg1, int arg2) {
	return (int) mid(arg0, arg1, arg2);
}
/*
 * Pointer for #max(double, double, double)
 */
int max(int arg0, int arg1, int arg2) {
	return (int) max(arg0, arg1, arg2);
}
/*
 * Get the minimum of 3 numbers
 * @param arg0 Number 1
 * @param arg1 Number 2
 * @param arg2 Number 3
 * @return The smallest of the 3 numbers
 */
double min(double arg0, double arg1, double arg2) {
	if(arg0 <= arg1 && arg0 <= arg2) {
		return arg0;
	} else if(arg1 <= arg0 && arg1 <= arg2) {
		return arg1;
	} else {
		return arg2;
	}
}
/*
 * Get the median of 3 numbers
 * @param arg0 Number 1
 * @param arg1 Number 2
 * @param arg2 Number 3
 * @return The median of the 3 numbers
 */
double mid(double arg0, double arg1, double arg2) {
	if((arg1 >= arg0 && arg0 >= arg2) || (arg2 >= arg0 && arg0 >= arg1)) {
		return arg0;
	} else if((arg0 >= arg1 && arg1 >= arg2) || (arg2 >= arg1 && arg1 >= arg0)) {
		return arg1;
	} else {
		return arg2;
	}
}
/*
 * Get the maximum of 3 numbers
 * @param arg0 Number 1
 * @param arg1 Number 2
 * @param arg2 Number 3
 * @return The largest of the 3 numbers
 */
double max(double arg0, double arg1, double arg2) {
	if(arg0 >= arg1 && arg0 >= arg2) {
		return arg0;
	} else if(arg1 >= arg0 && arg1 >= arg2) {
		return arg1;
	} else {
		return arg2;
	}
}

/**
 * @return If the program ended succesfully
 */
int main() {
	cout << "Please enter 3 sides of a triangle" << "\n";
	double s1, s2, s3;
	cin >> s1;
	cin >> s2;
	cin >> s3;
	if(min(s1, s2, s3) + mid(s1, s2, s3) > max(s1, s2, s3)) {
		cout << "Yes; Those 3 numbers can be the sides of a triangle." << "\n";
	} else {
		cout << "No; Those 3 numbers cannot be the sides of a triangle." << "\n";
	}

	return 0;
}
