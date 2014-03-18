program ACT81;

{
Name: Geoff Yoerger
Activity 8.1
Due: AHEAD
Purpose: Print out a bunch of iterations
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
// Iteration bounds for our loops
// ALL CONSTANTS
  iter1Top, iter1Bottom : integer;
  iter2Top, iter2Bottom : char;
  iter3Top, iter3Bottom : integer;
  iter4Top, iter4Bottom : integer;
  iter51Top, iter51Bottom : integer;
  iter52Top, iter52Bottom : integer;

  iInt : integer;
  iChar : char;
  jInt : integer;
  // Temporary loopers




//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to The loop tester!');
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
//*  Init
//************
//*  Initialize information into variables
//************

PROCEDURE Init ();
BEGIN
  iter1Top := 0 ;
  iter1Bottom := 200 ;
  iter2Top := 'M' ;
  iter2Bottom := 'D' ;
  iter3Top := 1 ;
  iter3Bottom := 100 ;
  iter4Top := 1 ;
  iter4Bottom := 50 ;
  iter51Top := 1 ;
  iter51Bottom := 6 ;
  iter52Top := 1 ;
  iter52Bottom := 6 ;
END;


//************
//*  PrintItem
//************
//*  Print an item from a list, also spaces
//************

PROCEDURE PrintItem (condition : boolean; printThis : integer);
BEGIN
  IF condition THEN
    write(printThis, ' ');
END;

//************
//*  WritePair
//************
//*  Make a coord pair from two ints
//************

PROCEDURE writePair (first, second : integer);
BEGIN
  write('('); 
  write(first);
  write(',');
  write(second);
  write(')');
  write(' ');
  // Space the pairs
END;

 
//************
//*  Loop1
//************
//*  Iterations!
//************
PROCEDURE Loop1(upper, lower : integer);
BEGIN
  FOR iInt := upper TO lower
    // Calculate and print if it passes
    // Evens only
    DO PrintItem(((iInt MOD 2) = 0), iInt);
END;

//************
//*  Loop2
//************
//*  Iterations!
//************

PROCEDURE Loop2(upper, lower : char);
BEGIN
  FOR iChar := upper DOWNTO lower
    // Calculate and print if it passes
    // Always go through
    DO write(iChar + ' ');
END;

//************
//*  Loop3
//************
//*  Iterations!
//************

PROCEDURE Loop3(upper, lower : integer);
BEGIN
  FOR iInt := upper TO lower
    // Calculate and print if it passes
    // Every 10th number (11, 21, 32, etc)
    DO PrintItem((((iInt - 1) MOD 10) = 0), iInt);
END;

//************
//*  Loop4
//************
//*  Iterations!
//************
VAR runningTotal : integer;
PROCEDURE Loop4(upper, lower : integer);
BEGIN
  runningTotal := 0;
  FOR iInt := upper TO lower
    // Calculate and print if it passes
    DO BEGIN
      runningTotal := runningTotal + iInt;
      PrintItem((iInt = 50), runningTotal);
    END;
END;

//************
//*  Loop5
//************
//*  Iterations!
//************
PROCEDURE Loop5(upper, lower, upper2, lower2 : integer);
BEGIN
  FOR iInt := upper to lower DO
    FOR jInt := upper2 to lower2 DO BEGIN
      // Calculate and print if it passes
      // Always go through
      writePair(iInt, jInt);
    END;
END;


//************
//*  HandleLoops
//************
//*  PURPOSE
//************

PROCEDURE HandleLoops (
iter1TopHandle, iter1BottomHandle : integer;
iter2TopHandle, iter2BottomHandle : char;
iter3TopHandle, iter3BottomHandle : integer;
iter4TopHandle, iter4BottomHandle : integer;
iter51TopHandle, iter51BottomHandle : integer;
iter52TopHandle, iter52BottomHandle : integer
);
// ALL VARS
BEGIN
  Loop1(iter1TopHandle, iter1BottomHandle);
  writeln; // Seperate the lists
  writeln;
  Loop2(iter2TopHandle, iter2BottomHandle);
  writeln;
  writeln;
  Loop3(iter3TopHandle, iter3BottomHandle);
  writeln;
  writeln;
  Loop4(iter4TopHandle, iter4BottomHandle);
  writeln;
  writeln;
  Loop5(iter51TopHandle, iter51BottomHandle,
    iter52TopHandle, iter52BottomHandle);
END;


{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Init;
  // Inits ALL the bounds; Uses ALL CONSTANT VARS
  HandleLoops(
    iter1Top, iter1Bottom,
    iter2Top, iter2Bottom,
    iter3Top, iter3Bottom,
    iter4Top, iter4Bottom,
    iter51Top, iter51Bottom,
    iter52Top, iter52Bottom
  );
  // Uses ALL CONSTANT VARS

  Outro; // Halt the console
END.
 