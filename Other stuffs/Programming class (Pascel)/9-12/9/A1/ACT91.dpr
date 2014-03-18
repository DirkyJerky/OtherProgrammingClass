program ACT91;

{
Name: Geoff Yoerger
Activity 9.1
Due: AHEAD
Purpose: Find the letter grade givin a 0-100 grade
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  numberGrade : integer;
  letterGrade : char;



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to the Grade Calculator!');
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

PROCEDURE Prompt(VAR gradeNumber : integer);
BEGIN
  writeln('What is the grade? (0-100)');
  readln(gradeNumber);
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (gradeChar : char);
BEGIN
  writeln;
  writeln('Your grade is a(n) ', gradeChar, '.');
END;


//************
//*  calcGradeChar
//************
//*  PURPOSE
//************

PROCEDURE calcGradeChar (gradeNumber : integer; VAR scoreCharCalc : char);
BEGIN
  CASE gradeNumber OF
    90..100:
      scoreCharCalc := 'A';
    80..89:
      scoreCharCalc := 'B';
    70..79:
      scoreCharCalc := 'C';
    60..69:
      scoreCharCalc := 'D';
    ELSE
      scoreCharCalc := 'F';
  END;
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(numberGrade);
  calcGradeChar(numberGrade, letterGrade);
  Output(letterGrade);

  Outro; // Halt the console
END.
 