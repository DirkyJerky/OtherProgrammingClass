program ACT64;

{
Name: Geoff Yoerger
Activit 6.3
Due: BEHIND
Purpose: Convert dollars to pounds
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  Dollars, Pounds : real;
  // User's dollars and value in pounds.


//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to the Dollars 2 Pounds convert!');
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
//*  GetDollars
//************
//*  Prompt the user for necessary information
//************

PROCEDURE GetDollars(VAR DollarsGet : real);
BEGIN
  writeln;
  writeln('How many dollars do you have?');
  readln(DollarsGet);
END;


//************
//*  Convert
//************
//*  Convert dollars to pounds
//************

PROCEDURE Convert(DollarsConvert : real; VAR PoundsConvert : real);
BEGIN
  PoundsConvert := DollarsConvert * 2;
END;


//************
//*  Print
//************
//*  Give the user back the information needed
//************

PROCEDURE Print(DollarsPrint, PoundsPrint : real);
BEGIN
  writeln;
  writeln('You have ', DollarsPrint:0:2, ' Dollars which is also');
  writeln(PoundsPrint:0:2, ' Pounds.');
END;


{MAIN ==========================================}
BEGIN
  Intro;

  GetDollars(Dollars);
  Convert(Dollars, Pounds);
  Print(Dollars, Pounds);

  Outro; // Halt the console
END.
 