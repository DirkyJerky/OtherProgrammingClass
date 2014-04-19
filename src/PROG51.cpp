// Author: Geoff Yoerger
// Date: Apr 16, 2014
// Assignment: Activity/Program PROG51.cpp
// Purpose: 

#include "stdio.h"
#include <iostream>

using namespace std;

/**
 *
 * @return The requested number of rooms in their house
 */
int getNumOfRooms() {
	int rooms;
	cout << "Please enter your number of rooms in your house: ";
	cin >> rooms;
	return rooms;
}

/**
 *
 * @return The requested height
 */
float requestHeight() {
	float length;
	cout << "How long is the room (ft)? ";
	cin >> length;
	return length;
}

/**
 *
 * @return The requested width
 */
float requestWidth() {
	float width;
	cout << "How wide is the room (ft)? ";
	cin >> width;
	return width;
}

/**
 * @param rooms The number of rooms in the house
 * @return The total square footage of the house after prompting for each room
 */
float handleLoop(int rooms) {
	float totalFootage = 0;
	for(int i = 1; i <= rooms; i++) {
		cout << "You enter room " << i << "\n";
		totalFootage += (requestHeight() * requestWidth());
	}
	return totalFootage;
}

/**
 * 
 * @return If the program ended succesfully
 */
int main() {
	int rooms = getNumOfRooms();
	float footage = handleLoop(rooms);
	cout << "Your house's square footage is " << footage << " feet squared." << "\n";


	return 0;
}
