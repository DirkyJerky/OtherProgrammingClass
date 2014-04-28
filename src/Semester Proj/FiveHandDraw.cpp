// Author: Geoff Yoerger
// Date: Apr 28, 2014
// Assignment: Final Project: FiveHandDraw
// Purpose: Play Five card draw!

#include "stdio.h"
#include "string.h"
#include <iostream>
#include "ctype.h"
#include "stdlib.h"
#include "time.h"
using namespace std;


// Used for error handling
int error;

// Global deck of cards
// cardDeck[*][0] == Value
// cardDeck[*][1] == Suit
char cardDeck[52][2];

// Number of cards in the deck currently
int cardsInDeck;

// Character representation of the 13 card values
char readableCardVals[] = {'A', 'K', 'Q', 'J', '0', '9', '8',
		'7', '6', '5', '4', '3', '2',};

// Representation of the 13 card values in a lexographic ordered format
char orderedCardVals[] = {'A', 'C', 'E', 'J', 'L', 'N', 'O',
		'S', 'T', 'V', 'X', 'Y', 'Z',};

// Number of card values constant
int numCardValues = 13;

// All the suits
char readableSuits[] = {'C', 'D', 'H', 'S'};

// The number of suits
int numSuits = 4;

// Dealer and players hand
char hand_dealer[5][2];
char hand_player[5][2];

//Values of the card on "hold" after #cardFromDeck(void)
char hold_card[2];


int fillDeck() {
	cardsInDeck = 0;
	// Iter over orderedCardVales[]
	for(int i = 0; i < numCardValues; i++) {
		// Iter over readableSuits[]
		for(int j = 0; j < numSuits; j++) {
			cardDeck[cardsInDeck][0] = orderedCardVals[i];
			cardDeck[cardsInDeck][1] = readableSuits[j];
			cardsInDeck++;
		}
	}
	if(cardsInDeck != 52) {
		return -1;
	}
	return 0;

}


char getCardChar(char readableChar) {
	char val = toupper(readableChar);
	for(int i = 0; i < numCardValues; i++) {
		if(val != readableCardVals[i]) {
			continue;
		} else {
			return orderedCardVals[i];
		}
	}
	// If its not in readableCharVals[]; return null
	return '\0';
}
char getReadableCardChar(char orderedChar) {
	char val = toupper(orderedChar);
	for(int i = 0; i < numCardValues; i++) {
		if(val != orderedCardVals[i]) {
			continue;
		} else {
			return readableCardVals[i];
		}
	}
	// If its not in orderedCardVals[]; return null
	return '\0';
}

void printCard(char card[2]) {
	cout << getReadableCardChar(card[0]);
	cout << card[1];
}

// Get a card from the deck
void cardFromDeck() {
	int randomCardNum = rand() % cardsInDeck; // Selects one card location from the deck
	// Duplicate that card to the 'hold' slot
	hold_card[0] = cardDeck[randomCardNum][0];
	hold_card[1] = cardDeck[randomCardNum][1];
	// Shift the last 'card' in the deck to the old place of the 'held' card
	cardDeck[randomCardNum][0] = cardDeck[cardsInDeck - 1][0];
	cardDeck[randomCardNum][1] = cardDeck[cardsInDeck - 1][1];
	// Decrease the supposed 'amount of cards' in the deck
	cardsInDeck--;
	// Set old to null characters
	cardDeck[cardsInDeck][0] = '\0';
	cardDeck[cardsInDeck][1] = '\0';
}

// Put a card back into the deck
void deckFromCard() {
	if(hold_card[0] == '\0' || hold_card[1] == '\0') {
		return;
	}
	cardDeck[cardsInDeck][0] = hold_card[0];
	cardDeck[cardsInDeck][1] = hold_card[1];
	cardsInDeck++;
	hold_card[0] = '\0';
	hold_card[1] = '\0';

}

void fillHandsInit() {
	for(int i = 0; i < 5; i++) {
		cardFromDeck();
		hand_player[i][0] = hold_card[0];
		hand_player[i][1] = hold_card[1];
	}
	for(int i = 0; i < 5; i++) {
		cardFromDeck();
		hand_dealer[i][0] = hold_card[0];
		hand_dealer[i][1] = hold_card[1];
	}
}

void printFullCard(char card[2], bool full) {
	char name[], suit[];
	//Val
	switch(getReadableCardChar(card[0])) {
		case 'A': name = "Ace"; break;
		case 'K': name = "King"; break;
		case 'Q': name = "Queen"; break;
		case 'J': name = "Jack"; break;
		case '0': name = "Ten"; break;
		case '9': name = "Nine"; break;
		case '8': name = "Eight"; break;
		case '7': name = "Seven"; break;
		case '6': name = "Six"; break;
		case '5': name = "Five"; break;
		case '4': name = "Four"; break;
		case '3': name = "Three"; break;
		case '2': name = "Two"; break;
		case '\0': name = "\0"; break;
		default: name = "\0"; break;
	}
	//Suit
	switch(card[1]) {
		case 'C': suit = "Clubs"; break;
		case 'D': suit = "Diamonds"; break;
		case 'H': suit = "Hearts"; break;
		case 'S': suit = "Spades"; break;
		case '\0': name = "\0"; break;
		default: name = "\0"; break;
	}
	if(full) {
		cout << name << " of " << suit;
	} else {
		cout << name << "\n";
	}
}
void printFullCard(char card[2]) {
	printFullCard(card, true);
}

bool yesNo() {
	char resp = '\0';
	cout << "(y/n): ";
	do {
		cin >> resp;
	} while(resp != 'Y' && resp != 'y' && resp != 'N' && resp != 'n');
	if(resp == 'Y' || resp == 'y') {
		return true;
	}
	return false;
}

void discardStep() {
	bool shouldDiscard[5];
	cout << "You have the following cards:" << "\n";
	for(int i = 0; i < 5; i++) {
		cout << i << ": ";
		printFullCard(hand_player[i]);
		cout << "\n";
	}
	for(int i = 0; i < 5; i++) {
		cout << "Do you want to discard card #" << i + 1 << ", the ";
				printFullCard(hand_player[i], false);
		cout << "? ";
		shouldDiscard[i] = yesNo();
	}
	for(int i = 0; i < 5; i++) {
		if(!shouldDiscard[i]) {
			continue;
		}

	}
}

/**
 * @return If the program ended succesfully
 */
int main() {
	srand(time('\0')); // Seed the rand()
	fillDeck();
	// Step 1
//	for(int i = 0; i < cardsInDeck; i++) {
//		cout << "\nCard " << i + 1 << ": ";
//        printCard(cardDeck[i]);
//	}
	fillHandsInit();
	// Step 3
//	for(int i = 0; i < 5; i++) {
//		cout << "Card " << i + 1 << ": ";
//		printCard(hand_player[i]);
//		cout << "" << "\n";
//	}

	//TODO:Ask the user what card(s) he wants to discard
	// Replace with new cards
	// -- Print: player and dealers hands
	discardStep();

	//TODO: Determine the winner, And how they won.

	//TODO: Implement Betting (See sheet)

	//TODO: EC: Do the game until the player reaches $0 or decides to quit.
	return 0;
}
