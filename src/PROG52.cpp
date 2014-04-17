// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program PROG52.cpp
// Purpose: Make an addition practice program

#include "stdio.h"
#include "stdlib.h"
#include <iostream>
using namespace std;

/**
 * Get a seed number from the user
 * @return a seed number
 */
int getSeed() {
	cout << "Please enter a 'seed' number (integer)" << "\n";
	int seed;
	cin >> seed;
	return seed;
}
/**
 * Returns a number from (seed/2) to (seed + seed/2)
 * @return The new seed
 */
int genRand(int seed) {
	if(seed <= 10) seed *= 2;
	if(seed <= 10) seed += 10;
	seed *= 1.1;
	return (rand() % seed) + seed / 2;
}

/**
 * Handle the 20 different addition tests
 * @return the number of correct answers
 */
int handleTests(int seed1, int seed2) {
	int correct = 0;
	int response, correctAns;
	for(int i = 1; i <= 20; i++) {
		seed1 = genRand(seed1);
		seed2 = genRand(seed2);
		cout << "Problem " << i << ": ";
		cout << seed1 << " + " << seed2 << " = ";
		cin >> response;
		correctAns = seed1 + seed2;
		if(correctAns == response) {
			cout << "Correct; ";
			correct++;
		} else {
			cout << "Wrong; ";
		}
		cout << seed1 << " + " << seed2 << " = " << correctAns << "\n";
	}
	return correct;
}
/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int correct = handleTests(getSeed(), getSeed());
	cout << "You got " << correct << "/20 addition problems correct" << "\n";
	return 0;
}
