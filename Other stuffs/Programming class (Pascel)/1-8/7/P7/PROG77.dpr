program PROG77;

{
Name: Geoff Yoerger
Program 7.7
Due: AHEAD
Purpose: TODO
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  preTotal, finalTotal : real;  // User's Pre-total and final total after discount
  discount : real; // And the discount amount
  firstName, lastName : String;   // with the User's name



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro (); BEGIN
  writeln('Welcome to Shutter-Bug Camera Store''s automated checkout line.');
END;



//************
//*  Outro

//************
//*  Tie up loose ends and halt the console.
//************

PROCEDURE Outro (); BEGIN
  readln;
END;



//************
//*  Prompt
//************
//*  Prompt the user for necessary information
//************

PROCEDURE Prompt(VAR preTotal : real; VAR fristName, lastName : String); BEGIN
  writeln('What is your first name?');
  readln(firstName);
  writeln('What is your last name?');
  readln(lastName);
  writeln('What is Your pre-total?');
  readln(preTotal);
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************
VAR
  discountAmount : real;
PROCEDURE Output (preTotal, finalTotal : real; firstName, lastName : String); BEGIN
  writeln;
  writeln;
  discountAmount := preTotal - finalTotal;
  writeln('Shutter-Bug Camera Store');
  writeln('Official Reciept');
  writeln('Mr/Mrs. ', firstName, ' ', lastName);
  writeln;
  writeln('Pre-total: $', preTotal:0:2);
  writeln('  - ');
  writeln('Discount: $', discountAmount:0:2);
  writeln('===================');
  writeln('Final Total: $', finalTotal:0:2);
  writeln;
  writeln('Have a nice day.');

END;




//************
//*  calcDiscount
//************
//*   PURPOSE
//************

PROCEDURE calcDiscount (preTotal : real; VAR discount, finalTotal : real); BEGIN
  IF (preTotal >= 1500) THEN
    discount := 0.2
  ELSE IF (preTotal >= 750) THEN
    discount := 0.13
  ELSE
    discount := 0;

  finalTotal := preTotal - (preTotal * discount);
END;



{MAIN ==========================================} BEGIN
  Intro; // Welcome the user

  Prompt(preTotal, firstName, lastName); // Prompt the user for information
  calcDiscount(preTotal, discount, finalTotal);
  Output(preTotal, finalTotal, firstName, lastName);

  Outro; // Halt the console
END.
 