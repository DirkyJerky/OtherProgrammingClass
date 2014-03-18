program Boilerplate;

{
Name: Geoff Yoerger
Program 8.9
Due: AHEAD
Purpose: Calculate factorials
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  factInt : integer;
  // Users integer
  factorial : integer;
  // And the answer
  isNonNeg : boolean;
  // Validate if the users input is acceptable
  i : integer; // Counter



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to the factorial calculator!');
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

PROCEDURE Prompt(VAR factIntGet : integer);
BEGIN
  writeln;
  writeln('What is your integer?');
  readln(factIntGet);
END;


//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (factIntOut, factorialOut : integer);
BEGIN
  writeln;
  IF NOT(factorialOut = -1) THEN
    writeln(factIntOut, '! = ', factorialOut)
  ELSE
    writeln(factIntOut, '! = UNDEFINED');
END;


//************
//*  calcFactorial
//************
//* Calculate a factorial
//************

PROCEDURE calcFactorial (factInteger : integer; VAR factorialCalc : integer);
BEGIN
  factorialCalc := 1; // Init
  FOR i := 2 TO factInteger DO BEGIN   // 2 TO factInteger
    factorialCalc := factorialCalc * i;
  END;
END;

//************
//*  Validate
//************
//*  See if the users input is correct
//************

PROCEDURE Validate (input : integer; VAR isGood : boolean);
BEGIN
  IF ((input >= 0) AND (input <= 1000)) THEN
    isGood := true
  ELSE BEGIN
    isGood := false;
  END;
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(factInt);
  Validate(factInt, isNonNeg);
  IF (isNonNeg) THEN BEGIN // Validation
    calcFactorial(factInt, factorial);
    Output(factInt, factorial);
  END
  ELSE
    Output(factInt, -1);
  Outro; // Halt the console
END.
 