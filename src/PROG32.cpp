// Author: Geoff Yoerger
// Date: Apr 15, 2014
// Assignment: Activity/Program PROG32.cpp
// Purpose: TODO

#include "stdio.h"
#include <iostream>
using namespace std;
/**
 * Calculate the weight of a carton
 * @param length the length of the carton in inches
 * @param width the width of the carton in inches
 * @param height the height of the carton in inches
 * @param weight the weight of the carton (per cubic centimeter)
 * @return this cartons total weight
 */
double getWeight(double length, double width, double height, double weight) {
	return length * width * height * weight * 1000;
}
/**
 * Calculate the price that Fed Ex would charge to ship a carton
 * @param weight the total weight of the carton
 * @return FedEx's price for this carton
 */
double getFedExPrice(double weight) {
	return 3.25 * weight;
}

double getOverNitePrice(double length, double height, double width) {
	return length * height * width * 1.20;
}

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	double length, width, height, weight;

	cout << "Please enter the following values about your carton:" << "\n";
	cout << "The length (in meters): ";
	cin >> length;
	cout << "The width: ";
	cin >> width;
	cout << "The height: ";
	cin >> height;
	cout << "And the weight of the substance (lb/cm^3): ";
	cin >> weight;

	double totalWeight = getWeight(length, width, height, weight);

	double FedExPrice = getFedExPrice(totalWeight);
	double OverNitePrice = getOverNitePrice(length, height, width);

	cout << "It would cost $" << FedExPrice << " to ship this carton via FedEx;" << "\n";
	cout << "And it would cost $" << OverNitePrice << " via OverNite." << "\n";

	if (FedExPrice > OverNitePrice) {
		cout << "(OverNite is cheaper)" << "\n";
	} else if (OverNitePrice > FedExPrice) {
		cout << "(FedEx is cheaper)" << "\n";
	} else {
		cout << "(They cost the same)" << "\n";
	}

	return 0;
}
