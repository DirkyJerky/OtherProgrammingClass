program PROG1_8;

{
Name: Geoff Yoerger
Activity/Program 0.0
Due: Sat 2 00 2014
Purpose: TODO
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  base : real;
  power : integer;
  // Base ^ power

  answer : real;

  i : Integer; // Counter


//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro (); BEGIN
  writeln('Welcome to the Exponet Calculator!');
END;



//************
//*  Outro
//************
//*  Tie up loose ends and halt the console.
//************

PROCEDURE Outro (); BEGIN
  readln;
END;



//************
//*  Prompt
//************
//*  Prompt the user for necessary information
//************

PROCEDURE Prompt(VAR baseGet : real; VAR powerGet : integer); BEGIN
  writeln;
  writeln('What is the base of your expression? (base ^ power)?');
  readln(baseGet);
  writeln('The power?');
  readln(powerGet);
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (baseOut, answerOut : real; powerOut : integer); BEGIN
  writeln;
  IF (answerOut = -1) THEN BEGIN
    writeln(baseOut:0:2, ' to the power of ', powerOut, ' is < 1.');
  END ELSE BEGIN
    writeln(baseOut:0:2, ' to the power of ', powerOut, ' is ', answerOut:0:2,'.');
  END;
END;



//************
//*  calcPower
//************
//*   PURPOSE
//************

PROCEDURE calcPower (baseCalc : real; powerCalc : integer; VAR answerCalc : real); BEGIN
  IF(powerCalc < 0) THEN
    answerCalc := -1
  ELSE IF (powerCalc = 0) THEN
    answerCalc := 1
    ELSE BEGIN
      answerCalc := 1;
      FOR i := 1 TO powerCalc DO BEGIN
        answerCalc := answerCalc * baseCalc;
      END;
    END;
END;



{MAIN ==========================================} BEGIN
  Intro; // Welcome the user

  Prompt(base, power);
  calcPower(base, power, answer);
  Output(base, answer, power);

  Outro; // Halt the console
END.
 