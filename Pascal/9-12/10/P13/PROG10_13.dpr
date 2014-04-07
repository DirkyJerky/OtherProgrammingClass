program PROG10_13;

{
Name: Geoff Yoerger
Program 10.13
Due: AHEAD
Purpose: Total some characters
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  constant : Integer = 0;

type
  charzz = array['A'..'Z'] of integer;

var
  inputFactored : charzz;
  numChars : integer;
  i : integer; //Counter
  j : char; //Counter



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to ', 'the Character Totaler', '!');
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
  readln;
END;


//************
//*  Prompt
//************
//*  Prompt the user for necessary information
//************

PROCEDURE Prompt(VAR inputGet : charzz; VAR numCharsGet : integer );
BEGIN
  writeln('How many characters does your string contain?');
  readln(numCharsGet);
  writeln('Please enter your string of ', numCharsGet, ' characters.');
  FOR i := 1 TO numCharsGet DO BEGIN
    read(j);
    inputGet[Upcase(j)] := inputGet[Upcase(j)] + 1;
  END;
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (charsOut : charzz);
BEGIN
  FOR j := 'A' TO 'Z' DO BEGIN
    IF(charsOut[j] <> 0) THEN
      writeln(j, ': ', charsOut[j]);
  END;

END;



//************
//*  Init
//************
//*  Init our array
//************

PROCEDURE Init (charsInit : charzz);
BEGIN
  FOR j := 'A' TO 'Z' DO BEGIN
    charsInit[j] := 0;
  END;
END;


{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Init(inputFactored);
  Prompt(inputFactored, numChars);
  Output(inputFactored);

  Outro; // Halt the console
END.
 