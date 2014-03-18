program Boilerplate;

{
Name: Geoff Yoerger
Program 8.8
Due: AHEAD
Purpose: Make a multiplication table
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  leftBounds, topBounds : integer;
  // Size of the table, left -> y-axis, top -> x-axis

  i, j, k : integer; // Throw away counters



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to The multiplication table maker!');
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

PROCEDURE Prompt(VAR leftPrompt, topPrompt : integer);
BEGIN
  writeln;
  writeln('What is the height of the table you want to make?');
  readln(leftPrompt);
  writeln('The width?');
  readln(topPrompt);
  IF (topPrompt > 10) THEN
    topPrompt := 10;
  IF (leftPrompt > 10) THEN
    leftPrompt := 10;
END;


 
//************
//*  PrintCell
//************
//*  Print one cell of the table
//************

PROCEDURE PrintCell (multi1, multi2 : integer);
BEGIN
  write((multi1 * multi2):3, ' ');
END;



//************
//*  PrintRow
//************
//*  Print a row of the table
//************

PROCEDURE PrintRow (iteration : integer; topBoundsRow : integer);
BEGIN
  FOR j := 1 TO topBoundsRow DO BEGIN
    PrintCell(iteration, j);
  END;
  writeln;
END;


//************
//*  PrintTable
//************
//*  Write the multiplication table
//************

PROCEDURE PrintTable (topBoundsPrint, leftBoundsPrint : integer);
BEGIN
  writeln;
  writeln;
  FOR i := 1 to leftBoundsPrint DO BEGIN
    PrintRow(i, topBoundsPrint);
  END;
END;


{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(leftBounds, topBounds);
  PrintTable(leftBounds, topBounds);

  Outro; // Halt the console
END.
 