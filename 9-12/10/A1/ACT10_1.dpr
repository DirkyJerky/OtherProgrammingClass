program ACT10_1;

{
Name: Geoff Yoerger
Activity 10.1
Due: AHEAD
Purpose: Do some misc array stuffs
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  aInt20 = array[1..20] of Integer;

var
  ints : aInt20;
  sum : integer;

  i : integer;




//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to ', 'The array stuff do-er', '!');
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
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (arrayInts : aInt20);
BEGIN
  writeln;
  FOR i := 1 TO 20 DO BEGIN
    writeln('Cell ', i, ': ', arrayInts[i]);
  END;
END;


//************
//*  SumArray
//************
//*  Sum an array
//************

PROCEDURE SumArray (ourInts : aInt20; VAR sumSum : integer);
BEGIN
  sumSum := 0;
  FOR i := 1 TO 20 DO BEGIN
    sumSum := sumSum + ourInts[i];
  END;
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  FOR i := 1 TO 20 DO BEGIN
    ints[i] := 0;
  END;
  Output(ints); // Give the user the init information
  FOR i := 1 TO 20 DO BEGIN
    ints[i] := i;
  END;
  Output(ints);
  SumArray(ints, sum);
  writeln;
  writeln('Sum: ', sum);

  Outro; // Halt the console
END.
 