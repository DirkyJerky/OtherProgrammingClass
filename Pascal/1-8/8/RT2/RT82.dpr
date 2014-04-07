program RT82;

{
Name: Geoff Yoerger
Activity Runnign Total 8.2
Due: AHEAD
Purpose: Return the amount of students that fail or pass from input
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  lowerBounds : integer = 20;

var
  grade : char;
  totalPassed, totalFailed : integer;

  i : integer; // Counter


//************
//*  Prompt
//************
//*  Prompt the user for necessary information
//************

PROCEDURE Prompt(VAR gradePrompt : char; iterNum : integer);
BEGIN
  write('Student ', iterNum,': ');
  readln(gradePrompt);
  gradePrompt := UpCase(gradePrompt); // Make it uppercase
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (passedOut, failedOut : integer);
BEGIN
  writeln;
  writeln('Of your ', passedOut + failedOut, ' students,');
  writeln(passedOut, ' passed and');
  writeln(failedOut, ' failed.');
END;

//************
//*  Inc
//************
//*  Increment a counter by one
//************

PROCEDURE Inc (VAR counter : integer);
BEGIN
  counter := counter + 1;
END;



{MAIN ==========================================}
BEGIN
  FOR i := 1 to lowerBounds DO BEGIN
    Prompt(grade, i);
    IF(grade = 'F') THEN
      Inc(totalFailed)
    ELSE IF ((grade = 'A') OR (grade = 'B') OR (grade = 'C') OR (grade = 'D')) THEN
      Inc(totalPassed);
  END;
  Output(totalPassed, totalFailed);
  readln; // Halt
END.
 