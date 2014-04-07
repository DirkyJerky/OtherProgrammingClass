program PROG66;

{
Name: Geoff Yoerger
Program 6.6
Due: AHEAD
Purpose: TODO
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  regMonth : String;
  firstName, lastName : String;



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to the registration date finder.');
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

PROCEDURE Prompt(VAR firstNamePrompt, lastNamePrompt : String);
BEGIN
  writeln;
  writeln('What is your first name?');
  readln(firstNamePrompt);
  writeln('What is your last name?');
  readln(lastNamePrompt);
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (regMonthOut, lastNameOut, firstNameOut : String);
BEGIN
  writeln;
  writeln('Dear Mr/Mrs ', firstNameOut, ' ', lastNameOut, ',');
  writeln('  Our automated system has requested to inform you');
  writeln('that your registration department will be open');
  writeln('to you in the month of ', regMonthOut, '.');
  writeln;
  writeln('Have a nice day,');
  writeln('  Metropolis Department of Motor Vehicles');
END;


//************
//*  calcRegMonth
//************
//*  PURPOSE
//************

PROCEDURE calcRegMonth (lastNameCalc : String; VAR regMonthCalc : String);
BEGIN
  IF((lastNameCalc >= 'A') AND (lastNameCalc <= 'G')) THEN
    regMonthCalc := 'March'
  ELSE IF ((lastNameCalc >= 'H') AND (lastNameCalc <= 'P')) THEN
    regMonthCalc := 'July'
  ELSE
    regMonthCalc := 'October';
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(firstName, lastName);
  calcRegMonth(lastName, regMonth);
  Output(regMonth, lastName, firstName);

  Outro; // Halt the console
END.
 