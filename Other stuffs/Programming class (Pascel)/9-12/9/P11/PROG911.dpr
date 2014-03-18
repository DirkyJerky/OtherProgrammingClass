program PROG9_11;

{
Name: Geoff Yoerger
Program 9.11
Due: AHEAD
Purpose: Print a summary of 20 quiz scores
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  numQuizes : Integer = 20;
  scoreMax : Integer = 5;
  scoreMin : Integer = 0;

var
  scores : array[0..5] of Integer;
  average : real;            
  i : integer; // Counter
  scoreTemp : integer; // Temp integer used for putting into array


//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to ', 'the Score Totaler', '!');
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
//*  validate
//************
//*  Make sure a value is within a range
//************

PROCEDURE validate (VAR validatee : integer);
BEGIN
  IF (validatee > scoreMax) THEN
    validatee := scoreMax
  ELSE IF (validatee < scoreMin) THEN
    validatee := scoreMin;
END;


//************
//*  Prompt
//************
//*  Prompt the user for necessary information
//************

PROCEDURE Prompt(VAR scoreGet : integer; iteration : integer);
BEGIN
  IF(iteration = 1) THEN
    write('What is score #1? ')
  ELSE IF(iteration = 2) THEN
    write('Score #2: ')
  ELSE
    write('#', iteration, ': ');
  readln(scoreGet);
  validate(scoreGet);
END;

//************
//*  calcAverage
//************
//*  Calculate the average of numbers in a array
//************
PROCEDURE calcAverage (scoresOut : array of integer; VAR average : real);
BEGIN
  average := 0.0;
  FOR i := scoreMin TO scoreMax DO BEGIN
    average := average + (i * scoresOut[i]);
  END;
  average := average / numQuizes
END;

//************
//*  Output
//************
//*  Give the user back the information needed
//************
PROCEDURE Output (scoresOut : array of integer; average : real);
BEGIN
  writeln;
  FOR i := scoreMin TO scoreMax DO BEGIN
    writeln('Students who scored ', i, ' points: ', scoresOut[i]);
  END;
  writeln('Average class score: ', average:0:3);
END;


//************
//*  getInputs
//************
//*  PURPOSE
//************

PROCEDURE getInputs (VAR scoresGet : array of integer);
BEGIN
  for i := 1 TO numQuizes DO BEGIN
    Prompt(scoreTemp, i);
    scoresGet[scoreTemp] := scoresGet[scoreTemp] + 1;
  END;
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  getInputs(scores);
  calcAverage(scores, average);
  Output(scores, average);

  Outro; // Halt the console
END.

