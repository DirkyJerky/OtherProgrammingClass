program ACT10_RT3;

{
Name: Geoff Yoerger
Activity 10.RT3
Due: AHEAD
Purpose: Get 20 scores and calc the average
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  scoreArrayType = array[1..20] of Integer;

var
  scoreArray : scoreArrayType; // Score tracking array
  average : real; // Average score
  aScore : integer; // Temp score variable
  i : integer; // Counter



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to ', 'The score summarizer', '!');
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

PROCEDURE Output (scoresArrayOut : scoreArrayType; averageOut : real);
BEGIN
  writeln;
  writeln('The average is ', averageOut:0:2);
  writeln;
  FOR i := 1 TO 20 DO BEGIN
    writeln('Student ', i, ': ', scoresArrayOut[i]);
  END;
END;


//************
//*  getScore
//************
//*  Get the scores -> array
//************

PROCEDURE getScores (VAR scoresArrayGet : scoreArrayType);
BEGIN
  writeln('Please enter 20 scores: ');
  FOR i := 1 TO 20 DO BEGIN
    readln(aScore);
    scoresArrayGet[i] := aScore;
  END;
END;


//************
//*  calcAverage
//************
//*  Calc the average of an array
//************

PROCEDURE calcAverage (theArray : scoreArrayType; VAR averageCalc : real);
BEGIN
  averageCalc := 0;
  FOR i := 1 TO 20 DO BEGIN
    averageCalc := averageCalc + theArray[i];
  END;
  averageCalc := averageCalc / 20;
END;




{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  getScores(scoreArray);
  calcAverage(scoreArray, average);
  Output(scoreArray, average);

  Outro; // Halt the console
END.
 