program ACT63;

{
Name: Geoff Yoerger
Activit 6.3
Due: BEHIND
Purpose: Redo ACT2.1
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  burgers, fries, sodas : integer;
  // Number of food items in the order



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to Burger King 2.0!');
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
//*  GetOrder
//************
//*  Prompt the user for necessary information
//************

PROCEDURE GetOrder(VAR burgersGet, friesGet, sodasGet : integer);
BEGIN
  writeln;
  writeln('How many burgers do you want today?');
  readln(burgersGet); 
  writeln('How many fries?');
  readln(friesGet);
  writeln('Sodas?');
  readln(sodasGet);
END;



//************
//*  PrintReciept
//************
//*  Give the user back the information needed
//************

PROCEDURE PrintReciept (burgersOut, friesOut, sodasOut : integer);
BEGIN
  writeln;
  writeln('     Reciept'); 
  writeln('=================');
  writeln(burgersOut, ' Burger(s).....');
  writeln(friesOut,   ' Frie(s).......');
  writeln(sodasOut,   ' Soda(s).......');
END;





{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  GetOrder(burgers, fries, sodas); // Prompt the user for information
  PrintReciept(burgers, fries, sodas);

  Outro; // Halt the console
END.
 