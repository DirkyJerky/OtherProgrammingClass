program Boilerplate;

{
Name: Geoff Yoerger
Program 9(10).10
Due: AHEAD
Purpose: Calculate the total of a blackjack head.
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  card1, card2 : char;
  // 2 Cards
  cardTotal : integer;
  // And the Blackjack total



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to the black jack hand score calculator!');
  writeln;
END;


//************
//*  Outro
//************
//*  Tie up loose ends and halt the console.
//************

PROCEDURE Outro ();
BEGIN
  readln;
END;


//************
//*  Prompt
//************
//*  Prompt the user for necessary information
//************

PROCEDURE Prompt(VAR card1Get, card2Get : char);
BEGIN
  writeln;
  writeln('Ten is ''0''');
  writeln('What is Card 1?');
  readln(card1Get);
  writeln('What is Card 2?');
  readln(card2Get);
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (cardTotalValue : integer);
BEGIN
  IF (cardTotalValue = 22) THEN
    cardTotalValue := cardTotalValue - 10;
  writeln('Total = ', cardTotalValue);
END;

//************
//*  cardValue
//************
//*  Calculate the value of one card
//************
VAR
  USELESS : integer;
PROCEDURE cardValue (card : char; VAR Value : integer);
BEGIN
  CASE card OF
  '1', '2', '3', '4', '5', '6', '7', '8', '9':
    Val(card, Value, USELESS);
  '0', 'J', 'Q', 'K': Value := 10;
  'A': Value := 11;
  END;
END;


//************
//*  calcValue
//************
//*  Calculate the value of a black jack hand
//************
VAR
  tempValue : integer;
PROCEDURE calcValue (card1Calc, card2Calc : char; VAR totalValue : integer);
BEGIN
  totalValue := 0;
  cardValue(card1Calc, tempValue);
  totalValue := tempValue + totalValue;
  cardValue(card2Calc, tempValue);  
  totalValue := tempValue + totalValue;
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(card1, card2);
  calcValue(card1, card2, cardTotal);
  Output(cardTotal);

  Outro; // Halt the console
END.
 