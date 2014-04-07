program ACTPROG00;

{
Name: Geoff Yoerger
Activity 0.0
Program 0.0
Due: AHEAD
Purpose: TODO
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  constant : Integer = 0;

type
  arrayType = array[1..10] of Integer;

var
  TODO : real;
  TOD0 : integer;
  T0DO : char;
  T0D0 : boolean;
  RETURN : String;



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to ', '', '!');
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

PROCEDURE Prompt(VAR RETURN : String);
BEGIN
  writeln;
  writeln('What is TODO?');
  readln(RETURN);
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (RETURN : String);
BEGIN
  writeln;
  writeln('TODO is ', TODO:0:0);
  writeln('TODO1 is ', TODO1);
  writeln('TODO2 is ', TODO2);
  writeln('TODO3 is ', TODO3);
  writeln('RETURN is ', RETURN);
END;


//************
//*  PROCNAME
//************
//*  PURPOSE
//************

PROCEDURE PROCNAME (TODO : real; VAR RETURN : String);
BEGIN
  writeln('TODO is ', TODO:0:0);
  RETURN := 'Return ' + RETURN;
END;



{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Init(TODO, TODO1, TODO2, TODO3, RETURN); // Init the variables
  Output(TODO, TODO1, TODO2, TODO3, RETURN); // Give the user the init information
  Prompt(TODO, TODO1, TODO2, TODO3, RETURN); // Prompt the user for information
  PROCNAME(TODO, RETURN);
  Output(TODO, TODO1, TODO2, TODO3, RETURN);

  Outro; // Halt the console
END.
 