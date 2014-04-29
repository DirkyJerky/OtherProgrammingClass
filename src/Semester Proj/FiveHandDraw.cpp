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

//[0,1] = ID for win method
//[2] = '-'
//[3] ID of high/main card used in the win method
//[4-7] The rest of the 4 cards
char outcome_player[9];
char outcome_dealer[9];

// NOTE:
// The lesser the value of the 2 outcomes lexographicaly
// ====
// THE BETTER HAND


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
	// Not supported in windows :(
//	switch(card[1]) {
//	case 'C': cout << "\u2663"; break;
//	case 'D': cout << "\u2662"; break;
//	case 'H': cout << "\u2661"; break;
//	case 'S': cout << "\u2660"; break;
//	default: cout << "\0"; break;
//	}
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
	char name[10], suit[10];
	//Val
	switch(getReadableCardChar(card[0])) {
		case 'A': strcpy(name, "Ace"); break;
		case 'K': strcpy(name, "King"); break;
		case 'Q': strcpy(name, "Queen"); break;
		case 'J': strcpy(name, "Jack"); break;
		case '0': strcpy(name, "Ten"); break;
		case '9': strcpy(name, "Nine"); break;
		case '8': strcpy(name, "Eight"); break;
		case '7': strcpy(name, "Seven"); break;
		case '6': strcpy(name, "Six"); break;
		case '5': strcpy(name, "Five"); break;
		case '4': strcpy(name, "Four"); break;
		case '3': strcpy(name, "Three"); break;
		case '2': strcpy(name, "Two"); break;
		case '\0': strcpy(name, "\0"); break;
		default: strcpy(name, "\0"); break;
	}
	//Suit
	switch(card[1]) {
		case 'C': strcpy(suit, "Clubs"); break;
		case 'D': strcpy(suit, "Diamonds"); break;
		case 'H': strcpy(suit, "Hearts"); break;
		case 'S': strcpy(suit, "Spades"); break;
		case '\0': strcpy(suit, "\0"); break;
		default: strcpy(suit, "\0"); break;
	}
	if(full) {
		cout << name << " of " << suit;
	} else {
		cout << name;
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
		cout << i + 1 << ": ";
		printFullCard(hand_player[i]);
		cout << "\n";
	}
	cout << "Do you want to discard: " << "\n";
	for(int i = 0; i < 5; i++) {
		cout << "\tCard #" << i + 1 << ", the ";
		printFullCard(hand_player[i], false);
		cout << " (";
		printCard(hand_player[i]);
		cout << ")? ";
		shouldDiscard[i] = yesNo();
	}
	for(int i = 0; i < 5; i++) {
		if(!shouldDiscard[i]) {
			continue;
		}
		hold_card[0] = hand_player[i][0];
		hold_card[1] = hand_player[i][1];
		deckFromCard(); // Transfer the card back into the "deck"
		cardFromDeck(); // Get a new card
		hand_player[i][0] = hold_card[0];
		hand_player[i][1] = hold_card[1];
	}
}
char tempChars[9]; // Used for transfering stuff
void evalWinMethod(char hand[5][2]) {
	//FunFunFun!
	bool hasNotFoundWin = true;
	// Counters!
	int i1, i2, i3;

	// Properties!
	bool prop_sameSuit = false;
	bool prop_consecutive = false;

	char winMethod[2];
	char finalOrderedCards[5];

	// Used for evaluating based on order
	char tempOrderedCards[5];
	// Init
	for(int i = 0; i < 5; i++) {
		tempOrderedCards[i] = hand[i][0];
	}

	// 5 times...
	for(int i = 0; i < 5; i++) {
		//For every card BUT the last one..
		for(int j = 0; j < 4; j++) {
			//IF the next card is of GREATER VALUE
			// (lesser weight computationally);
			if(tempOrderedCards[j] > tempOrderedCards[j + 1]) {
				//SWAP
				i1 = tempOrderedCards[j];
				tempOrderedCards[j] = tempOrderedCards[j + 1];
				tempOrderedCards[j + 1] = i1;
			}
		}
	}

	// Four of a kind: "FA"
	// We only need to check 2 cards in the hand;
	// For if its 4 of a kind there will only be 2 distinct values
	// in the hand, We just need to make sure we compare atleast
	// once with each card value then.
	// If its not a FOAK hand, this will just silently stop after 2 tries.

	// TODO: Redo using tempOrderedCards[] TO eliminate complex logic
	// Like the "else if (i1 != 4)" block
	for(int i = 0; i < 2; i++) {
		i1 = 0; // Similarity counter
		i2 = 0; // Value tracker
		i3 = -1; // Location of the odd card
		for(int j = 0; j < 5; j++) { // For each card in the hand ...
			// Count the number of card values in hand
			// equal to card #i's value
			if(hand[i][0] == hand[j][0]) {
				i1++;
				if(i1 == 4) {
					// Hold the value, its a winner!
					i2 = hand[i][0];
				}
			} else if (i1 != 4) {
				// If there is a FOAK, And we found an odd card
				// The only possibility is that this is the last card
				// and its not part of the FOAK, So we do
				// NOT Want to track the OTHER cards as the odd card,
				// For they are part of the FOAK
				i3 = j;
			}
		}
		// If we have 4 of a card value, then we have a FOAK!
		if(i1 == 4) {
			hasNotFoundWin = false;
			winMethod[0] = 'F'; // Four of
			winMethod[1] = 'A'; // A kind
			if(i3 == 0) {
				// Use other than the 'odd' card for value tracking
				finalOrderedCards[0] = hand[1][0];
			} else {
				finalOrderedCards[0] = hand[0][0];
			}
			for(int i = 1; i < 4; i++) {
				finalOrderedCards[i] = finalOrderedCards[0];
				// Fill the rest of the other 3 slots
			}
			finalOrderedCards[4] = hand[i3][0];
			// Put the odd card into the LAST ordered slot
		}
	}

	// Straight Flush: "FC"
	if(hasNotFoundWin) {
		i1 = true; // Used here as a boolean, a 'complete truth tracker'
		// to track if all the cards are the same suit

		// For each card in hand...
		for(int i = 0; i < 5; i++) {
			// For each card AFTER i...
			for(int j = i + 1; j < 5; j++) {
				// If they arent the same suit, then this can't work.
				if(hand[i][1] != hand[j][1]) {
					i1 = false;
				}
			}
		}
		if(i1) {
			prop_sameSuit = true; // Set a property; see Flush checker below
		}
		// Reuse i1 as a 'complete truth tracker' again
		i1 = true;
		// For each card but the last
		for(int i = 0; i < 4; i++) {
			// If the next card is not consecutivly after this card..
			if((tempOrderedCards[i] + 1) != tempOrderedCards[i + 1]) {
				// Then its not consecutive
				i1 = false;
			}
		}
		// If we are consecutive
		if(i1) {
			// Set the property
			prop_consecutive = true;
		}


		// Actual checking....
		if(prop_consecutive && prop_sameSuit) {
			// Then we have a SF!
			hasNotFoundWin = false;
			winMethod[0] = 'F';
			winMethod[1] = 'C';
			finalOrderedCards[0] = '?';
		}


	}

	// Full House: "FH"
	// Cant be consecutive
	if(!prop_consecutive && hasNotFoundWin) {
		// If the TOK comes BEFORE the pair in the FH (sorted hand)
		// -1 = TOK - WW
		// 1 = WW - TOK
		i1 = 0;

		i2 = 0; // Value of the triplet
		i3 = 0; // Value of the pair

		// Ordered, the first 2 cards and the last 2 cards need to match
		if((tempOrderedCards[0] == tempOrderedCards[1]) &&
				(tempOrderedCards[3] == tempOrderedCards[4])) {
			if(tempOrderedCards[2] == tempOrderedCards[0]) {
				i1 = -1; // Triplet comes first
			} else if(tempOrderedCards[2] == tempOrderedCards[4]) {
				i1 = 1; // Triplet comes second
			}
			// If there is a TOK and a Pair, we have a FH
			if(i1) {
				hasNotFoundWin = false;
				winMethod[0] = 'F';
				winMethod[1] = 'H';
				// If triplet comes second
				if(i1 == 1) {
					// Triplet comes second;
					i2 = tempOrderedCards[4];
					// Pair comes first
					i3 = tempOrderedCards[0];
				} else {
					// Triplet comes first
					i2 = tempOrderedCards[0];
					// Pair comes second;
					i3 = tempOrderedCards[4];
				}

				// Set the triplet as the first 3
				for(int i = 0; i < 3; i++) {
					finalOrderedCards[i] = i2;
				}

				// Set the pair as the last 2
				for(int i = 3; i < 5; i++) {
					finalOrderedCards[i] = i3;
				}

			}
		}
	}

	// Flush: "FL"
	if(hasNotFoundWin) {
		// Same suit tracking happened in Straight Flush checking
		if(prop_sameSuit) {
			hasNotFoundWin = false;
			winMethod[0] = 'F';
			winMethod[1] = 'L';
			// Tag the hand as needing to be ordered
			finalOrderedCards[0] = '?';
		}
	}

	// Straight: "ST"
	// If its consecutive,.... (eZ! hehe)
	if(prop_consecutive && hasNotFoundWin) {
		hasNotFoundWin = false;
		winMethod[0] = 'S';
		winMethod[1] = 'T';
		finalOrderedCards[0] = '?';
	}

	// Three of a kind: "TA"
	if(hasNotFoundWin) {
		for(int i = 0; i < 3; i++) {
			// i2, i3 represent the locations
			// of the cards that wouldnt be part of the TOK
			if(i == 0) {
				i2 = 3;
				i3 = 4;
			} else if(i == 1) {
				i2 = 0;
				i3 = 4;
			} else {
				i2 = 0;
				i3 = 1;
			}
		}
	}

	// Two Pair: "TP"
	if(hasNotFoundWin) {
		//TODO
	}

	// Pair: "WW"
	if(hasNotFoundWin) {
		//TODO
	}

	// High Card: "XC"
	if(hasNotFoundWin) {
		hasNotFoundWin = false;
		winMethod[0] = 'X';
		winMethod[1] = 'C';
		// Tag for sorting
		finalOrderedCards[0] = '?';

	}


	// If the orderedCards[] needs to be ordered by value, then do it...
	if(finalOrderedCards[0] == '?') {
		//Transfer the sorted values in
		for(int i = 0; i < 5; i++) {
			finalOrderedCards[i] = tempOrderedCards[i];
//			cout << finalOrderedCards[i] << "\n";
		}
	}
	tempChars[0] = winMethod[0];
	tempChars[1] = winMethod[1];
	tempChars[2] = '-';
	for (int i = 0; i < 5; i++) {
		tempChars[i + 3] = finalOrderedCards[i];
	}
	tempChars[8] = '\0'; // Make it a string
}
void evalWinMethod_Player() {
	evalWinMethod(hand_player);
	strcpy(outcome_player, tempChars);
}
void evalWinMethod_Dealer() {
	evalWinMethod(hand_dealer);
	strcpy(outcome_dealer, tempChars);
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
//		printFullCard(hand_player[i]);
//		cout << "" << "\n";
//	}

	discardStep();
	// Step 4
//	for(int i = 0; i < 5; i++) {
//		cout << "Card " << i + 1 << ": ";
//		printFullCard(hand_player[i]);
//		cout << "" << "\n";
//	}

	//TODO: Determine the winner, And how they won.
	evalWinMethod_Player();
	evalWinMethod_Dealer();
	cout << "Player: " << outcome_player << "\n";
	cout << "Dealer: " << outcome_dealer << "\n";


	//TODO: Implement Betting (See sheet)

	//TODO: EC: Do the game until the player reaches $0 or decides to quit.
	return 0;
}
