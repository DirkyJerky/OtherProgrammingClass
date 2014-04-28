// Author: Geoff Yoerger
// Date: Apr 17, 2014
// Assignment: Activity/Program ACT71.cpp
// Purpose: Play rock paper scissors

#include "stdio.h"
#include <iostream>
using namespace std;
char getRPS(int playerNum) {
	cout << "Player " << playerNum << "\n";
	cout << "Please enter R for rock, P for paper, or S for scissors." << "\n";
	char inputChar;
	cin >> inputChar;
	return inputChar;
}
/**
 * @return If the program ended succesfully
 */
int main() {
	char player1 = getRPS(1);
	char player2 = getRPS(2);
	switch(player1) {
	case 'R': {
		switch(player2) {
		case 'R': {
			cout << "Tie; Rock ties rock." << "\n";
			break;
		}
		case 'S': {
			cout << "Player 1; Rock crushes scissors." << "\n";
			break;
		}
		case 'P': {
			cout << "Player 2; Rock is covered by paper." << "\n";
			break;
		}
		}
		break;
	}
	case 'S': {
		switch(player2) {
		case 'R': {
			cout << "Player 2; Scissors is crushed by rock." << "\n";
			break;
		}
		case 'S': {
			cout << "Tie; Scissors ties scissors." << "\n";
			break;
		}
		case 'P': {
			cout << "Player 1; Scissors cuts paper." << "\n";
			break;
		}
		}
		break;
	}
	case 'P': {
		switch(player2) {
		case 'R': {
			cout << "Player 1; Paper covers rock" << "\n";
			break;
		}
		case 'S': {
			cout << "Player 2; Paper gets cut by scissors." << "\n";
			break;
		}
		case 'P': {
			cout << "Tie; Paper ties paper." << "\n";
			break;
		}
		}
		break;
	}
	}
	return 0;
}
