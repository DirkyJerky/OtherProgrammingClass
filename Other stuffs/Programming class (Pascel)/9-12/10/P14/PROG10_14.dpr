program PROG10_14;

{
Name: Geoff Yoerger
Program 10.14
Due: AHEAD
Purpose: Calculate some fibonacci numbers
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  fibArray = array[1..20] of Integer;

var
  numS1, numS2 : integer;
  fibonArray : fibArray;



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to ', 'the fibonacci number generator', '!');
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

PROCEDURE Prompt(VAR num1Get, num2Get : integer);
BEGIN
  writeln;
  writeln('What is the first starting number of your series?');
  readln(num1Get);
  writeln('The second?');
  readln(num2Get);
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************
VAR
  i : integer;

PROCEDURE Output (fibOut : fibArray);
BEGIN
  writeln;
  FOR i := 1 TO 20 DO BEGIN
    writeln(fibOut[i]);
  END;
END;


//************
//*  Init
//************
//*  PURPOSE
//************
VAR
  j : integer;

PROCEDURE Init (VAR fibInit : fibArray; num1Init, num2Init : integer);
BEGIN
  fibInit[1] := num1Init;
  fibInit[2] := num2Init;
  FOR j := 3 TO 20 DO BEGIN
    fibInit[j] := 0;
  END;

END;

//************
//*  calcFib
//************
//*  PURPOSE
//************
VAR
  k : integer;

PROCEDURE calcFib (VAR fibCalc : fibArray);
BEGIN
  FOR k := 3 TO 20 DO BEGIN
    fibCalc[k] := fibCalc[k - 1] + fibCalc[k - 2];
  END;
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(numS1, numS2);
  Init(fibonArray, numS1, numS2);
  calcFib(fibonArray);
  Output(fibonArray);


  Outro; // Halt the console
END.
 