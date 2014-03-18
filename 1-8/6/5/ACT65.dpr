program ACT65;

{
Name: Geoff Yoerger
Activit 6.5
Due: BEHIND
Purpose: Get a user's weight on the moon
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
// Users pounds on the moon
  moonP : real;
  // And the earth
  earthP : real;



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to your moon weight calculator!');
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
//*  GetEWeight
//************
//*  Prompt the user for necessary information
//************

PROCEDURE GetEWeight(VAR earthPGet : real);
BEGIN
  writeln;
  writeln('How much do you weight on earth?');
  readln(earthPGet);
END;




//************
//*  Print
//************
//*  Give the user back the information needed
//************

PROCEDURE Print(earthPPrint, moonPPrint : real);
BEGIN
  writeln('Here on earth you would weigh ', earthPPRint:0:2, ' pounds, but');
  writeln('Up on the moon you would weigh just ', moonPPRint:0:2, '!');
  END;


//************
//*  CalcMWeight
//************
//*  PURPOSE
//************

PROCEDURE CalcMWeight(earthPCalc : real; VAR moonPCalc : real);
BEGIN
  moonPCalc := earthPCalc * 0.17;
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  GetEWeight(earthP);
  CalcMWeight(earthP, moonP);
  Print(earthP, moonP);
  Outro; // Halt the console
END.
 