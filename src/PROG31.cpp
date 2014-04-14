// Author: Geoff Yoerger
// Date: Apr 14, 2014
// Assignment: Activity/Program PROG31.cpp
// Purpose: Calculate the weight of a carton to be shipped

#include "stdio.h"
#include <iostream>
using namespace std;

/**
 * Calculate the weight of a carton
 * @param length the length of the carton in inches
 * @param width the width of the carton in inches
 * @param height the height of the carton in inches
 * @param weight the weight of the carton (per cubic inch)
 * @return this cartons total weight
 */
double getWeight(double length, double width, double height, double weight) {
	return length * width * height * weight;
}

/**
 * Print the weight of a carton
 * @param weight the total weight of the carton
 */
void printWeight(double weight) {
	cout << "The total weight of the carton is " << weight << "\n";
}

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	double length, width, height, weight;
	cout << "Please enter the following values about your carton:" << "\n";
	cout << "The length (in inches): ";
	cin >> length;
	cout << "The width: ";
	cin >> width;
	cout << "The height:";
	cin >> height;
	cout << "And the weight of the substance (per cubic inch)";
	cin >> weight;
	
	double totalWeight = getWeight(length, width, height, weight);

	printWeight(totalWeight);
	return 0;
}
