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
char rawCardVals[] = {'A', 'C', 'E', 'J', 'L', 'N', 'O',
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
			cardDeck[cardsInDeck][0] = rawCardVals[i];
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
			return rawCardVals[i];
		}
	}
	// If its not in readableCharVals[]; return null
	return '\0';
}
char getReadableCardChar(char orderedChar) {
	char val = toupper(orderedChar);
	for(int i = 0; i < numCardValues; i++) {
		if(val != rawCardVals[i]) {
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
void printCardValue(char cardValue) {
	char name[10];
	switch(getReadableCardChar(cardValue)) {
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
	cout << name;
}

void printFullCard(char card[2], bool full) {
	char suit[10];
	//Val

	//Suit
	switch(card[1]) {
		case 'C': strcpy(suit, "Clubs"); break;
		case 'D': strcpy(suit, "Diamonds"); break;
		case 'H': strcpy(suit, "Hearts"); break;
		case 'S': strcpy(suit, "Spades"); break;
		case '\0': strcpy(suit, "\0"); break;
		default: strcpy(suit, "\0"); break;
	}
	printCardValue(card[0]);
	if(full) {
		cout << " of " << suit;
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

int nCardVal(char card) {
	for(int i = 0; i < 13; i++) {
		if(card == rawCardVals[i]) {
			return i;
		}
	}
	return -1;
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
	char handOrdered[5];
	// Init
	for(int i = 0; i < 5; i++) {
		handOrdered[i] = hand[i][0];
	}

	// 5 times...
	for(int i = 0; i < 5; i++) {
		//For every card BUT the last one..
		for(int j = 0; j < 4; j++) {
			//IF the next card is of GREATER VALUE
			// (lesser weight computationally);
			if(handOrdered[j] > handOrdered[j + 1]) {
				// Then swap them
				i1 = handOrdered[j];
				handOrdered[j] = handOrdered[j + 1];
				handOrdered[j + 1] = i1;
			}
		}
	}

	// Four of a kind: "FA"
	i1 = true;
	// If the middle three cards are the same...
	if((handOrdered[1] == handOrdered[2]) &&
			(handOrdered[2] == handOrdered[3])) {
		// Location of the odd card
		// -1 = handOrdered[0]
		// 0 = No FOAK
		// 1 = handOrdered[4]
		i1 = 0;
		if(handOrdered[0] == handOrdered[2]) {
			i1 = 1;
		} else if(handOrdered[2] == handOrdered[4]) {
			i1 = -1;
		}

		if(i1 != 0) {
			hasNotFoundWin = false;
			winMethod[0] = 'F';
			winMethod[1] = 'A';
			for(int i = 0; i < 4; i++) {
				finalOrderedCards[i] = handOrdered[2];
			}
			if(i1 == -1) {
				finalOrderedCards[4] = handOrdered[0];
			} else {
				finalOrderedCards[4] = handOrdered[4];
			}
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
			if((nCardVal(handOrdered[i]) + 1) != nCardVal(handOrdered[i + 1])) {
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
		// (0 = no full house)
		i1 = 0;

		i2 = 0; // Value of the triplet
		i3 = 0; // Value of the pair

		// Ordered, the first 2 cards and the last 2 cards need to match
		if((handOrdered[0] == handOrdered[1]) &&
				(handOrdered[3] == handOrdered[4])) {
			if(handOrdered[2] == handOrdered[0]) {
				i1 = -1; // Triplet comes first
			} else if(handOrdered[2] == handOrdered[4]) {
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
					i2 = handOrdered[4];
					// Pair comes first
					i3 = handOrdered[0];
				} else {
					// Triplet comes first
					i2 = handOrdered[0];
					// Pair comes second;
					i3 = handOrdered[4];
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
			// If the checking card and the 2 next cards are equal...
			// Then we have a TOK!
			if((handOrdered[i] == handOrdered[i + 1]) &&
					(handOrdered[i + 1] == handOrdered[i + 2])) {
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

				hasNotFoundWin = false;
				winMethod[0] = 'T';
				winMethod[1] = 'A';
				finalOrderedCards[0] = handOrdered[i];
				finalOrderedCards[1] = handOrdered[i];
				finalOrderedCards[2] = handOrdered[i];
				if(handOrdered[i2] < handOrdered[i3]) {
					finalOrderedCards[3] = handOrdered[i2];
					finalOrderedCards[4] = handOrdered[i3];
				} else {
					finalOrderedCards[3] = handOrdered[i3];
					finalOrderedCards[4] = handOrdered[i2];
				}
				break; // Break from our loop
			}
		}
	}
	// Two Pair: "TP"
	if(hasNotFoundWin) {
		// Locations of the first and second pairs
		i1 = -1;
		i2 = -1;
		// For each card but the last one...
		for(int i = 0; i < 4; i++) {
			// If this and the next card is the same
			if(handOrdered[i] == handOrdered[i + 1]) {
				i1 = i;// We found the first pair
				// Start again, but after the occurence
				for(int j = i + 1; j < 4; j++) {
					if(handOrdered[j] == handOrdered[j + 1]) {
						i2 = j;// We found a second pair!
					}
					// If weve found a second pair; break
					if(i2 != -1) {
						break;
					}
				}
			}
			// If weve found a first pair; break
			if(i1 != -1) {
				break;
			}
		}
		// If we found the first pair...
		if(i1 != -1) {
			//If we found a second pair...
			if(i2 != -1) {
				// Then we have a Two Pair!
				hasNotFoundWin = false;
				winMethod[0] = 'T';
				winMethod[1] = 'P';
				finalOrderedCards[0] = handOrdered[i1];
				finalOrderedCards[1] = handOrdered[i1 + 1];
				finalOrderedCards[2] = handOrdered[i2];
				finalOrderedCards[3] = handOrdered[i2 + 1];
				// If the odd card is the first card...
				if(i1 == 1) {
					finalOrderedCards[4] = handOrdered[0];
				} else if (i2 == 2) { // Or if the odd card is the last card...
					finalOrderedCards[4] = handOrdered[4];
				} else { // If not, then it has  to be the middle card
					finalOrderedCards[4] = handOrdered[2];
				}
			} else { // If not, we still found a pair...
				// So we have a Pair!
				hasNotFoundWin = false;
				winMethod[0] = 'W';
				winMethod[1] = 'W';
				finalOrderedCards[0] = handOrdered[i1];
				finalOrderedCards[1] = handOrdered[i1 + 1];
				switch(i1) {
					case 0: {
						finalOrderedCards[2] = handOrdered[2];
						finalOrderedCards[3] = handOrdered[3];
						finalOrderedCards[4] = handOrdered[4];
						break;
					}
					case 1: {
						finalOrderedCards[2] = handOrdered[0];
						finalOrderedCards[3] = handOrdered[3];
						finalOrderedCards[4] = handOrdered[4];
						break;
					}
					case 2: {
						finalOrderedCards[2] = handOrdered[0];
						finalOrderedCards[3] = handOrdered[1];
						finalOrderedCards[4] = handOrdered[4];
						break;
					}
					case 3: {
						finalOrderedCards[2] = handOrdered[0];
						finalOrderedCards[3] = handOrdered[1];
						finalOrderedCards[4] = handOrdered[2];
						break;
					}
				}

			}
		}
	}

	// Functionallity in Two Pair checking
	// Pair: "WW"
//	if(hasNotFoundWin) {
//		//
//	}

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
			finalOrderedCards[i] = handOrdered[i];
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

void printHandMethod(char topOutcome[9], char bottomOutcome[9]) {

	switch(topOutcome[0]) {
		case 'S': { // Straight
			cout << "Straight";
			if(topOutcome[0] == bottomOutcome[0]) {
				cout << " with High card ";
				printCardValue(topOutcome[3]);
			}
			break; // case 'S'
		}
		case 'W': { // Pair
			cout << "Pair";
			if(topOutcome[0] == bottomOutcome[0]) {
				cout << " of ";
				printCardValue(topOutcome[3]);
				cout << "s";
				if(topOutcome[3] == bottomOutcome[3]) {
					cout << ", high card ";
					printCardValue(topOutcome[5]);
					if(topOutcome[5] == bottomOutcome[5]) {
						cout << ", second high card ";
						printCardValue(topOutcome[6]);
						if(topOutcome[6] == bottomOutcome[6]) {
							cout << ", and low card ";
							printCardValue(topOutcome[7]);
						}
					}
				}
			}

			break; // case 'W'
		}
		case 'X': { // High card
			cout << "High Card ";
			printCardValue(topOutcome[3]);
			if(topOutcome[3] == bottomOutcome[3]) {
				cout << ", second high card ";
				printCardValue(topOutcome[4]);
				if(topOutcome[4] == bottomOutcome[4]) {
					cout << ", third high card ";
					printCardValue(topOutcome[5]);
					if(topOutcome[5] == bottomOutcome[5]) {
						cout << ", fourth high card ";
						printCardValue(topOutcome[6]);
						if(topOutcome[6] == bottomOutcome[6]) {
							cout << ", and low card ";
							printCardValue(topOutcome[7]);
						}
					}
				}
			}
			break; // case 'X'
		}
		case 'F': { // FOAK, SF, FH, FL
			switch(topOutcome[1]) {
				case 'A': {
					cout << "Four of a Kind";
					if(topOutcome[0] == bottomOutcome[0] &&
							topOutcome[1] == bottomOutcome[1]) {
						cout << " of ";
						printCardValue(topOutcome[3]);
						cout << "s";
					}
					break; // case 'FA'
				}
				case 'C': {
					cout << "Straight Flush";
					if(topOutcome[0] == bottomOutcome[0] &&
							topOutcome[1] == bottomOutcome[1]) {
						cout << " of high ";
						printCardValue(topOutcome[3]);
					}
					break; // case 'FC'
				}
				case 'H': {
					cout << "Full House";
					if(topOutcome[0] == bottomOutcome[0] &&
							topOutcome[1] == bottomOutcome[1]) {
						cout << " with Triple ";
						printCardValue(topOutcome[3]);
						cout << "s";
					}
					break; // case 'FH'
				}
				case 'L': {
					cout << "Flush";
					if(topOutcome[0] == bottomOutcome[0] &&
							topOutcome[1] == bottomOutcome[1]) {
						cout << " with high card ";
						printCardValue(topOutcome[3]);
						if(topOutcome[3] == bottomOutcome[3]) {
							cout << ", second high card ";
							printCardValue(topOutcome[4]);
							if(topOutcome[4] == bottomOutcome[4]) {
								cout << ", third high card ";
								printCardValue(topOutcome[5]);
								if(topOutcome[5] == bottomOutcome[5]) {
									cout << ", fourth high card ";
									printCardValue(topOutcome[6]);
									if(topOutcome[6] == bottomOutcome[6]) {
										cout << ", and low card ";
										printCardValue(topOutcome[7]);
									}
								}
							}
						}
					}
					break; // case 'FL'
				}
				default: {
					cout << "UNKNOWN WIN METHOD: " << topOutcome[0] << topOutcome[1];
				}
			}
			break; // case 'F'
		}
		case 'T': {
			switch(topOutcome[1]) {
				case 'A': {
					cout << "Three of a kind";
					if(topOutcome[0] == bottomOutcome[0] &&
							topOutcome[1] == bottomOutcome[1]) {
						cout << " of ";
						printCardValue(topOutcome[3]);
						cout << "s";
					}
					break; // case 'TA'
				}
				case 'P': {
					cout << "Two Pair";
					if(topOutcome[0] == bottomOutcome[0] &&
							topOutcome[1] == bottomOutcome[1]) {
						cout << ", with High pair of ";
						printCardValue(topOutcome[3]);
						cout << "s";
						if(topOutcome[3] == bottomOutcome[3]) {
							cout << ", Low pair of ";
							printCardValue(topOutcome[5]);
							cout << "s";
							if(topOutcome[5] == bottomOutcome[5]) {
								cout << ", and high card ";
								printCardValue(topOutcome[7]);

							}
						}
					}
					break; // case 'TP'
				}

				default: {
					cout << "UNKNOWN WIN METHOD: " << topOutcome[0] << topOutcome[1];
				}
			}
			break; // case 'T'
		}
		default: {
			cout << "UNKNOWN WIN METHOD: " << topOutcome[0] << topOutcome[1];
		}
	}
	cout << "." << "\n";
}

int printWinMethod() {
	int result = strcmp(outcome_player, outcome_dealer);
	char winnersOutcome[9];
	char losersOutcome[9];
	cout << "\n\n";
	if(result < 0) {
		for(int i = 0; i < 9; i++) {
			winnersOutcome[i] = outcome_player[i];
			losersOutcome[i] = outcome_dealer[i];
		}
		cout << "You win with a:" << "\n\t";
		printHandMethod(winnersOutcome, losersOutcome);
		cout << "The dealer got a:" << "\n\t";
		printHandMethod(losersOutcome, winnersOutcome);
	} else if (result > 0) {
		for(int i = 0; i < 9; i++) {
			winnersOutcome[i] = outcome_dealer[i];
			losersOutcome[i] = outcome_player[i];
		}
		cout << "Dealer wins with a:" << "\n\t";
		printHandMethod(winnersOutcome, losersOutcome);
		cout << "You got a:" << "\n\t";
		printHandMethod(losersOutcome, winnersOutcome);
	} else {
		for(int i = 0; i < 9; i++) {
			winnersOutcome[i] = outcome_player[i];
			losersOutcome[i] = outcome_player[i];
		}
		cout << "It was a Tie!... You and the dealer got a:" << "\n\t";
		printHandMethod(winnersOutcome, losersOutcome);
	}
	return result;
}

void printDealersHand() {
	cout << "\n";
	cout << "The dealer has the following cards:" << "\n";
	for(int i = 0; i < 5; i++) {
		cout << i + 1 << ": ";
		printFullCard(hand_dealer[i]);
		cout << "\n";
	}
}

int bettingMoney = 50;

int betDiscardBet() {
	cout << "\n\n\n\n\n";
	cout << "You have the following cards:" << "\n";
	for(int i = 0; i < 5; i++) {
		cout << i + 1 << ": ";
		printFullCard(hand_player[i]);
		cout << "" << "\n";
	}
	int theBet, newBet;
	cout << "\n(You can bet between 1 and " << bettingMoney << " dollars)" << "\n";
	cout << "How much dollars do you bet on your hand?: ";
	cin >> theBet;

	discardStep();

	cout << "You now have the following cards after discarding:" << "\n";
	for(int i = 0; i < 5; i++) {
		cout << i + 1 << ": ";
		printFullCard(hand_player[i]);
		cout << "" << "\n";
	}
	cout << "How much more dollars do you bet now, if any?: ";
	cin >> newBet;

	if(theBet < 1) theBet = 1;
	if(theBet > bettingMoney) theBet = bettingMoney;
	if(newBet < 0) newBet = 0;

	theBet = theBet + newBet;
	if(theBet > bettingMoney) theBet = bettingMoney;
	return theBet;
}
/**
 * @return If the program ended succesfully
 */
int main() {
	cout << "You sit down at the five card draw table with 50 dollars." << "\n";
	int bet, winner;
	do {
		fillDeck();
		srand(time(0)); // Seed the rand()
		fillHandsInit();
		bet = betDiscardBet();
		printDealersHand();
		evalWinMethod_Player();
		evalWinMethod_Dealer();
		winner = printWinMethod();
		cout << "\n";
		if(winner < 0) {
			cout << "You win " << bet << " dollars!" << "\n";
			bettingMoney += bet;
		} else if (winner > 0) {
			cout << "You lose " << bet << " dollars." << "\n";
			bettingMoney -= bet;
		} else {
			cout << "You keep your bet" << "\n";
		}
		if(bettingMoney > 0) {
			cout << "You now have " << bettingMoney << " Dollars." << "\n";
			cout << "Do you want to continue playing? ";
		} else {
			break;
		}
		// If we dont have enough money it will skip yesNo()
	} while(yesNo());
	cout << "You leave the five card draw table with " << bettingMoney << " dollars in your pocket." << "\n";
//	cout << "Player Outcome: " << outcome_player << "\n";
//	cout << "Dealer Outcome: " << outcome_dealer << "\n";
	return 0;
}
